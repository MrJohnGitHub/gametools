
--[[
圣诞每日累消活动
--]]

local ACT_ID = 50
local DayCostParamKey = 757
local OPT_TYPE = 254
local CONSUME_TYPE = 111
local FLY = 0
local TIME_PARAM_KEY = 839;

function clearGatherDayCostActivityInfo(player)
		player:set_param_action(DayCostParamKey, 0)
		player:set_param_misc(DayCostParamKey, 0)
		player:set_param_type(DayCostParamKey, 0)
end

function GatherDayCostActivityInfo(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_DayCost)
	local flag = IsResetActivityAwardFlagInfo(player, conf, DayCostParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(DayCostParamKey, 0)
		player:set_param_misc(DayCostParamKey, 0)
		player:set_param_type(DayCostParamKey, conf.version)
	end
	local action, misc, type_ = player:get_param_all_info(DayCostParamKey)
	local retMsg = 
	{
		startTime = startTime,
		endTime = endTime,
		actid = ACT_ID,
		cost = action,
		awardFlag = misc,
	}	

	if conf ~= nil then
		retMsg.award = conf.award
		retMsg.icon = conf.icon
	end
	-- print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_INFO_MSG_ID, 0, encode(retMsg))
end


function CheckDayCostCanGetAwardByIndex(player, conf, index)
	if conf.award == nil or conf.award[index] == nil then
		local errMsg = "奖励配置不存在"
		return false, errMsg
	end
	local flag = IsResetActivityAwardFlagInfo(player, conf, DayCostParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(DayCostParamKey, 0)
		player:set_param_misc(DayCostParamKey, 0)
		player:set_type(DayCostParamKey, conf.version)
	end
	local action, misc, type_ = player:get_param_all_info(DayCostParamKey)
	if conf.award[index].minCost > action then
		local errMsg = "消费金额不足，不能领取奖励"
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

function CheckDayCostCanGetAward(player, conf)
	for index , v in pairs(conf.award or {}) do
		local flag = CheckDayCostCanGetAwardByIndex(player, conf, index)
		if flag == true then
			return 1
		end
	end
	return 0
end

function HandlerGetDayCostActivityAwardByIndex(player, index)
	--判断
	local conf = GetOperActivityConfig(g_DayCost)
	if conf == nil then
		local errMsg = "不在活动期间内"
		player:alert(10,0,0,errMsg)
		return 
	end
	local flag, errMsg = CheckDayCostCanGetAwardByIndex(player, conf, index)
	if flag == false then
		player:alert(10,0,0,errMsg)
		return 
	end
	--发奖励
	--更新状态
	player:set_param_misc_index_flag(DayCostParamKey, index)
	for k, v in pairs(conf.award[index].awardList or {}) do
		player:NewAddItem(v.itemid, v.count, OPT_TYPE, CONSUME_TYPE, FLY, v.bind)
	end
	local action, misc, type_ = player:get_param_all_info(DayCostParamKey)
	local retMsg = 
	{
		actid = ACT_ID,
		cost = action,
		awardFlag = misc,
	}
	-- print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_GET_AWARD_MSG_ID, 0, encode(retMsg))
	g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>领取了<font color='#ff0000'>消费返利</font>"..conf.award[index].minCost.."档次奖励,累计消费档次越高,奖励越丰厚！<font color='#0be140'>{_showSysWin,我也要领取,Open_Festive,50}</font>")
end


function IsDayCostActivityHasAward(player, conf)
	local flag = IsResetActivityAwardFlagInfo(player, conf, DayCostParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(DayCostParamKey, 0)
		player:set_param_misc(DayCostParamKey, 0)
		player:set_param_type(DayCostParamKey, conf.version)
	end
	local status = CheckDayCostCanGetAward(player, conf)
	return status
end

function GatherDayCostActivityStatus(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_DayCost)
	local open = 0
	if conf ~= nil then
		local status = IsDayCostActivityHasAward(player, conf)
		open = 1
		return open, startTime, endTime, status
	end

	return open, 0, 0, 0
end


function CheckDayCostIsOpen(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_DayCost)
	local open = 0
	if conf ~= nil then
		local flag = IsResetActivityAwardFlagInfo(player, conf, DayCostParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
		if flag == true then
			player:set_param_action(DayCostParamKey, 0)
			player:set_param_misc(DayCostParamKey, 0)
			player:set_param_type(DayCostParamKey, conf.version)
		end
		open = 1
	end
	return open
end
