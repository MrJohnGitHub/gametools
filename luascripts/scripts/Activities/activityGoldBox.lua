--元宝宝箱
local ACT_ID = 72
local InstanceParamKey = 815
local OPT_TYPE = 270
local CONSUME_TYPE = 270
local FLY = 0
local TodayGetParamKey = 816
local TIME_PARAM_KEY = 824
function clearGatherGoldBoxActivityInfo(player)
	player:set_param_action(InstanceParamKey, 0)
	player:set_param_misc(InstanceParamKey, 0)
	player:set_param_type(InstanceParamKey, 0)
	player:set_param(TodayGetParamKey, 0)
end

function GatherGoldBoxActivityInfo(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_GoldBoxConf)
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
		todayGet = player:get_param(TodayGetParamKey),
	}	

	if conf ~= nil then
		retMsg.boxCount = #conf.award
		retMsg.icon = conf.icon
		retMsg.dayLimit = conf.dayLimit
	end
	print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_INFO_MSG_ID, 0, encode(retMsg))
end

--开宝箱随机物品
function GoldBoxRandomAward(conf)
	local totalWeight = 0
	for k, v in pairs(conf) do
		totalWeight = totalWeight + v.weight
	end

	local randomNum = math.random(1, totalWeight)

	local count = 0
	local hitIndex = 0
	for i = 1, #conf do 
		count = count + conf[i].weight 
		if randomNum <= count then
			hitIndex = i
			break
		end
	end

	return hitIndex
end


function CheckGoldBoxCanGetAwardByIndex(player, conf, index)
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
	local costkey = conf.award[index].costkey or 1
	if costkey > action then
		local errMsg = "钥匙不足,不能开取宝箱"
		return false, errMsg
	end

	local flag = GetBitFlagByIndex(misc, index)
	if flag == 1 then
		local errMsg = "宝箱已经开启过,不能重复开启"
		return false, errMsg 
	end
	return true
end

function CheckGoldBoxCanGetAward(player, conf)
	for index , v in pairs(conf.award or {}) do
		local flag = CheckGoldBoxCanGetAwardByIndex(player, conf, index)
		if flag == true then
			return 1
		end
	end
	return 0
end

function HandlerGetGoldBoxActivityAwardByIndex(player, index)
	--判断
	local conf = GetOperActivityConfig(g_GoldBoxConf)
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

	local flag, errMsg = CheckGoldBoxCanGetAwardByIndex(player, conf, index)
	if flag == false then
		player:alert(10,0,0,errMsg)
		return 
	end
	--发奖励
	--更新状态
	player:set_param_misc_index_flag(InstanceParamKey, index)
	local action, misc, type_ = player:get_param_all_info(InstanceParamKey)
	local value = action - conf.award[index].costkey
	player:set_param(InstanceParamKey, value)

	if misc == 7 then
		player:set_param_misc(InstanceParamKey, 0)
	end

	local hitIndex = GoldBoxRandomAward(conf.award[index].awardList)
	local v = conf.award[index].awardList[hitIndex]
	player:NewAddItem(v.itemid, v.count, OPT_TYPE, CONSUME_TYPE, FLY, v.bind)
	if v.itemid == 101 then
		player:SendVcoinFly(v.count, 10, 0)
	elseif v.itemid == 100 then
		player:SendVcoinFly(v.count, 10, 1)
	end
	local action, misc, type_ = player:get_param_all_info(InstanceParamKey)
	local retMsg = 
	{
		actid = ACT_ID,
		count = action,
		awardFlag = misc,
		itemid = v.itemid,
	}
	-- print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_GET_AWARD_MSG_ID, 0, encode(retMsg))
end


function IsGoldBoxActivityHasAward(player, conf)
	local flag = IsResetActivityAwardFlagInfo(player, conf, InstanceParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(InstanceParamKey, 0)
		player:set_param_misc(InstanceParamKey, 0)
		player:set_param_type(InstanceParamKey, conf.version)
	end
	local status = CheckGoldBoxCanGetAward(player, conf)
	return status
end

function GatherGoldBoxActivityStatus(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_GoldBoxConf)
	local open = 0
	if conf ~= nil then
		local status = IsGoldBoxActivityHasAward(player, conf)
		open = 1
		return open, startTime, endTime, status
	end

	return open, 0, 0, 0
end


function CheckGoldBoxIsOpen(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_GoldBoxConf)
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


function AddGoldBoxActivityParamCount(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_GoldBoxConf)
	if conf ~= nil then
		local todayGet = player:get_param(TodayGetParamKey)
		if todayGet < conf.dayLimit then
			local todayCumulativePay = player:get_param(221)
			local base = conf.base or 1000
			local shouldAdd = math.floor(todayCumulativePay / base)
			if shouldAdd > conf.dayLimit then
				shouldAdd = conf.dayLimit
			end
			local diff = shouldAdd - todayGet
			player:set_param(TodayGetParamKey, shouldAdd)
			local value = player:get_param(InstanceParamKey)
			player:set_param(InstanceParamKey, value + diff)
			local arr = {}
			local retMsg = 
			{
				arr = arr
			}
			local info = {actid = ACT_ID, key = value + diff, todayGet = shouldAdd}
			table.insert(arr, info)
			print_r(retMsg)
			player:SendPacketToSelf(4804, 0, encode(retMsg))
		end
	end
end



