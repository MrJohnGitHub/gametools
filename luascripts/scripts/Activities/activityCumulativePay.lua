local ACT_ID = 68
local CumulativePayParamKey = 778
local OPT_TYPE = 251
local CONSUME_TYPE = 251
local FLY = 0
local TIME_PARAM_KEY = 821
function clearGatherCumulativePayActivityInfo(player)
		player:set_param_action(CumulativePayParamKey, 0)
		player:set_param_misc(CumulativePayParamKey, 0)
		player:set_param_type(CumulativePayParamKey, 0)
end

function GatherCumulativePayActivityInfo(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_CumulativePay)
	local flag = IsResetActivityAwardFlagInfo(player, conf, CumulativePayParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(CumulativePayParamKey, 0)
		player:set_param_misc(CumulativePayParamKey, 0)
		player:set_param_type(CumulativePayParamKey, conf.version)
	end
	local action, misc, type_ = player:get_param_all_info(CumulativePayParamKey)
	local retMsg = 
	{
		startTime = startTime,
		endTime = endTime,
		actid = ACT_ID,
		pay = action,
		awardFlag = misc,
	}	

	if conf ~= nil then
		retMsg.award = conf.award
		retMsg.icon = conf.icon
	end
	print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_INFO_MSG_ID, 0, encode(retMsg))
end


function CheckCumulativePayCanGetAwardByIndex(player, conf, index)
	if conf.award == nil or conf.award[index] == nil then
		local errMsg = "奖励配置不存在"
		return false, errMsg
	end
	local flag = IsResetActivityAwardFlagInfo(player, conf, CumulativePayParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(CumulativePayParamKey, 0)
		player:set_param_misc(CumulativePayParamKey, 0)
		player:set_type(CumulativePayParamKey, conf.version)
	end
	local action, misc, type_ = player:get_param_all_info(CumulativePayParamKey)
	if conf.award[index].minPay > action then
		local errMsg = "今日累计充值金额不足，不能领取奖励"
		return false, errMsg
	end

	if player:num_bag_black(0) < conf.award[index].itemCount then
		local errMsg = "背包不足,请先清理背包"
		return false, errMsg 
	end

	local flag = GetBitFlagByIndex(misc, index)
	if flag == 1 then
		local errMsg = "奖励已经领取过，不能重复领取"
		return false, errMsg 
	end
	return true
end

function CheckCumulativePayCanGetAward(player, conf)
	for index , v in pairs(conf.award or {}) do
		local flag = CheckCumulativePayCanGetAwardByIndex(player, conf, index)
		if flag == true then
			return 1
		end
	end
	return 0
end

function HandlerGetCumulativePayActivityAwardByIndex(player, index)
	--判断
	local conf, startTime, endTime = GetOperActivityConfig(g_CumulativePay)
	if conf == nil then
		local errMsg = "不在活动期间内"
		player:alert(10,0,0,errMsg)
		return 
	end
	
	local flag, errMsg = CheckCumulativePayCanGetAwardByIndex(player, conf, index)
	if flag == false then
		player:alert(10,0,0,errMsg)
		return 
	end
	--发奖励
	--更新状态
	player:set_param_misc_index_flag(CumulativePayParamKey, index)
	for k, v in pairs(conf.award[index].awardList or {}) do
		player:NewAddItem(v.itemid, v.count, OPT_TYPE, CONSUME_TYPE, FLY, v.bind)
	end
	local action, misc, type_ = player:get_param_all_info(CumulativePayParamKey)
	local retMsg = 
	{
		actid = ACT_ID,
		pay = action,
		awardFlag = misc,
	}
	-- print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_GET_AWARD_MSG_ID, 0, encode(retMsg))
	
	g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>领取了<font color='#ff0000'>累充豪礼</font>" ..conf.award[index].minPay.."元宝奖励,每日累计充值档次越高,奖励越丰厚！<font color='#0be140'>{_showSysWin,我也要领取,Open_Festive,68}</font>");
end


function IsCumulativePayActivityHasAward(player, conf)
	local flag = IsResetActivityAwardFlagInfo(player, conf, CumulativePayParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(CumulativePayParamKey, 0)
		player:set_param_misc(CumulativePayParamKey, 0)
		player:set_param_type(CumulativePayParamKey, conf.version)
	end
	local status = CheckCumulativePayCanGetAward(player, conf)
	return status
end

function GatherCumulativePayActivityStatus(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_CumulativePay)
	local open = 0
	if conf ~= nil then
		local status = IsCumulativePayActivityHasAward(player, conf)
		open = 1
		return open, startTime, endTime, status
	end

	return open, 0, 0, 0
end


function CheckCumulativePayIsOpen(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_CumulativePay)
	local open = 0
	if conf ~= nil then
		local flag = IsResetActivityAwardFlagInfo(player, conf, CumulativePayParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
		if flag == true then
			player:set_param_action(CumulativePayParamKey, 0)
			player:set_param_misc(CumulativePayParamKey, 0)
			player:set_param_type(CumulativePayParamKey, conf.version)
		end
		open = 1
	end
	return open
end

function NotifyCumulativePayDataChange(player, pay)
	if CheckCumulativePayIsOpen(player) == 1 then
		local arr = {}
		local retMsg = 
		{
			arr = arr
		}
		local value = player:get_param(CumulativePayParamKey) + pay
		player:set_param(CumulativePayParamKey, value)
		local info = {actid = ACT_ID, key = value}
		table.insert(arr, info)
		--print_r(retMsg)
		player:SendPacketToSelf(4804, 0, encode(retMsg))
	end
end
