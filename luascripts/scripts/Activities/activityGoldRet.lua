
--元宝返还活动
local ACT_ID = 65
local GoldRetParamKey = 772
local OPT_TYPE = 109
local CONSUME_TYPE = 109
local FLY = 0
local CONF_INDEX = 76
local TIME_PARAM_KEY = 825
function clearGatherGoldRetActivityInfo(player)
		player:set_param_action(GoldRetParamKey, 0)
		player:set_param_misc(GoldRetParamKey, 0)
		player:set_param_type(GoldRetParamKey, 0)
end

function GatherGoldRetActivityInfo(player)
	local conf, startTime, endTime, k = GetOperActivityConfig(g_GoldRetConf)
	local flag = IsResetActivityAwardFlagInfo(player, conf, GoldRetParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(GoldRetParamKey, 0)
		player:set_param_misc(GoldRetParamKey, 0)
		player:set_param_type(GoldRetParamKey, conf.version)
	end

	local action, misc, type_ = player:get_param_all_info(GoldRetParamKey)
	local index = g_get_param(CONF_INDEX)
	if conf ~= nil then
		if index ~= k then
			g_set_param(CONF_INDEX, k)
		end
	else
		if g_GoldRetConf[index] == nil then
			index = #g_GoldRetConf
		end
		conf = g_GoldRetConf[index]
	end
	local goldRetType = conf.retGoldType
	local retMsg = 
	{
		startTime = startTime,
		endTime = endTime,
		actid = ACT_ID,
		count = action,
		awardFlag = misc,
		retGold = math.floor(action * conf['rate']),
		icon = conf.icon,
		goldRetType = goldRetType,
	}	
	print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_INFO_MSG_ID, 0, encode(retMsg))
end

function FindTheRecentlyConf(player)
	local index = g_get_param(CONF_INDEX)
	if g_GoldRetConf[index] == nil then
		print("FindTheRecentlyConf can not found the conf by index:",index)
		player:alert(10,0,0,'没有发现合适的配置！！！')
		index = #g_GoldRetConf
	end
	return g_GoldRetConf[index]
end

function HandlerGetGoldRetActivityAwardByIndex(player, index)
	--判断
	local conf = GetOperActivityConfig(g_GoldRetConf)
	if conf ~= nil then
		local errMsg = "活动未结束，不能领取元宝"
		player:alert(10,0,0,errMsg)
		return 
	end

	local consume, awardFlag = player:get_param_all_info(GoldRetParamKey)
	if consume <= 0 then
		player:alert(10,0,0,'活动期间内没有消费,不能领取返还')
		return
	end

	if awardFlag ~= 0 then
		player:alert(10,0,0,'已经领取过返还元宝,不能再领取')
		return 
	end

	local recentlyConf = FindTheRecentlyConf(player)
	if recentlyConf == nil then
		player:alert(10,0,0,'没有找到配置文件！！！')
		return 
	end

	local retGold = math.floor(consume * recentlyConf['rate'])
	local retGoldType = recentlyConf.retGoldType
	player:NewAddItem(retGoldType, retGold, OPT_TYPE, CONSUME_TYPE, FLY, 0)
	player:set_param_misc_index_flag(GoldRetParamKey, 1)
	local flyTo = 1
	if retGoldType == 101 then
		flyTo = 0
	end
	player:SendVcoinFly(retGold, 10, flyTo)
	local retMsg = 
	{
		actid = ACT_ID,
		count = action,
		awardFlag = 1,
	}
	player:SendPacketToSelf(OPERATING_REQ_GET_AWARD_MSG_ID, 0, encode(retMsg))
	HandlerGatherOpenActivityInfo(player, ACT_ID)
end


function GatherGoldRetActivityStatus(player)
	local conf, startTime, endTime, k = GetOperActivityConfig(g_GoldRetConf)
	local open = 0
	if conf ~= nil then
		local index = g_get_param(CONF_INDEX)
		if index ~= k then
			g_set_param(CONF_INDEX, k)
		end
		open = 1
		return open, startTime, endTime, 0
	else
		local consume, awardFlag = player:get_param_all_info(GoldRetParamKey)
		if consume > 0 and awardFlag == 0 then
			open = 1
			return open, 0, 0, 1
		end
	end

	return open, 0, 0, 0
end


function CheckGoldRetIsOpen(player)
	local conf, startTime, endTime, k = GetOperActivityConfig(g_GoldRetConf)
	local open = 0
	if conf ~= nil then
		local flag = IsResetActivityAwardFlagInfo(player, conf, GoldRetParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
		if flag == true then
			player:set_param_action(GoldRetParamKey, 0)
			player:set_param_misc(GoldRetParamKey, 0)
			player:set_param_type(GoldRetParamKey, conf.version)
		end
		open = 1
		local index = g_get_param(CONF_INDEX)
		if index ~= k then
			g_set_param(CONF_INDEX, k)
		end
	end
	return open, conf
end


function AddGoldRetActivityParamCount(player, count)
	local open, conf = CheckGoldRetIsOpen(player)
	if open == 1 then
		local value = player:get_param(GoldRetParamKey) + count
		player:set_param(GoldRetParamKey, value)
		local arr = {}
		local retMsg = 
		{
			arr = arr
		}
		local retGold = math.floor(value * conf['rate'])
		local info = {actid = ACT_ID, key = value, ret = retGold}
		table.insert(arr, info)
		player:SendPacketToSelf(4804, 0, encode(retMsg))
	end
end
