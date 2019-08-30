--[[
--连续充值活动
--]]
local ACT_ID = 66
local PayParamKey = 773
local OPT_TYPE = 238
local CONSUME_TYPE = 238
local FLY = 0
local TIME_PARAM_KEY = 829

function GatherKeepPayWhichAwardCanGet(player, conf, startTime, endTime)
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

function clearGatherKeepPayActivityInfo(player)
		player:set_param_action(PayParamKey, 0)
		player:set_param_misc(PayParamKey, 0)
		player:set_param_type(PayParamKey, 0)
end

function GatherKeepPayActivityInfo(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_KeepPayConf)
	local flag = IsResetActivityAwardFlagInfo(player, conf, PayParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(PayParamKey, 0)
		player:set_param_misc(PayParamKey, 0)
		player:set_param_type(PayParamKey, conf.version)
	end
	local action, misc, type_ = player:get_param_all_info(PayParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
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
		local canGet, max = GatherKeepPayWhichAwardCanGet(player, conf, startTime, endTime)
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


function CheckKeepPayCanGetAwardByIndex(player, conf, index, startTime, endTime)
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

function CheckKeepPayCanGetAward(player, conf, startTime, endTime)
	for index , v in pairs(conf.award or {}) do
		local flag = CheckKeepPayCanGetAwardByIndex(player, conf, index, startTime, endTime)
		if flag == true then
			return 1
		end
	end
	return 0
end

function HandlerGetKeepPayActivityAwardByIndex(player, index)
	--判断
	local conf, startTime, endTime = GetOperActivityConfig(g_KeepPayConf)
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
	
	local flag, errMsg = CheckKeepPayCanGetAwardByIndex(player, conf, index, startTime, endTime)
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
end


function IsKeepPayActivityHasAward(player, conf, startTime, endTime)
	local flag = IsResetActivityAwardFlagInfo(player, conf, PayParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(PayParamKey, 0)
		player:set_param_misc(PayParamKey, 0)
		player:set_param_type(PayParamKey, conf.version)
	end
	local status = CheckKeepPayCanGetAward(player, conf, startTime, endTime)
	return status
end

function GatherKeepPayActivityStatus(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_KeepPayConf)
	local open = 0
	if conf ~= nil then
		local status = IsKeepPayActivityHasAward(player, conf, startTime, endTime)
		open = 1
		return open, startTime, endTime, status
	end

	return open, 0, 0, 0
end


function CheckKeepPayIsOpen(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_KeepPayConf)
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

function NotifyKeepPayDataChange(player)
	if CheckKeepPayIsOpen(player) == 1 then
		local conf, startTime, endTime = GetOperActivityConfig(g_KeepPayConf)
		local canGet = GatherKeepPayWhichAwardCanGet(player, conf, startTime, endTime)
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


