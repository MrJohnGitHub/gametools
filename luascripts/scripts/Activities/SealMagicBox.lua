--[[

	封魔宝箱
--]]

local magicBoxConf = {
	freeLimit = 5, --每日免费领取次数
	buyLimit = 0, --购买上限
	refreshCost = 1, --消耗的封魔令个数
	buyCost = 100, --购买次数消耗元宝
		refreshUseMoney = {money = 1000000, moneyType = 1},
	completeCost = 200, --立即完成花费
	refreshConfig = {
				[1] = {
			proConf = {
				[1] = 50,
				[2] = 50,
			},

			failLimitCount = 2, --刷新失败n次后必定能随机到下个宝箱

		},

		[2] = {
			proConf = {
				[1] = 83,
				[2] = 17,
			},

			failLimitCount = 4, --刷新失败n次后必定能随机到下个宝箱
		},

		[3] = {
			proConf = {
				[1] = 91,
				[2] = 9,
			},

			failLimitCount = 7, --刷新失败n次后必定能随机到下个宝箱
		},

		[4] = {
			proConf = {
				[1] = 93,
				[2] = 7,
			},

			failLimitCount = 11, --刷新失败n次后必定能随机到下个宝箱
		},

	},

	fristOpenAward = {
			openLimit = 5, 	--可开启次数
			activateCost = 48000, --激活消耗封魔值
			awardList = {
				[1] = {
					award = {
						[1] = {itemid = 3, count = 5000000, bind = 0, isItem = 0, pro = 1}, --如果奖励是物品isItem就填1否则就填0
					},
				},
				[2] = {
					award = {
						[1] = {itemid = 10312, count = 10, bind = 1, isItem = 1, pro = 1},
					},
				},
				[3] = {
					award = {
						[1] = {itemid = 10312, count = 6, bind = 1, isItem = 1, pro = 1},
						
					},
				},
				[4] = {
					award = {
						[1] = {itemid = 10312, count = 4, bind = 1, isItem = 1, pro = 8},
						[2] = {itemid = 12021, count = 1, bind = 1, isItem = 1, pro = 2},
					},
				},
				[5] = {
					award = {
						[1] = {itemid = 12021, count = 1, bind = 1, isItem = 1, pro = 1},
					
					},
				},
			},--宝箱的物品		
	}, --首次随机出来的箱子是至尊宝箱的额外送的奖励

	boxList = {
		[1] = {
			pro = 60, 		--权重
			openLimit = 2, 	--可开启次数
			activateCost = 16000, --激活消耗封魔值
			awardList = {
				[1] = {
					award = {
						[1] = {itemid = 3, count = 500000, bind = 0, isItem = 0, pro = 1}, --如果奖励是物品isItem就填1否则就填0
					},
					
				},
				[2] = {
					award = {
						[1] = {itemid = 10312, count = 3, bind = 1, isItem = 1, pro = 1},
					},
					
				},
			}, --宝箱的物品
		}, --白宝箱

		[2] = {
			pro = 34, --权重
			openLimit = 3, 	--可开启次数
			activateCost = 24000, --激活消耗封魔值
			awardList = {
				[1] = {
					award = {
						[1] = {itemid = 3, count = 1000000, bind = 0, isItem = 0, pro = 1}, --如果奖励是物品isItem就填1否则就填0
					},
					
				},
				[2] = {
					award = {
						[1] = {itemid = 10312, count = 2, bind = 1, isItem = 1, pro = 1},
					},
					
				},
				[3] = {
					award = {
						[1] = {itemid = 10312, count = 4, bind = 1, isItem = 1, pro = 1},
					},
					
				},
			}, --宝箱的物品
		}, --绿宝箱

		[3] = {
			pro = 5, --权重
			openLimit = 4, 	--可开启次数
			activateCost = 32000, --激活消耗封魔值
			awardList = {
				[1] = {
					award = {
						[1] = {itemid = 3, count = 2000000, bind = 0, isItem = 0, pro = 1}, --如果奖励是物品isItem就填1否则就填0
					},
				},
				[2] = {
					award = {
						[1] = {itemid = 10312, count = 6, bind = 1, isItem = 1, pro = 1},
					},
				},
				[3] = {
					award = {
						[1] = {itemid = 10312, count = 3, bind = 1, isItem = 1, pro = 1},
				
					},
				},
				[4] = {
					award = {
						[1] = {itemid = 10312, count = 2, bind = 1, isItem = 1, pro = 95},
						[2] = {itemid = 12021, count = 1, bind = 1, isItem = 1, pro = 5},
					},
				},
			}, --宝箱的物品
		}, --蓝宝箱

		[4] = {
			pro = 1, --权重
			openLimit = 4, 	--可开启次数
			activateCost = 40000, --激活消耗封魔值
			awardList = {
				[1] = {
					award = {
						[1] = {itemid = 3, count = 3000000, bind = 0, isItem = 0, pro = 1}, --如果奖励是物品isItem就填1否则就填0
					},
				},
				[2] = {
					award = {
						[1] = {itemid = 10312, count = 10, bind = 1, isItem = 1, pro = 1},
					},
				},
				[3] = {
					award = {
						[1] = {itemid = 10312, count = 6, bind = 1, isItem = 1, pro = 1},
						
					},
				},
				[4] = {
					award = {
						[1] = {itemid = 10312, count = 4, bind = 1, isItem = 1, pro = 9},
						[2] = {itemid = 12021, count = 1, bind = 1, isItem = 1, pro = 1},
					},
				},
			}, --宝箱的物品随机列表

		}, --紫宝箱

		[5] = {
			pro = 0, --权重
			openLimit = 5, 	--可开启次数
			activateCost = 48000, --激活消耗封魔值
			awardList = {
				[1] = {
					award = {
						[1] = {itemid = 3, count = 5000000, bind = 0, isItem = 0, pro = 1}, --如果奖励是物品isItem就填1否则就填0
					},
				},
				[2] = {
					award = {
						[1] = {itemid = 10312, count = 10, bind = 1, isItem = 1, pro = 1},
					},
				},
				[3] = {
					award = {
						[1] = {itemid = 10312, count = 6, bind = 1, isItem = 1, pro = 1},
						
					},
				},
				[4] = {
					award = {
						[1] = {itemid = 10312, count = 4, bind = 1, isItem = 1, pro = 8},
						[2] = {itemid = 12021, count = 1, bind = 1, isItem = 1, pro = 2},
					},
				},
				[5] = {
					award = {
						[1] = {itemid = 12021, count = 1, bind = 1, isItem = 1, pro = 1},
					
					},
				},

			}, --宝箱的物品随机列表

		}, --红宝箱

	}
}


local magicTransConfig = {
	
[1] = {minLevel = 60,maxLevel = 64,rate = 1},
[2] = {minLevel = 65,maxLevel = 69,rate = 1},
[3] = {minLevel = 70,maxLevel = 74,rate = 1.1},
[4] = {minLevel = 75,maxLevel = 79,rate = 1},
[5] = {minLevel = 80,maxLevel = 84,rate = 0.909},
[6] = {minLevel = 85,maxLevel = 89,rate = 0.909},
[7] = {minLevel = 90,maxLevel = 94,rate = 0.833},
[8] = {minLevel = 95,maxLevel = 99,rate = 0.833},
[9] = {minLevel = 100,maxLevel = 104,rate = 0.769},
[10] = {minLevel = 105,maxLevel = 109,rate = 0.769},
[11] = {minLevel = 110,maxLevel = 114,rate = 0.714},
[12] = {minLevel = 115,maxLevel = 119,rate = 0.714},
[13] = {minLevel = 120,maxLevel = 124,rate = 0.667},
[14] = {minLevel = 125,maxLevel = 129,rate = 0.667},
[15] = {minLevel = 130,maxLevel = 134,rate = 0.652},
[16] = {minLevel = 135,maxLevel = 139,rate = 0.625},
[17] = {minLevel = 140,maxLevel = 144,rate = 0.556},
[18] = {minLevel = 145,maxLevel = 149,rate = 0.556},
[19] = {minLevel = 150,maxLevel = 1000,rate = 0.5}
}


local buyMagicBoxTimeKey = 656  		--已经购买宝箱领取次数
local getMagicBoxTimeKey = 657  		--今日领取宝箱次数
local magicCountKey = 658       		--封魔值
local curMagicBoxKey = 659	  			--当前拥有的宝箱
local magicBoxOpenTimeKey = 660 		--宝箱已经开启次数
local randomMagicBoxKey = 661	  		--给玩家随机到的宝箱
local magicBoxActivateKey = 662			--宝箱是否已经激活
local refreshFailCountKey = 663			--刷新失败累计次数
local awardOneKey = 664
local awardTwoKey = 665
local awardThreeKey = 666
local awardFourKey = 667
local awardFiveKey = 668

local firstOpenSupremeBoxKey = 680 --是否首次玩封魔宝箱抽到至尊宝箱


local sealMagicItemId = 10295 --封魔令id
local opt = 245
local consumeType = 92
local MSG_S2C_REQ_GET_BOX_INFO 		= 4530
local MSG_S2C_REQ_GET_BOX 			= 4531
local MSG_S2C_REQ_REFRESH_BOX 		= 4532
local MSG_S2C_REQ_OPEN_BOX 			= 4533
local MSG_S2C_REQ_BUY_GET_BOX_TIME 	= 4534
local MSG_S2C_REQ_CAN_SHOW_BOX 		= 4535
local MSG_S2C_REQ_GET_BOX_AWARD 	= 4536
local MSG_S2C_NOTIFY_SEAL_MAGIC_COUNT = 4537


local function GetProSum(t)
	local iSum = 0
	for k, v in ipairs(t) do
		iSum = iSum + v.pro
	end
	return iSum
end

local function GetRandomHitIndex(t)
	local iSum = GetProSum(t)
	local randomNum = math.random(1, iSum)
	local iTotal = 0
	for k,v in ipairs(t) do
		iTotal = iTotal + v.pro
		if randomNum <= iTotal then
			return k
		end
	end
end

local function SendOpenMagicBoxAward(player, box, openCount)
	-- body
	local isFirst = player:get_param(firstOpenSupremeBoxKey)
	if isFirst == 1 then
		conf = magicBoxConf.fristOpenAward
	else
		conf = magicBoxConf.boxList[box]
	end
	-- print_r(conf)
	local awardConf = conf.awardList[openCount]
	local award = awardConf.award
	local hitLine = GetRandomHitIndex(award)
	local awardKey = awardOneKey + openCount - 1
	player:set_param(awardKey, hitLine)
end

local function RefreshMagicBox(player)
	local randomBox = player:get_param(randomMagicBoxKey)
	local refreshConfig = magicBoxConf.refreshConfig[randomBox]
	if refreshConfig == nil then
		return false
	end
	local refreshProConf = refreshConfig.proConf
	local failLimit = refreshConfig.failLimitCount
	local failCount = player:get_param(refreshFailCountKey)
	if failCount >= failLimit then
		return true
	end
	local iSum = refreshProConf[1] + refreshProConf[2]
	local randomNum = math.random(1, iSum)
	if randomNum > refreshProConf[1] then
		return true
	end

	return false
end


local function CreateMagicBoxAwardList(player, box, leftOpen)
	if box ~= 0 then
		local isFirst = player:get_param(firstOpenSupremeBoxKey)
		local conf = nil
		if isFirst == 1 then
			conf = magicBoxConf.fristOpenAward
		else
			conf = magicBoxConf.boxList[box]
		end
		if conf ~= nil and leftOpen <= conf.openLimit then
			local itemCount = 0
			local award = {}
			local startKey = awardOneKey - 1
			for i = 1, 5 do
				local awardKey = startKey + i
				local index = player:get_param(awardKey)
				if index ~= 0 then
					local awardConf = conf.awardList and conf.awardList[i] and conf.awardList[i].award
					if awardConf and awardConf[index] then
						local itemid = awardConf[index].itemid
						local count = awardConf[index].count
						local bind = awardConf[index].bind
						if awardConf[index].isItem == 1 then
							itemCount = itemCount + 1
						end
						local info = 
						{
							itemid 	= itemid,
							count 	= count,
							bind 	= bind or 0
						}
						table.insert(award, info)
					end
				end
			end
			return award, itemCount
		end
	end
end

local function gatherSealMagicBoxInfo(player)
	local leftGet = magicBoxConf.freeLimit - player:get_param(getMagicBoxTimeKey)
	if leftGet < 0 then
		leftGet = 0
	end
	local leftBuy = magicBoxConf.buyLimit - player:get_param(buyMagicBoxTimeKey)
	if leftBuy < 0 then
		leftBuy = 0
	end
	local isActivate = player:get_param(magicBoxActivateKey)
	local magicCount = player:get_param(magicCountKey)
	local randomBox = player:get_param(randomMagicBoxKey)
	local box = player:get_param(curMagicBoxKey)
	local bRandomBox = false
	local leftOpen = 0
	if box == 0 then
		if randomBox == 0 then
			local isFirst = player:get_param(firstOpenSupremeBoxKey)
			if isFirst == 0 then
				randomBox = #magicBoxConf.boxList
				player:set_param(firstOpenSupremeBoxKey, 1)
			else
				randomBox = GetRandomHitIndex(magicBoxConf.boxList)
			end
			player:set_param(randomMagicBoxKey, randomBox)
		end
	else
		local conf = magicBoxConf.boxList[box]
		leftOpen = conf.openLimit - player:get_param(magicBoxOpenTimeKey)
	end
	local award = CreateMagicBoxAwardList(player, box, leftOpen)
	local retMsg = {
		box = box,
		randomBox = randomBox,
		leftGet = leftGet,
		leftOpen = leftOpen,
		leftBuy = leftBuy,
		magicCount = magicCount,
		isActivate = isActivate,
		award = award
	}
	return retMsg
end

local function CheckCanAddMagicCount(player)
	local curBox = player:get_param(curMagicBoxKey)
	local activate = player:get_param(magicBoxActivateKey)
	if curBox == 0 or activate == 1 then
		return false
	end

	local magicCount = player:get_param(magicCountKey)
	local activateNeed = magicBoxConf.boxList[curBox].activateCost

	if magicCount >= activateNeed then
		return false
	end

	return true, activateNeed - magicCount

end

function AddMagicCount(player, killAdd)
	local flag, canAddMax = CheckCanAddMagicCount(player)
	if flag == true then
		local level = player:get_level()
		local rate = 0
		for k, v in ipairs(magicTransConfig) do
			if level >= v.minLevel and level <= v.maxLevel then
				rate = v.rate
				break
			end
		end

		local addCount = math.floor(killAdd * rate)
		if addCount >= canAddMax then
			addCount = canAddMax
		--	player:alert(2,0,0,"封魔宝箱完成");
			OnCompleteQest(player,10,0,1)
			local finishNum = player:get_param(805) + 1
			player:set_param(805, finishNum)
		end
		if addCount > 0 then
			local curHas = player:get_param(magicCountKey)
			player:set_param(magicCountKey, curHas + addCount)
			local notifyMsg = {
				curMagic = curHas + addCount,
				addMagic = addCount,
			}
			-- print_r(notifyMsg)
			player:SendPacketToSelf(MSG_S2C_NOTIFY_SEAL_MAGIC_COUNT, 0, encode(notifyMsg))
		end
	end
end

--校验是否可以显示封魔宝箱
local function CheckCanShowSealMagicBox(player)
	-- body
	local flag = 0
	local curBox = player:get_param(curMagicBoxKey)
	if curBox ~= 0 then
		flag = 1
	end

	if flag == 0 then
		local todayGet = player:get_param(getMagicBoxTimeKey)
		if todayGet < magicBoxConf.freeLimit then
			flag = 1
		end
	end

	if flag == 0 then
		local todayBuy = player:get_param(buyMagicBoxTimeKey)
		if todayBuy < magicBoxConf.buyLimit then
			flag = 1
		end
	end

	return flag
end

local function conmsueMoneyRefresh(player)
	local refreshUseMoney = magicBoxConf.refreshUseMoney
	local money = refreshUseMoney.money
	local moneyType = refreshUseMoney.moneyType
	local bRet = false
	if player:NewGetGold(moneyType) < money then
		player:alert(10, 0, 0, "绑定金币不足")
	else
		player:NewDeductGold(moneyType, money, consumeType)
		bRet = true
	end

	return bRet 
end

---------------------------------------游戏协议---------------------------------

--请求封魔宝箱界面信息
function ReqSealMagicBoxInfo(player)
	local retMsg = gatherSealMagicBoxInfo(player)
	-- print_r(retMsg)
	player:SendPacketToSelf(MSG_S2C_REQ_GET_BOX_INFO, 0, encode(retMsg))
end


--请求领取封魔宝箱
function ReqGetSealMagicBox(player)
	local getCount = player:get_param(getMagicBoxTimeKey) 
	local leftGet = magicBoxConf.freeLimit - getCount
	if leftGet <= 0 then
		local errorMsg = "领取次数已用完"
		player:alert(10, 0, 0, errorMsg)
		return 
	end

	local box = player:get_param(curMagicBoxKey)
	if box ~= 0 then
		local errorMsg = "当前还有宝箱, 不能领取新宝箱"
		player:alert(10, 0, 0, errorMsg)
		return
	end
	local randomBox = player:get_param(randomMagicBoxKey)
	player:set_param(randomMagicBoxKey, 0)
	player:set_param(curMagicBoxKey, randomBox)
	player:set_param(getMagicBoxTimeKey, getCount + 1)
	local retMsg = {
		box = randomBox,
		leftOpen = magicBoxConf.boxList[randomBox] and magicBoxConf.boxList[randomBox].openLimit or 0,
		leftGet = leftGet - 1,
	}
	-- print_r(retMsg)
	player:SendPacketToSelf(MSG_S2C_REQ_GET_BOX, 0, encode(retMsg))

	if randomBox == #magicBoxConf.boxList then
		g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>领取传说宝箱,极大几率开出极品<font color='#ff0000'>修炼丹</font>。<font color='#0be140'>{_showSysWin,我也要开箱,OPEN_SEALMAGICBOX}</font>");
	end
end


--请求刷新封魔宝箱
function ReqRefreshSealMagicBox(player, useMoney)
	local box = player:get_param(curMagicBoxKey)
	if box ~= 0 then
		local errorMsg = "当前还有宝箱,不能刷新"
		player:alert(10, 0, 0, errorMsg)
		return 
	end

	local randomBox = player:get_param(randomMagicBoxKey)
	if randomBox <= 0 then
		return 
	end
	if randomBox >= #magicBoxConf.boxList then
		local errorMsg = "当前宝箱已是最高品质"
		player:alert(10, 0, 0, errorMsg)
		return
	end

	local itemCount = player:GetItemCount(sealMagicItemId)
	if itemCount < magicBoxConf.refreshCost then
		if useMoney == 0 then
			local errorMsg = "封魔令不足,无法刷新"
			player:alert(10, 0, 0, errorMsg)
			return
		elseif useMoney == 1 then
			local bRet = conmsueMoneyRefresh(player)
			if bRet == false then
				return 
			end
		else
			return 
		end
	else
		--消耗封魔令
		player:ConsumeItemById(sealMagicItemId, magicBoxConf.refreshCost, consumeType)
	end
	
	local flag= RefreshMagicBox(player)
	if flag == true then
		randomBox = randomBox + 1
		player:set_param(randomMagicBoxKey, randomBox)
		player:set_param(refreshFailCountKey, 0)
		player:alert(10, 0, 0, "成功提升宝箱品质")
	else
		local failCount = player:get_param(refreshFailCountKey)
		player:set_param(refreshFailCountKey, failCount + 1)
		player:alert(10, 0, 0, "宝箱品质不变,再刷新试试")
	end
	local retMsg = {
		randomBox = randomBox,
	}
	-- print_r(retMsg)
	player:SendPacketToSelf(MSG_S2C_REQ_REFRESH_BOX, 0, encode(retMsg))
end



--请求开启封魔宝箱
function ReqOpenSealMagicBox(player)
	local box = player:get_param(curMagicBoxKey)
	if box == 0 then
		local errorMsg = "当前没有宝箱可开启, 请领取新宝箱"
		player:alert(10, 0, 0, errorMsg)
		return
	end
	local isFirst = player:get_param(firstOpenSupremeBoxKey)
	local conf = nil
	if isFirst == 1 then
		conf = magicBoxConf.fristOpenAward
	else
		conf = magicBoxConf.boxList[box] 
	end

	if conf == nil then
		print("ReqOpenSealMagicBox can not found the conf by box:", box)
		return 
	end

	local isActivate = player:get_param(magicBoxActivateKey)
	if isActivate == 0 then
		local activateCost = conf.activateCost or 1
		local magicCount = player:get_param(magicCountKey)
		if magicCount < activateCost then
			local errorMsg = "封魔值不足,不能开启宝箱"
			player:alert(10, 0, 0, errorMsg)
			return
		end
		player:set_param(magicCountKey, 0)
		player:set_param(magicBoxActivateKey, 1)
	end

	local openCount = player:get_param(magicBoxOpenTimeKey)
	local leftOpen = conf.openLimit - openCount
	if leftOpen <= 0 then
		-- local errorMsg = "当前宝箱开启次数已用完"
		-- player:alert(10, 0, 0, errorMsg)
		return
	end
	openCount = openCount + 1
	player:set_param(magicBoxOpenTimeKey, openCount)
	SendOpenMagicBoxAward(player, box, openCount)
	local award = CreateMagicBoxAwardList(player, box, leftOpen)
	local retMsg = {
		leftOpen = leftOpen - 1,
		award = award,
	}
	-- print_r(retMsg)
	player:SendPacketToSelf(MSG_S2C_REQ_OPEN_BOX, 0, encode(retMsg))
end


--请求购买宝箱领取次数
function ReqBuySealMagicBoxTime(player)
	local getCount = player:get_param(getMagicBoxTimeKey) 
	local leftGet = magicBoxConf.freeLimit - getCount
	if leftGet > 0 then
		local errorMsg = "当前还有免费领取次数, 无需购买"
		player:alert(10, 0, 0, errorMsg)
		return
	end
	local hasBuy = player:get_param(buyMagicBoxTimeKey)
	local leftBuy = magicBoxConf.buyLimit - hasBuy
	if leftBuy <= 0 then
		local errorMsg = "今日可购买次数已经用完,不能再购买"
		player:alert(10, 0, 0, errorMsg)
		return
	end

	--购买消耗
	local needMoney = magicBoxConf.buyCost
	if player:get_vcoin() < needMoney then
		local errorMsg = "元宝不足,不能购买宝箱领取次数"
		player:alert(10,0,0,errorMsg)
		return 
	else
		player:sub_vcoin(needMoney)
	end

	getCount = magicBoxConf.freeLimit - 1
	player:set_param(getMagicBoxTimeKey, getCount)
	player:set_param(buyMagicBoxTimeKey, hasBuy + 1)
	local retMsg = {
		leftBuy = leftBuy - 1,
		leftGet = 1,
	}
	-- print_r(retMsg)
	player:SendPacketToSelf(MSG_S2C_REQ_BUY_GET_BOX_TIME, 0, encode(retMsg))
end


--请求激活宝箱
-- function ReqActivateMagicBox(player)
-- 	local box = player:get_param(curMagicBoxKey)
-- 	if box == 0 then
-- 		local errorMsg = "当前没有宝箱可以激活,请先领取宝箱"
-- 		player:alert(10, 0, 0, errorMsg)
-- 		return
-- 	end

-- 	local isActivate = player:get_param(magicBoxActivateKey)
-- 	if isActivate == 1 then
-- 		local errorMsg = "当前宝箱已经激活"
-- 		player:alert(10, 0, 0, errorMsg)
-- 		return
-- 	end

-- 	local conf = magicBoxConf.boxList[box] 
-- 	if conf == nil then
-- 		print("ReqActivateMagicBox can not found the conf by box:", box)
-- 		return 
-- 	end

-- 	local activateCost = conf.activateCost or 1
-- 	local magicCount = player:get_param(magicCountKey)
-- 	if magicCount < activateCost then
-- 		local errorMsg = "封魔值不足,无法激活宝箱"
-- 		player:alert(10, 0, 0, errorMsg)
-- 		return
-- 	end
-- 	player:set_param(magicCountKey, 0)
-- 	player:set_param(magicBoxActivateKey, 1)
-- 	local retMsg = {
-- 		isActivate = 1,
-- 	}
-- 	-- print_r(retMsg)
-- 	player:SendPacketToSelf(MSG_S2C_REQ_ACTIVATE_BOX, 0, encode(retMsg))
-- end



--领取宝箱奖励
function ReqGetMagicBoxAward(player)
	local box = player:get_param(curMagicBoxKey)
	if box == 0 then
		local errorMsg = "当前没有宝箱奖励可以领取"
		player:alert(10, 0, 0, errorMsg)
		return
	end

	local isActivate = player:get_param(magicBoxActivateKey)
	if isActivate == 0 then
		local errorMsg = "宝箱还没有激活, 不能领取奖励"
		player:alert(10, 0, 0, errorMsg)
		return
	end

	local conf = magicBoxConf.boxList[box]
	leftOpen = conf.openLimit - player:get_param(magicBoxOpenTimeKey)

	if leftOpen > 0 then
		local errorMsg = "宝箱未开启完,不能领取奖励"
		player:alert(10, 0, 0, errorMsg)
		return
	end

	local award, itemCount = CreateMagicBoxAwardList(player, box, leftOpen)
	if player:num_bag_black(0) < itemCount then
		local errorMsg = "您的背包空间不足,请先清理背包"
		player:alert(10, 0, 0, errorMsg)
		return 
	end
	local fly = 0
	--加上奖励
	for k, v in ipairs(award or {}) do
		local itemid = v.itemid
		local count = v.count
		local bind = v.bind
		player:NewAddItem(itemid, count, opt, consumeType, fly, bind)
	end

	player:set_param(magicBoxOpenTimeKey, 0)
	player:set_param(curMagicBoxKey, 0)
	for i = awardOneKey, awardFiveKey do
		--领取完奖励之后重置
		player:set_param(i, 0)
	end
	local randomBox = GetRandomHitIndex(magicBoxConf.boxList)
	player:set_param(randomMagicBoxKey, randomBox)
	player:set_param(magicBoxActivateKey, 0)

	local retMsg = {flag = 1}
	player:SendPacketToSelf(MSG_S2C_REQ_GET_BOX_AWARD, 0, encode(retMsg))

	--返回4530协议
	-- ReqSealMagicBoxInfo(player)
	local isFirst = player:get_param(firstOpenSupremeBoxKey)
	if isFirst == 1 then
		player:set_param(firstOpenSupremeBoxKey, 2)
	end
	ReqCanShowSealMagicBoxIcon(player)
end


--请求是否要显示封魔宝箱
function ReqCanShowSealMagicBoxIcon(player)
	local flag = CheckCanShowSealMagicBox(player)
	local retMsg = {flag = flag}
	-- print_r(retMsg)
	player:SendPacketToSelf(MSG_S2C_REQ_CAN_SHOW_BOX, 0, encode(retMsg))
end

--请求立即完成
function ReqCompleteMagicBox(player)
	local box = player:get_param(curMagicBoxKey)
	if box == 0 then
		local errorMsg = "当前没有宝箱"
		player:alert(10, 0, 0, errorMsg)
		return 
	end

	local isActivate = player:get_param(magicBoxActivateKey)
	if isActivate == 1 then
		local errorMsg = "宝箱已经开启,不需要立即完成"
		player:alert(10, 0, 0, errorMsg)
		return 
	end
	
	local magicCount = player:get_param(magicCountKey)
	local activateNeed = magicBoxConf.boxList[box].activateCost

	if magicCount >= activateNeed then
		local errorMsg = "封魔值足够,不需要立即完成"
		player:alert(10, 0, 0, errorMsg)
		return 
	end

	local completeCost = magicBoxConf.completeCost
	if player:get_vcoin() < completeCost then
		local errorMsg = "元宝不足,无法立即完成"
		player:alert(10,0,0,errorMsg)
		return 
	else
		player:sub_vcoin(completeCost)
	end
	local retMsg = {falg = 0}
	player:set_param(magicCountKey, activateNeed)
	player:SendPacketToSelf(4538, 0, encode(retMsg))
	
--	player:alert(2,0,0,"封魔宝箱完成");
	OnCompleteQest(player,10,0,1)
	local finishNum = player:get_param(805) + 1
	player:set_param(805, finishNum)
end

