--
--消费返利

local S2C_REQ_ACTIVITY_INFO = 4449
local ACT_TYPE = 2
local PARAM_KEY = 754


function CheckActTreasureRetIsOpen(player)
	local start, over = GetActivityStartAndOverTimeStamp(g_treasure_ret_award_conf)
	local cur = os.time()
	if cur >= start and cur < over then
		return true 
	else
		return false
	end
end


local function resetActivityInfo(player)
	local action, misc, version = player:get_param_all_info(PARAM_KEY)
	if g_treasure_ret_award_conf['version'] and g_treasure_ret_award_conf['version'] ~= version then
		action = 0
		misc = 0
		version = g_treasure_ret_award_conf['version']
		player:set_param_action(PARAM_KEY, action)
		player:set_param_misc(PARAM_KEY, misc)
		player:set_param_type(PARAM_KEY, version)
	end

	return action, misc
end

local function gatherActivityInfo(player)
	local start, over = GetActivityStartAndOverTimeStamp(g_treasure_ret_award_conf)
	local consume, awardFlag = resetActivityInfo(player)
	local retMsg = 
	{
		start = start,
		over = over,
		type = ACT_TYPE,
		consume = consume,
		awardFlag = awardFlag,
	}
	return retMsg
end


local function CheckCanGetAwardByIndex(player, index)
	local conf = g_treasure_ret_award_conf['awrad_conf'] and g_treasure_ret_award_conf['awrad_conf'][index]
	if conf == nil then
		return false, '不存在第'..index..'个奖励'
	end

	local action, awardFlag = resetActivityInfo(player)
	if action < conf.min_key then
		return false, "累计寻宝次数不足,不能领取奖励"
	end

	local flag = GetBitFlagByIndex(awardFlag, index)
	if flag == 1 then
		return false, "不能重复领取奖励"
	end

	return true
end

local function SendActivityAwardByIndex(player, index)
	local award_conf = g_treasure_ret_award_conf['awrad_conf'] and g_treasure_ret_award_conf['awrad_conf'][index]
	if award_conf then
		for k, v in pairs(award_conf.list or {}) do
			player:NewAddItem(v.itemid, v.count, 253, 108, 0, v.bind)
		end
	end
end

function AddTeadsureCount(player, count)
	if CheckActTreasureRetIsOpen(player) == true then
		local action, misc, version = player:get_param_all_info(PARAM_KEY)
		action = action + count
		player:set_param_action(PARAM_KEY, action)
		HandleReqTreasureRetInfo(player)
		HandlerGetFanTianGifState(player)
	end
end

function CheckTreasureRetAwardCanShowAndHasAward(player)
	local show = false
	local status = 0

	if CheckActTreasureRetIsOpen(player) == true then
		show = true
	end

	if show == true then
		for k, v in pairs(g_treasure_ret_award_conf.awrad_conf or {}) do
			if CheckCanGetAwardByIndex(player, k) == true then
				status = 1
				break
			end
		end
	end

	return show, status
end


-------------------------------------------游戏协议---------------------------------------------

function HandleReqTreasureRetInfo(player)
	local retMsg = gatherActivityInfo(player)
	-- print_r(retMsg)
	player:SendPacketToSelf(S2C_REQ_ACTIVITY_INFO, 0, encode(retMsg))
end




function HandleReqGetTreasureRetAward(player, index)
	if CheckActTreasureRetIsOpen(player) == false then
		player:alert(10,0,0,'不在活动期间内')
		return 
	end

	local conf = g_treasure_ret_award_conf.awrad_conf and g_treasure_ret_award_conf.awrad_conf[index]
	if conf == nil then
		return 
	end
	if player:num_bag_black(0) < conf.itemCount then
		local errorMsg = "背包不足,请先清理背包"
		player:alert(10,0,0,errorMsg)
		return 
	end
	
	local ret, errorMsg = CheckCanGetAwardByIndex(player, index)
	if ret == false then
		player:alert(10,0,0,errorMsg)
		return
	end

	SendActivityAwardByIndex(player, index)
	player:set_param_misc_index_flag(PARAM_KEY, index)
	HandleReqTreasureRetInfo(player)
	return true
end