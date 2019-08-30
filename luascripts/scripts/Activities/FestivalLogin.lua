local ACT_ID = 52
local ParamKey = 758
local OPT_TYPE = 254 
local CONSUME_TYPE = 0
local FLY = 0
local TIME_PARAM_KEY = 835

function clearFestivalLoginActivityInfo(player)
		player:set_param_action(ParamKey, 1)
		player:set_param_misc(ParamKey, 0)
		player:set_param_type(ParamKey, 0)
end
--发送给客户端配置和信息
function FestivalLoginActivityInfo(player)
	local conf, startTime, endTime = GetOperActivityConfig(G_Festival_Login)
	local flag = IsResetActivityAwardFlagInfo(player, conf, ParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true and conf ~= nil then
		player:set_param_action(ParamKey, 1)
		player:set_param_misc(ParamKey, 0)
		player:set_param_type(ParamKey, conf.version)
	end
	local action, misc, type_ = player:get_param_all_info(ParamKey)
	local retMsg = 
	{
		startTime = startTime,
		endTime = endTime,
		actid = ACT_ID,
		days = action,
		awardFlag = misc,
	}	

	if conf ~= nil then
		retMsg.award = conf.award
		retMsg.icon = conf.icon
	end
	-- print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_INFO_MSG_ID, 0, encode(retMsg))
end

--检测单个活动是否符合条件领奖
function CheckFestivalLoginCanGetAwardByIndex(player, conf, index)
	if conf.award[index] == nil then
		local errMsg = "奖励配置不存在"
		return false, errMsg
	end
	local flag = IsResetActivityAwardFlagInfo(player, conf, ParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(ParamKey, 1)
		player:set_param_misc(ParamKey, 0)
		player:set_param_type(ParamKey, conf.version)
	end
	local action, misc, type_ = player:get_param_all_info(ParamKey)
	if index > action then
		local errMsg = "累计登录天数不足"
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

--检测整个活动是否符合条件领奖
function CheckFestivalLoginCanGetAward(player, conf)
	local errMsg = ""
	for index , v in pairs(conf.award or {} ) do
		local flag,errmsg = CheckFestivalLoginCanGetAwardByIndex(player, conf, index)
		if flag == true then
			return 1
		end
		errMsg = errmsg;
	end
	return 0,errMsg
end

--节日登录领奖
function HandlerFestivalLoginAwardByIndex(player, index)
	--判断
	local conf = GetOperActivityConfig(G_Festival_Login)
	if conf == nil then
		local errMsg = "不在活动期间内"
		player:alert(10,0,0,errMsg)
		return 
	end
	local flag, errMsg = CheckFestivalLoginCanGetAwardByIndex(player, conf, index)
	if flag == false then
		player:alert(10,0,0,errMsg)
		return 
	end
	--发奖励
	--更新状态
	player:set_param_misc_index_flag(ParamKey, index)
	for k, v in pairs(conf.award[index].awardList or {}) do
		player:NewAddItem(v.itemid, v.count, OPT_TYPE, CONSUME_TYPE, FLY, v.bind)
	end
	
	local action, misc, version = player:get_param_all_info(ParamKey)
	local obj = {};
	obj.actid    = ACT_ID;
	obj.awardFlag     = misc;
	player:SendPacketToSelf(OPERATING_REQ_GET_AWARD_MSG_ID,0,encode(obj));
end


--重置版本，并判断是否有奖励可以领取
function IsFestivalLoginActivityHasAward(player, conf)
	local flag = IsResetActivityAwardFlagInfo(player, conf, ParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(ParamKey, 1)
		player:set_param_misc(ParamKey, 0)
		player:set_param_type(ParamKey, conf.version)
	end
	local status = CheckFestivalLoginCanGetAward(player, conf)
	return status
end

--获取是否开启和是否能领奖
function FestivalLoginActivityStatus(player)
	local conf, startTime, endTime = GetOperActivityConfig(G_Festival_Login)
	if conf ~= nil then
		local status = IsFestivalLoginActivityHasAward(player, conf)
		return 1, startTime, endTime, status
	end

	return 0, 0, 0, 0
end
