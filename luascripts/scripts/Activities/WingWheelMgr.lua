


local g_wheelConfig = {
	
	['lottery'] = {		
		[1] = {awardType = 2, percentage = 25, probability = 18, quality = 1, id = 1, isSave = true},
		[2] = {awardType = 1, itemId = 12021, probability = 4800, count = 2, quality = 0, id = 2, isSave = true},
		[3] = {awardType = 1, itemId = 10282, probability = 200, count = 5, quality = 0, id = 3, isSave = false},
		[4] = {awardType = 2, percentage = 10, probability = 90, quality = 2, id = 4, isSave = true},
		[5] = {awardType = 1, itemId = 10145, probability = 3600, count = 1, quality = 0, id = 5, isSave = false},
		[6] = {awardType = 1, itemId = 12022, probability = 180, count = 1, quality = 0, id = 6, isSave = true},
		[7] = {awardType = 1, itemId = 10186, probability = 3600, count = 1, quality = 0, id = 7, isSave = false},
		[8] = {awardType = 2, percentage = 1, probability = 1800, quality = 3, id = 8, isSave = true},
		[9] = {awardType = 1, itemId = 10200, probability = 200, count = 1, quality = 0, id = 9, isSave = true},
		[10] = {awardType = 1, itemId = 10085, probability = 3500, count = 1, quality = 0, id = 10, isSave = true},		
	}, --抽奖的配置, awradType = 1, 道具奖励， awardType = 2 元宝奖励 ( percentage 奖金池的百分比， probability中奖概率)
	['consume'] = {
		[1] = {consumeNum = 200},
		[2] = {consumeNum = 2000},
	}, --抽奖消耗的配置

	['resetCount'] = 2000,	--抽中元宝奖励为100%后重置的数值
	-- ['isSave'] = 1,			--是否保存中大奖记录, 1是保存， 2 是不保存  
	['saveCount'] = 50,	--保存中大奖记录的条数
	['addCount'] = {
		[1] = 100,		--1连抽加入到奖金池的元宝数
		[2] = 1000,		--10连抽加入到奖金池的元宝数
	},
	['keepDay'] = 0,		--开服前7天
	['delaySec'] = 5000, 		--单抽延迟3000(即是3秒)毫秒发放奖励物品
} --元宝转盘的配置

local awardPoolIndex = 42 --奖金池的index
local lotteryConfig = g_wheelConfig.lottery
local consumeConfig = g_wheelConfig.consume
local resetCount = g_wheelConfig.resetCount
-- local isSave = g_wheelConfig.isSave
local saveCount = g_wheelConfig.saveCount
local addCountConfig = g_wheelConfig.addCount
local keepDay = g_wheelConfig.keepDay
local delaySec = g_wheelConfig.delaySec

local function getProbabilityTotal()
	local total = 0;
	for i= 1, #lotteryConfig do
		total = total + lotteryConfig[i].probability
	end

	return total
end

local function getHitLine(randomNum)
	local nCount = 0;
	for i = 1, #lotteryConfig do 
		nCount = nCount + lotteryConfig[i].probability
		if randomNum <= nCount then
			return i
		end
	end
end


local function lottery(player, lotteryNum)
	local probabilityTotal = getProbabilityTotal()
	local retMsg = {}
	while lotteryNum > 0 do
		local randomNum = math.random(1, probabilityTotal)
		local hitIndex = getHitLine(randomNum)
		local config = lotteryConfig[hitIndex]
		local lotteryInfo = {
			itemId = config.itemId or 0,
			awardType = config.awardType,
			quality = config.quality or 0,
			awardNum = config.count or 0,
			id = config.id,
			lottery_time = os.time(),
			isDisplay = 0,
		}

		if config.isSave == true then
			lotteryInfo.isDisplay = 1
		end

		if config.awardType == 2 then
			local totalNum = g_get_param(awardPoolIndex);
			if totalNum == 0 then
				totalNum = resetCount			
			end
			lotteryInfo.awardNum = math.floor(totalNum * config.percentage / 100)
			if config.percentage == 100 then
				g_set_param(awardPoolIndex, resetCount)			
			else
				local leftCount = totalNum - lotteryInfo.awardNum
				if leftCount < resetCount then
					leftCount = resetCount
				end
				g_set_param(awardPoolIndex, leftCount)
			end
		end
		local nowPoolCount = g_get_param(awardPoolIndex)
		lotteryInfo.awardPoolCount = nowPoolCount
		table.insert(retMsg, lotteryInfo)
		--插入记录
		local logSize = GetWingWheelLogSize()
		if logSize >= saveCount then
			local delCount = logSize - saveCount + 1
			for i = delCount, 1, -1 do
				DelWingWheelLotteryLog()	
			end		
		end
		if config.isSave == true then
			AddWingWheelLotteryLog(player, lotteryInfo.awardType, lotteryInfo.itemId, lotteryInfo.awardNum, lotteryInfo.quality)
		end
		lotteryNum = lotteryNum - 1
	end

	return retMsg;
end

local function AddAwardToPool(lotteryType)
	local add = addCountConfig[lotteryType]
	local totalNum = g_get_param(awardPoolIndex)
	totalNum = totalNum + add
	g_set_param(awardPoolIndex, totalNum)
end

local function CheckBagAndMoneyEnough(player, lotteryType)
	local consume = consumeConfig[lotteryType].consumeNum
	local has = player:get_vcoin()
	if not has or has < consume then
		local notifyMsg = "您的元宝不足"..consume.."个"
		player:alert(10, 0, 0, notifyMsg)
		return false
	end

	local needSlot = 1
	if lotteryType == 2 then needSlot = 10 end
	if player:num_bag_black(0) < needSlot then
		local notifyMsg = "您的背包空间不足"..needSlot.."格"
		player:alert(10, 0, 0,notifyMsg)
		return false
	end

	return true
end


function OnHandlerLottery(player, lotteryType)
	if CheckBagAndMoneyEnough(player, lotteryType) == true then
		local consume = consumeConfig[lotteryType].consumeNum
		player:sub_vcoin(consume)
		local lotteryNum = 1
		if lotteryType == 2 then lotteryNum = 10 end
		AddAwardToPool(lotteryType)
		local retMsg = lottery(player, lotteryNum)
		player:SendPacketToSelf(4205, 0, encode(retMsg))

		--执行加物品
		--遍历抽奖结果执行加都动作
		if lotteryType == 1 then
			for k, v in ipairs(retMsg) do
				-- DelayAddItem(player, v.itemId, v.awardNum, 0, 0, false, 0, 1, delaySec)
				player:DelayAddItem(v.itemId, v.awardNum, 0, 0, false, 0, 1, delaySec)
			end
		else
			for k, v in ipairs(retMsg) do
				if v.awardType == 1 then
					player:add_item(v.itemId, v.awardNum, 0,0, 0, 1)			
				else
					player:add_vcoin(v.awardNum)
				end		
			end
		end
	end
end

function OnGetLotteryKeepDay()
	return keepDay
end

function OnGetPoolInitCount()
	return resetCount
end

function VcoinWheelOverNotify(player)
	local initTime = g_get_init_time()
	local diffDay = GetTodayIsWhichDay(initTime)
	if diffDay > keepDay then
		local retMsg = {flag = 1}
		player:SendPacketToSelf(4206, 0, encode(retMsg))
	end
end


