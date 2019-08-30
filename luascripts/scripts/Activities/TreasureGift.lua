--[[

新的寻宝有礼运营活动
--]]

local ACT_ID = 58
local TreasureParamKey = 761
local OPT_TYPE = 253
local CONSUME_TYPE = 108
local FLY = 0
local TIME_PARAM_KEY = 840;

function clearGatherTreasureGiftActivityInfo(player)
		player:set_param_action(TreasureParamKey, 0)
		player:set_param_misc(TreasureParamKey, 0)
		player:set_param_type(TreasureParamKey, 0)
end

function GatherTreasureGiftActivityInfo(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_TreasureGiftConf)
	local flag = IsResetActivityAwardFlagInfo(player, conf, TreasureParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(TreasureParamKey, 0)
		player:set_param_misc(TreasureParamKey, 0)
		player:set_param_type(TreasureParamKey, conf.version)
	end
	local action, misc, type_ = player:get_param_all_info(TreasureParamKey)
	local retMsg = 
	{
		startTime = startTime,
		endTime = endTime,
		actid = ACT_ID,
		count = action,
		awardFlag = misc,
	}	

	if conf ~= nil then
		retMsg.award = conf.award
		retMsg.icon = conf.icon
	end
	print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_INFO_MSG_ID, 0, encode(retMsg))
end


function CheckTreasureGiftCanGetAwardByIndex(player, conf, index)
	if conf.award == nil or conf.award[index] == nil then
		local errMsg = "奖励配置不存在"
		return false, errMsg
	end
	local flag = IsResetActivityAwardFlagInfo(player, conf, TreasureParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(TreasureParamKey, 0)
		player:set_param_misc(TreasureParamKey, 0)
		player:set_type(TreasureParamKey, conf.version)
	end
	local action, misc, type_ = player:get_param_all_info(TreasureParamKey)
	if conf.award[index].minCount > action then
		local errMsg = "寻宝次数不足，不能领取奖励"
		return false, errMsg
	end

	local flag = GetBitFlagByIndex(misc, index)
	if flag == 1 then
		local errMsg = "奖励已经领取过，不能重复领取"
		return false, errMsg 
	end
	return true
end

function CheckTreasureGiftCanGetAward(player, conf)
	for index , v in pairs(conf.award or {}) do
		local flag = CheckTreasureGiftCanGetAwardByIndex(player, conf, index)
		if flag == true then
			return 1
		end
	end
	return 0
end

function HandlerGetTreasureGiftActivityAwardByIndex(player, index)
	--判断
	local conf = GetOperActivityConfig(g_TreasureGiftConf)
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
		return false, errMsg 
	end
	
	local flag, errMsg = CheckTreasureGiftCanGetAwardByIndex(player, conf, index)
	if flag == false then
		player:alert(10,0,0,errMsg)
		return 
	end
	--发奖励
	--更新状态
	player:set_param_misc_index_flag(TreasureParamKey, index)
	for k, v in pairs(conf.award[index].awardList or {}) do
		player:NewAddItem(v.itemid, v.count, OPT_TYPE, CONSUME_TYPE, FLY, v.bind)
	end
	local action, misc, type_ = player:get_param_all_info(TreasureParamKey)
	local retMsg = 
	{
		actid = ACT_ID,
		count = action,
		awardFlag = misc,
	}
	-- print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_GET_AWARD_MSG_ID, 0, encode(retMsg))
	HandlerGatherOpenActivityInfo(player, ACT_ID)
end


function IsTreasureGiftActivityHasAward(player, conf)
	local flag = IsResetActivityAwardFlagInfo(player, conf, TreasureParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(TreasureParamKey, 0)
		player:set_param_misc(TreasureParamKey, 0)
		player:set_param_type(TreasureParamKey, conf.version)
	end
	local status = CheckTreasureGiftCanGetAward(player, conf)
	return status
end

function GatherTreasureGiftActivityStatus(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_TreasureGiftConf)
	local open = 0
	if conf ~= nil then
		local status = IsTreasureGiftActivityHasAward(player, conf)
		open = 1
		return open, startTime, endTime, status
	end

	return open, 0, 0, 0
end


function CheckTreasureGiftIsOpen(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_TreasureGiftConf)
	local open = 0
	if conf ~= nil then
		local flag = IsResetActivityAwardFlagInfo(player, conf, TreasureParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
		if flag == true then
			player:set_param_action(TreasureParamKey, 0)
			player:set_param_misc(TreasureParamKey, 0)
			player:set_param_type(TreasureParamKey, conf.version)
		end
		open = 1
	end
	return open
end

function AddNewTreasureGiftParamCount(player, count)
	if CheckTreasureGiftIsOpen(player) == 1 then
		local value = player:get_param(TreasureParamKey) + count
		player:set_param(TreasureParamKey, value)
		HandlerGatherOpenActivityInfo(player, ACT_ID)
	end
end


