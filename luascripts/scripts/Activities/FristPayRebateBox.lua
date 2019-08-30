
--首充返利宝箱


local g_config = {
	boxid = 10089,
	AwardList = {
		--consumetype: 0是金钱 1 是绑金 2 是元宝 3 是绑元
		[1] = {
			free = {
				[1] = {itemid = 10186, count = 50, bind = 1},
			},
			cost = {
				[1] = {itemid = 10411, count = 1, bind = 1, buyLimit = 5, consume = 888, consumetype = 2},
				[2] = {itemid = 40301, count = 1, bind = 1, buyLimit = 10, consume = 388, consumetype = 2},
			},
		}, --第1天

		[2] = {
			free = {
				[1] = {itemid = 12014, count = 5, bind = 1},
			},
			cost = {
				[1] = {itemid = 40101, count = 30, bind = 1, buyLimit = 5, consume = 588, consumetype = 2},
				[2] = {itemid = 40301, count = 1, bind = 1, buyLimit = 10, consume = 388, consumetype = 2},
			},
		}, --第2天

		[3] = {
			free = {
				[1] = {itemid = 10287, count = 2, bind = 1},
			},

			cost = {
				[1] = {itemid = 10410, count = 1, bind = 1, buyLimit = 5, consume = 688, consumetype = 2},
				[2] = {itemid = 40101, count = 30, bind = 1, buyLimit = 5, consume = 588, consumetype = 2},
			},
		}, --第3天

		[4] = {
			free = {
				[1] = {itemid = 40301, count = 2, bind = 1},
			},
			cost = {
				[1] = {itemid = 10408, count = 1, bind = 1, buyLimit = 5, consume = 888, consumetype = 2},
				[2] = {itemid = 10410, count = 1, bind = 1, buyLimit = 5, consume = 788, consumetype = 2},
			},
		}, --第4天

		[5] = {
			free = {
				[1] = {itemid = 12014, count = 5, bind = 1},
			},
			cost = {
				[1] = {itemid = 12022, count = 1, bind = 1, buyLimit = 5, consume = 788, consumetype = 2},
				[2] = {itemid = 10408, count = 1, bind = 1, buyLimit = 5, consume = 888, consumetype = 2},
			},
		}, --第5天

		[6] = {
			free = {
				[1] = {itemid = 10287, count = 2, bind = 1},
			},
			cost = {
				[1] = {itemid = 10413, count = 1, bind = 1, buyLimit = 5, consume = 788, consumetype = 2},
				[2] = {itemid = 12022, count = 1, bind = 1, buyLimit = 5, consume = 788, consumetype = 2},
			},
		}, --第6天

		[7] = {
			free = {
				[1] = {itemid = 12015, count = 1, bind = 1},
			},
			cost = {
				[1] = {itemid = 10165, count = 1, bind = 1, buyLimit = 5, consume = 888, consumetype = 2},
				[2] = {itemid = 10413, count = 1, bind = 1, buyLimit = 5, consume = 788, consumetype = 2},
			},
		}, --第7天

	}
}


local HasGetFreeAwardKey = 676 		--今天是否已经领取过免费奖励
local BuyCostAwardTimeKey = 677 	--已经购买的次数

local S2C_MSG_REQ_FRIST_PAY_BOX_INFO = 4437
local S2C_MSG_REQ_BUY_BOX_AWARD = 4438

local OPT_TYPE = 246
local E_CONSUME = 96
local FLY = 0
--获得今天是获得宝箱的第几天
local function GetPassDayFromHasBox(player)
	local iTime = player:GetRebateBoxTimeStamp()
	local whichDay = GetTodayIsWhichDay(iTime)
	return whichDay
end

local function CheckHasRebateBox(player)
	local bFlag = false
	local iTime = player:GetRebateBoxTimeStamp()
	if iTime > 0 then
		bFlag = true
	end
	return bFlag
end

local function gatherFristPayRebateBoxInfo(player)
	local isFree = player:get_param(HasGetFreeAwardKey)
	local passDay = GetPassDayFromHasBox(player)
	local buyTime = player:get_param(BuyCostAwardTimeKey)
	local retMsg = {
		isFree = isFree,
		passDay = passDay,
		buyTime = buyTime,
	}
	return retMsg
end

function AddFristPayRebateBox(player)
	-- player:NewAddItem(g_config.boxid, 1, OPT_TYPE, E_CONSUME, 0, 1)
end

-----------------------------------------------游戏协议---------------------------------

function ReqFristPayRebateBoxInfo(player)
	if CheckHasRebateBox(player) == false then
		return 
	end
	local retMsg = gatherFristPayRebateBoxInfo(player)
	-- print_r(retMsg)
	player:SendPacketToSelf(S2C_MSG_REQ_FRIST_PAY_BOX_INFO, 0, encode(retMsg))
end


function ReqBuyFristPayRebateBoxAward(player, index)
	if CheckHasRebateBox(player) == false then
		return 
	end
	--判断是不是还未领取过免费的
	--没领取过就直接给
	local bFree = player:get_param(HasGetFreeAwardKey)
	local passDay = GetPassDayFromHasBox(player)
	local conf = g_config.AwardList and  g_config.AwardList[passDay]
	if conf == nil then
		return 
	end

	if bFree == 0 then
		--主动推送协议过去
		local freeAwardConf = conf.free or {}
		if player:num_bag_black(0) < #freeAwardConf then
			local notifyMsg = "您的背包空间不足,请先清理背包"
			player:alert(10, 0, 0, notifyMsg)
			return 
		end
		for k, v in ipairs(freeAwardConf) do
			player:NewAddItem(v.itemid, v.count, OPT_TYPE, E_CONSUME, FLY, v.bind)
		end
		player:set_param(HasGetFreeAwardKey, 1)
		ReqFristPayRebateBoxInfo(player)
		return 
	end

	if index <= 0 then
		return 
	end
	if player:num_bag_black(0) < 1 then
		local notifyMsg = "您的背包空间不足,请先清理背包"
		player:alert(10, 0, 0, notifyMsg)
		return 
	end
	local costConf = conf.cost and conf.cost[index]
	if costConf == nil then
		return 
	end

	local buyTime = player:get_param(BuyCostAwardTimeKey)
	local hasBuy = 0
	local addNum = 1
	if index == 1 then
		hasBuy = math.mod(buyTime, 10)
	else
		addNum = math.pow(10, index - 1)
		hasBuy = math.floor(buyTime / addNum)
	end
	if hasBuy >= costConf.buyLimit then
		local errorMsg = "购买已经达到上限了"
		player:alert(10,0,0,errorMsg)
		return 
	end

	local consume = costConf.consume
	local consumetype = costConf.consumetype
	if player:NewGetGold(consumetype) < consume then
		local msgList = {
			[0] = "金币不足, 不能购买",
			[1] = "绑金不足, 不能购买",
			[2] = "元宝不足, 不能购买",
			[3] = "绑元不足, 不能购买",
		}
		local errorMsg = msgList[consumetype]
		player:alert(10,0,0,errorMsg)
		return 
	end

	--消耗金钱
	player:NewDeductGold(consumetype, consume, E_CONSUME)
	buyTime = buyTime + addNum
	player:set_param(BuyCostAwardTimeKey, buyTime)

	--发物品
	player:NewAddItem(costConf.itemid, costConf.count, OPT_TYPE, E_CONSUME, FLY, costConf.bind)

	ReqFristPayRebateBoxInfo(player)

	-- local retMsg = {flag = 1}
	-- player:SendPacketToSelf(S2C_MSG_REQ_BUY_BOX_AWARD, 0, encode(retMsg))
end