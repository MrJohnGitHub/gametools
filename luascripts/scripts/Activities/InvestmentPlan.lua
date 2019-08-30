--[[
开服活动
投资计划
@author:lizimin
@date 2016/8/22
--]]


--[[

	配置说明
	award里面的itemid:是物品就填物品ID， 金币填1，绑金填2  元宝填101 绑元填100

]]
local InvestmentPlanConfig = {
	needMoney = 3888,
	beginDay = 1,  --用来配置开始天数
	overDay = 5,
	buyDay = {
		begin = 1,
		over = 3,
	}, --购买的时间配置
	showDay = {
		begin = 1,
		over = 10,
	}, --显示的时间配置
	limit = 99, --用来配置最多能买多少份
	awardList = {
		[1] = {
			award = {
		      [1] = {itemid = 100, count = 3888, bind = 1},
		      [2] = {itemid = 2, count = 3888888, bind = 1}
			},
			itemCount = 0, --标志有多少个是物品的，需要用来判断背包是否足够
		},
		[2] = {
			award = {
			   [1] = {itemid = 100, count = 3000, bind = 1},
			   [2] = {itemid = 2, count = 1888888, bind = 1}
			},
			itemCount = 0, --标志有多少个是物品的，需要用来判断背包是否足够
		},
		[3] = {
			award = {
				[1] = {itemid = 100, count = 3000, bind = 1},
				[2] = {itemid = 2, count = 1888888, bind = 1}
			},
			itemCount = 0, --标志有多少个是物品的，需要用来判断背包是否足够
		},
		[4] = {
			award = {
				[1] = {itemid = 100, count = 3000, bind = 1},
				[2] = {itemid = 2, count = 2888888, bind = 1}
			},
			itemCount = 0, --标志有多少个是物品的，需要用来判断背包是否足够
		},
		[5] = {
			award = {
				[1] = {itemid = 100, count = 3000, bind = 1},
				[2] = {itemid = 2, count = 3888888, bind = 1}
			},
			itemCount = 0, --标志有多少个是物品的，需要用来判断背包是否足够
		},
		[6] = {
			award = {
				[1] = {itemid = 100, count = 3000, bind = 1},
				[2] = {itemid = 2, count = 5888888, bind = 1}
			},
			itemCount = 0, --标志有多少个是物品的，需要用来判断背包是否足够
		},
		[7] = {
			award = {
				[1] = {itemid = 101, count = 3888, bind = 0},
				[2] = {itemid = 2, count = 8888888, bind = 1}
			},
			itemCount = 0, --标志有多少个是物品的，需要用来判断背包是否足够
		},
	}
}

local InvestmentPlanKey = 652
local InvestmentPlanAwardKey = 653
local gHaveBuyCount = 45
local S2C_NOTIFY_GET_AWARD_MSG_ID = 4430
local S2C_GET_AWARD_MSG_ID = 4429
local S2C_FANTIAN_ICON_STATUS = 4431
local S2C_INVESTMENT_PLAN_ICON_STATUS = 4439
local MialReturnAwardFlag = 654


local function GetErrorNotifyMsg(errorCode, iWhichDay)
	local msg 
	if errorCode == 1 then
		msg = string.format("您还没购买投资计划，不能领取奖励")
	elseif errorCode == 2 then
		msg = string.format("您已经领取过第%d天的奖励，不能重复领取", iWhichDay)
	elseif errorCode == 3 then
		msg = string.format("购买投资计划不足%d天，不能领取奖励", iWhichDay)
	end

	return msg
end

--获取今天是开服后第几天
function GetTodayIsWhichDay(openSerTime)
	local openDate = os.date("*t", openSerTime)
	openDate.hour = 0
	openDate.min = 0
	openDate.sec = 0
	openSerTime = os.time(openDate)

	local curTime = os.time()
	local daySec = 24 * 60 * 60
	local diffTime = curTime - openSerTime
	local diffDay = math.floor(diffTime / daySec) + 1
	return diffDay
end

--校验是否已经领取过这天的奖励了
local function CheckHasGetThisDayAward(player, iWhichDay)
	local flag = false
	local retCode = player:GetFlagBitByIndex(InvestmentPlanAwardKey, iWhichDay)
	if retCode == 1 then
		flag = true
	end
	return flag
end

--校验是否已经购买了投资计划
local function CheckHasBuyInvestmentPlan(player)
	local buyTimeStamp = player:get_param(InvestmentPlanKey)
	if buyTimeStamp == 0 then
		return false
	end

	return true
end

--统计购买投资计划过去了多少天了
local function CalculatePassHowMuchDay(player)
	local buyTimeStamp = player:get_param(InvestmentPlanKey)
	if buyTimeStamp == 0 then
		return 0
	end
	local curDate = os.date("*t", os.time())
	curDate.hour = 0
	curDate.min = 0
	curDate.sec = 0
	local curTime = os.time(curDate)
	local diffTime = curTime - buyTimeStamp
	local daySec = 24 * 60 * 60
	local diffDay = math.floor(diffTime / daySec) + 1
	return diffDay
end

local function GetBuyPlanStartAndEndTimeStamp()
	local initTime = g_get_init_time()
	local initDate = os.date("*t", initTime)
	initDate.hour = 0
	initDate.min = 0
	initDate.sec = 0
	initTime = os.time(initDate)
	local buyBegin = InvestmentPlanConfig.buyDay and InvestmentPlanConfig.buyDay.begin or 1
	local buyOver = InvestmentPlanConfig.buyDay and InvestmentPlanConfig.buyDay.over or 1

	local beginTimeStamp = initTime + (buyBegin - 1) * 24 * 60 * 60
	local overTimeStamp = initTime + buyOver * 24 * 60 * 60
	return beginTimeStamp, overTimeStamp
end

--校验时间是否足够领取奖励
local function CheckIsTimeEnough(player, iWhichDay)
	local diffDay = CalculatePassHowMuchDay(player)
	if diffDay < iWhichDay then
		return false
	end

	return true
end

--校验是否可以领取奖励
local function IsCanGetInvestmentPlanAward(player, iWhichDay)
	if CheckHasGetThisDayAward(player, iWhichDay) == true then
		return 2
	end

	if CheckIsTimeEnough(player, iWhichDay) == false then
		return 3
	end

	return 0
end

--校验是否已经卖完了
local function CheckIsSellOver()
	local limit = InvestmentPlanConfig.limit
	local iTotalBuy = g_get_param(gHaveBuyCount)
	if iTotalBuy >= limit then
		return true
	end

	return false
end


--校验当前时间是否可以买投资计划
local function CheckIsNowCanBuy(openSerTime)
	local whichDay = GetTodayIsWhichDay(openSerTime)
	local buyBegin = InvestmentPlanConfig.buyDay and InvestmentPlanConfig.buyDay.begin or 1
	local buyOver = InvestmentPlanConfig.buyDay and InvestmentPlanConfig.buyDay.over or 1
	if whichDay > buyOver or whichDay < buyBegin then
		return false
	end

	return true
end

--校验当前时间是否可以显示图标
local function CheckNowIsCanShowIcon(player, openSerTime)
	local whichDay = GetTodayIsWhichDay(openSerTime)
	local showOver = InvestmentPlanConfig.showDay and InvestmentPlanConfig.showDay.over or 1
	if whichDay > showOver then
		return false
	end

	--判断是玩家是否已经买了投资计划
	local bFlag = CheckHasBuyInvestmentPlan(player)
	if bFlag == false then
		local buyOver = InvestmentPlanConfig.buyDay and InvestmentPlanConfig.buyDay.over
		if whichDay > buyOver then
			return false
		end
	end

	return true
end


local function CheckCanShowIconAndHasAward(player, initTime)
	local showFlag = CheckNowIsCanShowIcon(player, initTime)
	local awardStatus = 0
	if showFlag then
		if CheckHasBuyInvestmentPlan(player) == true then
			local awardList = InvestmentPlanConfig.awardList
			local iCount = #awardList
			if iCount > 0 then
				local passDay = CalculatePassHowMuchDay(player)
				if passDay < iCount then
					iCount = passDay
				end
				for i = 1, iCount do
					if IsCanGetInvestmentPlanAward(player, i) == 0 then
						awardStatus = 1
						break
					end
				end

			end
		end
	end

	return showFlag, awardStatus
end

local function GetInvestmentPlanLeftCount()
	local iTotalBuy = g_get_param(gHaveBuyCount)
	local leftCount = InvestmentPlanConfig.limit - iTotalBuy
	return leftCount
end


local function CheckIsReturnPlanAward(player)
	local val = player:get_param(MialReturnAwardFlag)
	if val > 0 then
		return true
	end

	return false
end


local function GetMailItemAndGold(iWhichDay)
	local awardConf = InvestmentPlanConfig.awardList[iWhichDay]
	local award = awardConf.award
	local item = {}
	local gold = {0, 0, 0, 0}
	local bHaveGold = false
	for k, v in ipairs(award) do
		if v.itemid == 100 then 
			gold[3] = v.count
			bHaveGold = true
		elseif v.itemid == 101 then
			gold[2] = v.count
			bHaveGold = true
		elseif v.itemid == 1 then
			gold[1] = v.count
			bHaveGold = true
		elseif v.itemid == 2 then
			gold[4] = v.count
			bHaveGold = true
		else 
			table.insert(item, v.itemid)
			table.insert(item, v.count)
		end
	end
	local mailGold = ""
	local mailItem = ""
	if #item > 0 then
		mailItem = "["
		local i = 1
		local iCount = 0
		while (i < #item) do
			if iCount > 0 then
				mailItem = mailItem..","
			end
			local itemid = item[i]
			local itemCount = item[i+1]
			mailItem = mailItem..itemid..","..itemCount
			i = i + 2
			iCount = iCount + 1
		end
		mailItem = mailItem.."]"
	else
		mailItem = "[0,0,0,0]"
	end

	if bHaveGold == true then
		mailGold = "["
		local iCount = 0
		for k, v in ipairs(gold) do
			if iCount > 0 then
				mailGold = mailGold..","
			end
			mailGold = mailGold..v
			iCount = iCount + 1
		end
		mailGold = mailGold.."]"
	else
		mailGold = "[0, 0, 0, 0]"
	end
	-- print(mailGold)
	-- print(mailItem)
	return mailItem, mailGold
end

function CheckPreferentialGiftCanShow(player)
	local iCount = player:get_param(220)
	local initTime = g_get_init_time()
	local passDay = GetTodayIsWhichDay(initTime)
	local showFlag = true
	if iCount >= 15 and passDay > 7 then
		showFlag = false
	end

	return showFlag, 0
end

--------------------------------------------------------游戏协议-----------------------------------------

--请求购买投资计划
function HandlerBuyInvestmentPlan(player)
	if CheckIsSellOver() == true then
		local notifyMsg = "投资计划已经被抢购完了"
		player:alert(10,0,0,notifyMsg)
		return 
	end
	local initTime = g_get_init_time()
	if CheckIsNowCanBuy(initTime) == false then
		local notifyMsg = "不在活动购买期间内, 不能购买投资计划"
		player:alert(10,0,0,notifyMsg)
		return
	end

	local buyTimeStamp = player:get_param(InvestmentPlanKey)
	if buyTimeStamp ~= 0 then
		local notifyMsg = "您已经购买过投资计划,不能重复购买"
		player:alert(10,0,0,notifyMsg)
		return 
	end

	local needMoney = InvestmentPlanConfig.needMoney
	if player:get_vcoin() < needMoney then
		local notifyMsg = "元宝不足,不能购买投资计划"
		player:alert(10,0,0,notifyMsg)
		return 
	else
		player:sub_vcoin(needMoney)
	end

	local curDate = os.date("*t", os.time())
	curDate.hour = 0
	curDate.min = 0
	curDate.sec = 0
	local curTime = os.time(curDate)
	player:set_param(InvestmentPlanKey, curTime)
	local leftCount = GetInvestmentPlanLeftCount()
	local beginTimeStamp, endTimeStamp = GetBuyPlanStartAndEndTimeStamp()
	local retMsg = {
		passDay = 1,
		awardFlag = 0,
		surplus = leftCount,
		startTime = beginTimeStamp,
		endTime = endTimeStamp,
	} --购买成功后直接通知第一天可以领取
	player:SendPacketToSelf(S2C_NOTIFY_GET_AWARD_MSG_ID, 0, encode(retMsg))
	local iTotalBuy = g_get_param(gHaveBuyCount)
	g_set_param(gHaveBuyCount, iTotalBuy + 1)
	g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>参与了疯狂豪礼<font color='#ff0000'>投资计划</font>，7天可获10倍返利！" .. "<font color='#0be140'>{_showSysWin,我也要投资,OPEN_TOUZI}</font>");
	NotifyInvestmentPlanHasAward(player)
end



function HandlerGetInvestmentPlanAward(player, iWhichDay)
	local awardList = InvestmentPlanConfig.awardList
	if iWhichDay < 1 or iWhichDay > #awardList then
		return 
	end
	if CheckHasBuyInvestmentPlan(player) == false then
		local notifyMsg = "您还没购买投资计划，不能领取奖励"
		player:alert(10, 0, 0, notifyMsg)
		return 
	end
	local initTime = g_get_init_time()
	local passDay = GetTodayIsWhichDay(initTime)
	local showOver = InvestmentPlanConfig.showDay and InvestmentPlanConfig.showDay.over or 1
	if passDay > showOver then
		local notifyMsg = "活动已经过期，不能领取奖励"
		player:alert(10, 0, 0, notifyMsg)
		return 
	end

	local retCode = IsCanGetInvestmentPlanAward(player, iWhichDay)
	if retCode == 0 then
		local awardConf = awardList[iWhichDay]
		local award = awardConf.award
		local itemCount = awardConf.itemCount
		if player:num_bag_black(0) < itemCount then
			local notifyMsg = "您的背包空间不足,请先清理背包"
			player:alert(10, 0, 0, notifyMsg)
			return 
		end
		--设置应该领取过这天的
		player:SetFlagBitByIndex(InvestmentPlanAwardKey, iWhichDay)
		local vcoinCount = 0
		local addBindCoinCount = 0
		local fly = 0
		for k, v in ipairs(award) do
			if v.itemid == 101 then
				vcoinCount = vcoinCount + v.count
			end

			if v.itemid == 100 then
				addBindCoinCount = addBindCoinCount + v.count
			end
			player:NewAddItem(v.itemid, v.count, 243, 71, fly, v.bind)
		end
		if vcoinCount > 0 then
			player:SendVcoinFly(vcoinCount, 10,0)
		end

		if addBindCoinCount > 0 then
			player:SendVcoinFly(addBindCoinCount, 10,1)
		end

		player:alert(10, 0, 0, "成功领取奖励")

		local awardFlag = player:get_param(InvestmentPlanAwardKey)
		local retMsg = {awardFlag = awardFlag}
		-- print_r(retMsg)
		player:SendPacketToSelf(S2C_GET_AWARD_MSG_ID, 0, encode(retMsg))
		NotifyInvestmentPlanHasAward(player)
	else
		local errorMsg = GetErrorNotifyMsg(retCode, iWhichDay)
		player:alert(10,0,0,errorMsg)
	end
end


--请求投资计划信息
function HandlerGetInvestmentPlanInfo(player)
	local initTime = g_get_init_time()
	local bFlag = CheckNowIsCanShowIcon(player, initTime)
	if bFlag == false then
		return 
	end

	local passDay = 0
	if CheckHasBuyInvestmentPlan(player) then
		passDay = CalculatePassHowMuchDay(player)
	end

	local awardFlag = player:get_param(InvestmentPlanAwardKey)
	local leftCount = GetInvestmentPlanLeftCount()
	local beginTimeStamp, endTimeStamp = GetBuyPlanStartAndEndTimeStamp()
	local retMsg = {
		awardFlag = awardFlag,
		passDay = passDay,
		surplus = leftCount,
		startTime = beginTimeStamp,
		endTime = endTimeStamp,
	}
	-- print_r(retMsg)
	player:SendPacketToSelf(S2C_NOTIFY_GET_AWARD_MSG_ID, 0, encode(retMsg))
end

--请求梵天豪礼图标状态
function HandlerGetFanTianGifState(player)
	local arr = {}
	local retMsg = {arr = arr}
	local initTime = g_get_init_time()

	--特惠礼包
	local showFlag, awardStatus = CheckPreferentialGiftCanShow(player)
	if showFlag == true then
		local info = {
			id = 1,
			state = awardStatus
		}
		table.insert(arr, info)
	end


	--连充豪礼
	showFlag, awardStatus = CheckOpenActCanShowAndHasAwardGet(player, initTime, 1)
	if showFlag == true then
		local info = {
			id = 2,
			state = awardStatus
		}
		table.insert(arr, info)
	end

	--累计充值是否显示
	showFlag, awardStatus = CheckOpenActCanShowAndHasAwardGet(player, initTime, 9)
	if showFlag == true then
		local info = {
			id = 3,
			state = awardStatus
		}
		table.insert(arr, info)
	end

	--充值排行
	showFlag, awardStatus = CheckOpenActCanShowAndHasAwardGet(player, initTime, 10)
	if showFlag == true then
		local info = {
			id = 4,
			state = awardStatus
		}
		table.insert(arr, info)
	end

	showFlag, awardStatus = CheckTreasureRetAwardCanShowAndHasAward(player)
	if showFlag == true then
		local info = {
			id = 5,
			state = awardStatus
		}
		table.insert(arr, info)
	end

	showFlag, awardStatus = CheckConsumeRetAwardCanShowAndHasAward(player)
	if showFlag == true then
		local info = {
			id = 6,
			state = awardStatus
		}
		table.insert(arr, info)
	end

	showFlag, awardStatus = CheckGoldRetCanShowAndHasAward(player)
	if showFlag == true then
		local info = {
			id = 7,
			state = awardStatus
		}
		table.insert(arr, info)
	end
	
	-- print_r(retMsg)
	player:SendPacketToSelf(S2C_FANTIAN_ICON_STATUS, 0, encode(retMsg))

	-- HandlerGatherOpenActivityInfo(player, 50) --每日消费活动

end


function NotifyInvestmentPlanHasAward(player)
	--投资计划
	local arr = {}
	local retMsg = {arr = arr}
	local initTime = g_get_init_time()
	local showFlag, awardStatus = CheckCanShowIconAndHasAward(player, initTime)
	if showFlag == true then
		local info = {
			id = 1,
			state = awardStatus
		}
		table.insert(arr, info)
	end
	-- print_r(retMsg)
	player:SendPacketToSelf(S2C_INVESTMENT_PLAN_ICON_STATUS, 0, encode(retMsg))
end



-- local MailContent = {
	
-- 	[1]

-- }


function MailReturnPlanAward(player)
	local bBuy = CheckHasBuyInvestmentPlan(player)
	local bReturn = CheckIsReturnPlanAward(player) 
	if bBuy == true  and bReturn == false then
		local initTime = g_get_init_time()
		local iWhichDay = GetTodayIsWhichDay(initTime)
		local lastDay = InvestmentPlanConfig.showDay and InvestmentPlanConfig.showDay.over or 1
		if iWhichDay > lastDay then
			local awardList = InvestmentPlanConfig.awardList
			local iCount = #awardList
			for i = 1, iCount do
				if CheckHasGetThisDayAward(player, i) == false then
					player:SetFlagBitByIndex(InvestmentPlanAwardKey, i)
					local subject = "投资计划奖励"
					local body = string.format("这是您未领取的第%d天的投资计划的奖励,请查收。", i)
					local mailItem, mailGold = GetMailItemAndGold(i)
					player:SendSystemMail(subject, body, mailItem, mailGold, 1)
				end
			end
			player:set_param(MialReturnAwardFlag, os.time())
		end
	end
end
