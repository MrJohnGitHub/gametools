--[[
7天充值活动
--]]
local ACT_ID = 62
local PayParamKey = 765
local OPT_TYPE = 262
local CONSUME_TYPE = 262
local FLY = 0
local TIME_PARAM_KEY = 831

function GatherSevenDayWhichAwardCanGet(player, conf, startTime, endTime)
	local award = conf.award
	local canGet = 0
	local max = 0
	for i = 1, #award do
		local minPay = award[i].minPay
		local minCount = award[i].minCount
		local count = player:GetGreaterParamCount(minPay, startTime - 3600, endTime)
		if count >= minCount then
			canGet = SetBitFlagByIndex(canGet, i)
			max = i
		end
	end
	return canGet, max
end

function clearGatherSevenDayPayActivityInfo(player)
		player:set_param_action(PayParamKey, 0)
		player:set_param_misc(PayParamKey, 0)
		player:set_param_type(PayParamKey, 0)
end

function GatherSevenDayPayActivityInfo(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_SevenDayPayConf)
	local flag = IsResetActivityAwardFlagInfo(player, conf, PayParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(PayParamKey, 0)
		player:set_param_misc(PayParamKey, 0)
		player:set_param_type(PayParamKey, conf.version)
	end
	local action, misc, type_ = player:get_param_all_info(PayParamKey)
	local retMsg = 
	{
		startTime = startTime,
		endTime = endTime,
		actid = ACT_ID,
		awardFlag = misc,
		canGet = 0,
		nextShow = 0,
	}	

	if conf ~= nil then
		local canGet, max = GatherSevenDayWhichAwardCanGet(player, conf, startTime, endTime)
		retMsg.award = conf.award
		retMsg.icon = conf.icon
		retMsg.canGet = canGet
		local needMoney = 1
		if conf.award and conf.award[max+1] then
			needMoney = conf.award[max+1].minPay
		end
		retMsg.nextShow = player:GetTomorrowPayIconShow(needMoney)
	end
	print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_INFO_MSG_ID, 0, encode(retMsg))
end


function CheckSevenDayPayCanGetAwardByIndex(player, conf, index, startTime, endTime)
	if conf.award == nil or conf.award[index] == nil then
		local errMsg = "奖励配置不存在"
		return false, errMsg
	end
	local flag = IsResetActivityAwardFlagInfo(player, conf, PayParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(PayParamKey, 0)
		player:set_param_misc(PayParamKey, 0)
		player:set_type(PayParamKey, conf.version)
	end
	local minPay = conf.award[index].minPay
	local minCount = conf.award[index].minCount
	local count = player:GetGreaterParamCount(minPay, startTime - 3600, endTime)
	if count < minCount then
		local errMsg = "累计充值不足，不能领取奖励"
		return false, errMsg
	end
	local action, misc, type_ = player:get_param_all_info(PayParamKey)
	local flag = GetBitFlagByIndex(misc, index)
	if flag == 1 then
		local errMsg = "奖励已经领取过，不能重复领取"
		return false, errMsg 
	end
	return true
end

function CheckSevenDayPayCanGetAward(player, conf, startTime, endTime)
	for index , v in pairs(conf.award or {}) do
		local flag = CheckSevenDayPayCanGetAwardByIndex(player, conf, index, startTime, endTime)
		if flag == true then
			return 1
		end
	end
	return 0
end

function HandlerGetSevenDayPayActivityAwardByIndex(player, index)
	--判断
	local conf, startTime, endTime = GetOperActivityConfig(g_SevenDayPayConf)
	if conf == nil then
		local errMsg = "不在活动期间内"
		player:alert(10,0,0,errMsg)
		return 
	end
	
	if index == nil or conf.award[index] == nil then
		local errMsg = "奖励下标有误"
		player:alert(10,0,0,errMsg)
		return 
	end
	
	if player:num_bag_black(0) < conf.award[index].itemCount then
		local errMsg = "背包不足,请先清理背包"
		player:alert(10,0,0,errMsg)
		return 
	end
	
	local flag, errMsg = CheckSevenDayPayCanGetAwardByIndex(player, conf, index, startTime, endTime)
	if flag == false then
		player:alert(10,0,0,errMsg)
		return 
	end
	--发奖励
	--更新状态
	player:set_param_misc_index_flag(PayParamKey, index)
	for k, v in pairs(conf.award[index].awardList or {}) do
		player:NewAddItem(v.itemid, v.count, OPT_TYPE, CONSUME_TYPE, FLY, v.bind)
	end
	local action, misc, type_ = player:get_param_all_info(PayParamKey)
	local retMsg = 
	{
		actid = ACT_ID,
		awardFlag = misc,
	}
	-- print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_GET_AWARD_MSG_ID, 0, encode(retMsg))
	HandlerGatherOpenActivityInfo(player, ACT_ID)
	if conf.award[index].bigAward == 0 then
		g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>领取了<font color='#ff0000'>七日充值</font>第" ..index.."天奖励,参与活动还有神秘最终大奖等着你！<font color='#0be140'>{_showSysWin,我也要领取,Open_Festive,62}</font>")
	else
		g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>领取了<font color='#ff0000'>七日充值</font>最终大奖！心动不如行动,快来参与！<font color='#0be140'>{_showSysWin,我也要领取,Open_Festive,62}</font>")
	end
end


function IsSevenDayPayActivityHasAward(player, conf, startTime, endTime)
	local flag = IsResetActivityAwardFlagInfo(player, conf, PayParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(PayParamKey, 0)
		player:set_param_misc(PayParamKey, 0)
		player:set_param_type(PayParamKey, conf.version)
	end
	local status = CheckSevenDayPayCanGetAward(player, conf, startTime, endTime)
	return status
end

function GatherSevenDayPayActivityStatus(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_SevenDayPayConf)
	local open = 0
	if conf ~= nil then
		local status = IsSevenDayPayActivityHasAward(player, conf, startTime, endTime)
		open = 1
		return open, startTime, endTime, status
	end

	return open, 0, 0, 0
end


function CheckSevenDayPayIsOpen(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_SevenDayPayConf)
	local open = 0
	if conf ~= nil then
		local flag = IsResetActivityAwardFlagInfo(player, conf, PayParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
		if flag == true then
			player:set_param_action(PayParamKey, 0)
			player:set_param_misc(PayParamKey, 0)
			player:set_param_type(PayParamKey, conf.version)
		end
		open = 1
	end
	return open
end

function NotifySevenDayPayDataChange(player)
	if CheckSevenDayPayIsOpen(player) == 1 then
		local conf, startTime, endTime = GetOperActivityConfig(g_SevenDayPayConf)
		local canGet = GatherSevenDayWhichAwardCanGet(player, conf, startTime, endTime)
		local arr = {}
		local retMsg = 
		{
			arr = arr
		}
		local info = {actid = ACT_ID, key = canGet}
		table.insert(arr, info)
		player:SendPacketToSelf(4804, 0, encode(retMsg))
	end
end


