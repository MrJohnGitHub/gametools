--消费转盘
local ACT_ID = 73
local InstanceParamKey = 841
local OPT_TYPE = 271
local CONSUME_TYPE = 271
local FLY = 0
local TIME_PARAM_KEY = 819

function clearGatherConsumeDialActivityInfo(player)
	player:set_param_action(InstanceParamKey, 0)
	player:set_param_misc(InstanceParamKey, 0)
	player:set_param_type(InstanceParamKey, 0)
end

function GatherConsumeDialActivityInfo(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_ConsumeDialConf)
	local flag = IsResetActivityAwardFlagInfo(player, conf, InstanceParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(InstanceParamKey, 0)
		player:set_param_misc(InstanceParamKey, 0)
		player:set_param_type(InstanceParamKey, conf.version)
		player:clearInVailLotteryInfo()
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
		retMsg.box = conf.box
		retMsg.icon = conf.icon
		retMsg.lotteryCost = conf.lotteryCost
	end
	print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_INFO_MSG_ID, 0, encode(retMsg))
end


function CheckConsumeDialCanGetAwardByIndex(player, conf, index)
	if conf.box == nil or conf.box[index] == nil then
		local errMsg = "宝箱不存在"
		return false, errMsg
	end
	local flag = IsResetActivityAwardFlagInfo(player, conf, InstanceParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(InstanceParamKey, 0)
		player:set_param_misc(InstanceParamKey, 0)
		player:set_type(InstanceParamKey, conf.version)
		player:clearInVailLotteryInfo()
	end
	local action, misc, type_ = player:get_param_all_info(InstanceParamKey)
	if conf.box[index].lotteryCount > action then
		local errMsg = "抽奖次数不足，不能领取宝箱"
		return false, errMsg
	end

	local flag = GetBitFlagByIndex(misc, index)
	if flag == 1 then
		local errMsg = "宝箱已经领取过，不能重复领取"
		return false, errMsg 
	end
	return true
end

function CheckConsumeDialCanGetAward(player, conf)
	for index , v in pairs(conf.award or {}) do
		local flag = CheckConsumeDialCanGetAwardByIndex(player, conf, index)
		if flag == true then
			return 1
		end
	end
	return 0
end

function ConsumeDialLottery(conf,count)
	local lotteryList = {}
	if count == 10 or count == 50 then
		local index = 1
		if count == 50 then
			index = 2
		end
		local mustBe = conf.award.mustBe[index]
		if mustBe ~= nil then
			for k, v in pairs(mustBe) do
				local info = {itemid = v.itemid, count = v.count, bind = v.bind}
				table.insert(lotteryList, info)
			end
		end
	end

	count = count - #lotteryList
	local weightSum = 0
	local awardList = conf.award.awardList
	for k, v in pairs(awardList or {}) do
		weightSum = weightSum + v.weight
	end 
	while(count > 0) do 
		local randomNum = math.random(1, weightSum)
		local iCount = 0
		local hitIndex = 0
		for i = 1, #awardList do
			iCount = iCount + awardList[i].weight
			if randomNum <= iCount then
				hitIndex = i
				break
			end
		end
		local itemid = awardList[hitIndex].itemid
		local itemcount = awardList[hitIndex].count
		local bind = awardList[hitIndex].bind
		local info = {itemid = itemid, count = itemcount, bind = bind}
		table.insert(lotteryList, info)
		count = count - 1
	end
	return lotteryList
end

function HandlerGetConsumeDialActivityAwardByIndex(player, index)
		--判断
	local conf = GetOperActivityConfig(g_ConsumeDialConf)
	if conf == nil then
		local errMsg = "不在活动期间内"
		player:alert(10,0,0,errMsg)
		return 
	end
	
	if index == nil or conf.box[index] == nil then
		local errMsg = "奖励下标有误"
		player:alert(10,0,0,errMsg)
		return 
	end
	
	if player:num_bag_black(0) < conf.box[index].itemCount then
		local errMsg = "背包不足,请先清理背包"
		player:alert(10,0,0,errMsg)
		return 
	end
	
	local flag, errMsg = CheckConsumeDialCanGetAwardByIndex(player, conf, index)
	if flag == false then
		player:alert(10,0,0,errMsg)
		return 
	end
	--发奖励
	--更新状态
	player:set_param_misc_index_flag(InstanceParamKey, index)
	for k, v in pairs(conf.box[index].awardList or {}) do
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
	-- HandlerGatherOpenActivityInfo(player, ACT_ID)
end

--处理请求抽奖
function HandlerConsumeDialLottery(player, count)
	--判断
	local conf = GetOperActivityConfig(g_ConsumeDialConf)
	if conf == nil then
		local errMsg = "不在活动期间内"
		player:alert(10,0,0,errMsg)
		return 
	end
	
	--
	if count ~= 1 and count ~= 10 and count ~= 50 then
		local errMsg = "参数有误"
		player:alert(10,0,0,errMsg)
		return 
	end

	--判断元宝足不足够
	local lotteryCost = conf.lotteryCost * count
	if player:get_vcoin() < lotteryCost then
		local errMsg = "元宝不足, 不能抽奖"
		player:alert(10,0,0,errMsg)
		return 
	end
	--扣掉元宝 
	player:sub_vcoin(lotteryCost)
	--开始抽奖
	local lotteryAwardList = ConsumeDialLottery(conf,count)
	for k, v in ipairs(lotteryAwardList) do
		local itemid = v.itemid
		local count = v.count
		local bind = v.bind
		player:PushConsumeDialLotteryToWareHouse(itemid, count, bind)
	end

	local lotteryCount = player:get_param(InstanceParamKey) + count
	player:set_param(InstanceParamKey, lotteryCount)
	local action, misc, type_ = player:get_param_all_info(InstanceParamKey)
	local retMsg = 
	{
		actid = ACT_ID,
		count = lotteryCount,
		awardFlag = misc,
		lotteryAwardList = lotteryAwardList,
	}
	print_r(retMsg)
	player:SendPacketToSelf(4809, 0, encode(retMsg))
end


function IsConsumeDialActivityHasAward(player, conf)
	local flag = IsResetActivityAwardFlagInfo(player, conf, InstanceParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(InstanceParamKey, 0)
		player:set_param_misc(InstanceParamKey, 0)
		player:set_param_type(InstanceParamKey, conf.version)
		player:clearInVailLotteryInfo()
	end
	local status = CheckConsumeDialCanGetAward(player, conf)
	return status
end

function GatherConsumeDialActivityStatus(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_ConsumeDialConf)
	local open = 0
	if conf ~= nil then
		local status = IsConsumeDialActivityHasAward(player, conf)
		open = 1
		return open, startTime, endTime, status
	end

	return open, 0, 0, 0
end


function CheckConsumeDialIsOpen(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_ConsumeDialConf)
	local open = 0
	if conf ~= nil then
		open = 1
	end
	return open
end



