--
--消费返利

local S2C_REQ_ACTIVITY_INFO = 4449
local ACT_TYPE = 3
local PARAM_KEY = 755
local ACT_NOT_START = 1
local ACT_IS_OVER = 2

function CheckActGoldRetIsOpen(player)
	local start, over = GetActivityStartAndOverTimeStamp(g_gold_return_conf)
	local cur = os.time()
	if cur >= start and cur < over then
		return true 
	else
		local errorCode = ACT_NOT_START
		if cur >= over then
			errorCode = ACT_IS_OVER
		end
		return false, errorCode
	end
end


local function resetActivityInfo(player)
	local action, misc, version = player:get_param_all_info(PARAM_KEY)
	if g_gold_return_conf['version'] and g_gold_return_conf['version'] ~= version then
		action = 0
		misc = 0
		version = g_gold_return_conf['version']
		player:set_param_action(PARAM_KEY, action)
		player:set_param_misc(PARAM_KEY, misc)
		player:set_param_type(PARAM_KEY, version)
	end

	return action, misc
end

local function gatherActivityInfo(player)
	local start, over = GetActivityStartAndOverTimeStamp(g_gold_return_conf)
	local consume, awardFlag = resetActivityInfo(player)
	local retMsg = 
	{
		start = start,
		over = over,
		type = ACT_TYPE,
		consume = consume,
		awardFlag = awardFlag,
		retGold = math.floor(consume * g_gold_return_conf['rate'])
	}
	return retMsg
end

function CheckGoldRetCanShowAndHasAward(player)
	local show = false
	local status = 0
	local ret, errorCode = CheckActGoldRetIsOpen(player)
	if ret == true then
		show = true
	else
		if errorCode == ACT_IS_OVER then
			local consume, awardFlag = player:get_param_all_info(PARAM_KEY)
			if consume > 0 and awardFlag == 0 then
				show = true
				status = 1
			end
		end
	end

	if show == true then
		HandleReqGoldRetInfo(player)
	end
	return show, status
end


-------------------------------------------游戏协议---------------------------------------------

function HandleReqGoldRetInfo(player)
	local retMsg = gatherActivityInfo(player)
	-- print_r(retMsg)
	player:SendPacketToSelf(S2C_REQ_ACTIVITY_INFO, 0, encode(retMsg))
end




function HandleReqGetGoldRetAward(player, index)
	local ret, code = CheckActGoldRetIsOpen(player)
	if ret == true or code == ACT_NOT_START then
		player:alert(10,0,0,'活动还未结束,不能领取返还元宝')
		return 
	end
	local consume, awardFlag = player:get_param_all_info(PARAM_KEY)
	if consume <= 0 then
		player:alert(10,0,0,'活动期间内没有消费,不能领取返还')
		return
	end
	local flag = GetBitFlagByIndex(awardFlag, 1)
	if flag == 1 then
		player:alert(10,0,0,'已经领取过返利,不能再领取')
		return 
	end
	--增加元宝
	local retGold = math.floor(consume * g_gold_return_conf['rate'])
	player:NewAddItem(100, retGold, 109, 109, 0, 0)
	player:set_param_misc_index_flag(PARAM_KEY, 1)
	player:SendVcoinFly(retGold, 10, 1)
	HandleReqGoldRetInfo(player)
	return true
end