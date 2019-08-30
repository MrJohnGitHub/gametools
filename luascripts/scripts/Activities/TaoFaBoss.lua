--[[
讨伐BOSS运营活动
--]]

local ACT_ID = 74
local InstanceParamKey = 845
local OPT_TYPE = 272
local CONSUME_TYPE = 272
local FLY = 0
local TIME_PARAM_KEY = 846

function clearTaoFaBossActivityInfo(player)
		player:set_param_action(InstanceParamKey, 0)
		player:set_param_misc(InstanceParamKey, 0)
		player:set_param_type(InstanceParamKey, 0)
end

function TaoFaBossActivityInfo(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_TaoFaBossConf)
	local flag = IsResetActivityAwardFlagInfo(player, conf, InstanceParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(InstanceParamKey, 0)
		player:set_param_misc(InstanceParamKey, 0)
		player:set_param_type(InstanceParamKey, conf.version)
	end
	local action, misc, type_ = player:get_param_all_info(InstanceParamKey)
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


function CheckTaoFaBossCanGetAwardByIndex(player, conf, index)
	if conf.award == nil or conf.award[index] == nil then
		local errMsg = "奖励配置不存在"
		return false, errMsg
	end
	local flag = IsResetActivityAwardFlagInfo(player, conf, InstanceParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(InstanceParamKey, 0)
		player:set_param_misc(InstanceParamKey, 0)
		player:set_type(InstanceParamKey, conf.version)
	end
	local action, misc, type_ = player:get_param_all_info(InstanceParamKey)
	if conf.award[index].minCount > action then
		local errMsg = "击杀Boss次数不足，不能领取奖励"
		return false, errMsg
	end

	local flag = GetBitFlagByIndex(misc, index)
	if flag == 1 then
		local errMsg = "奖励已经领取过，不能重复领取"
		return false, errMsg 
	end
	return true
end

function CheckTaoFaBossCanGetAward(player, conf)
	for index , v in pairs(conf.award or {}) do
		local flag = CheckTaoFaBossCanGetAwardByIndex(player, conf, index)
		if flag == true then
			return 1
		end
	end
	return 0
end

function HandlerGetTaoFaBossAwardByIndex(player, index)
	--判断
	local conf = GetOperActivityConfig(g_TaoFaBossConf)
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
		return false, errMsg 
	end
	
	local flag, errMsg = CheckTaoFaBossCanGetAwardByIndex(player, conf, index)
	if flag == false then
		player:alert(10,0,0,errMsg)
		return 
	end
	--发奖励
	--更新状态
	player:set_param_misc_index_flag(InstanceParamKey, index)
	for k, v in pairs(conf.award[index].awardList or {}) do
		player:NewAddItem(v.itemid, v.count, OPT_TYPE, CONSUME_TYPE, FLY, v.bind)
	end
	local action, misc, type_ = player:get_param_all_info(InstanceParamKey)
	local retMsg = 
	{
		actid = ACT_ID,
		count = action,
		awardFlag = misc,
	}
	-- print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_GET_AWARD_MSG_ID, 0, encode(retMsg))
	HandlerGatherOpenActivityInfo(player, ACT_ID)
	player:alert(10,0,0,"领取成功")
end


function IsTaoFaBossActivityHasAward(player, conf)
	local flag = IsResetActivityAwardFlagInfo(player, conf, InstanceParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(InstanceParamKey, 0)
		player:set_param_misc(InstanceParamKey, 0)
		player:set_param_type(InstanceParamKey, conf.version)
	end
	local status = CheckTaoFaBossCanGetAward(player, conf)
	return status
end

function TaoFaBossActivityStatus(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_TaoFaBossConf)
	local open = 0
	if conf ~= nil then
		local status = IsTaoFaBossActivityHasAward(player, conf)
		open = 1
		return open, startTime, endTime, status
	end

	return open, 0, 0, 0
end


function CheckTaoFaBossIsOpen(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_TaoFaBossConf)
	local open = 0
	if conf ~= nil then
		local flag = IsResetActivityAwardFlagInfo(player, conf, InstanceParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
		if flag == true then
			player:set_param_action(InstanceParamKey, 0)
			player:set_param_misc(InstanceParamKey, 0)
			player:set_param_type(InstanceParamKey, conf.version)
		end
		open = 1
	end
	return open
end


function AddTaoFaBossParamCount(player)
	if CheckTaoFaBossIsOpen(player) == 1 then
		local value = player:get_param(InstanceParamKey) + 1
		player:set_param(InstanceParamKey, value)
		HandlerGatherOpenActivityInfo(player, ACT_ID)
	end
end
