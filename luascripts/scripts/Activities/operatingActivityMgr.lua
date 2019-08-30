
--运营活动
--以后新的运营活动的入库就在这里写

--[[
13 ---消费活动排行榜
14 ---新的充值排行榜活动
15 ---魂珠排行榜
16 ---宝石积分排行榜
17 ---BOSS积分排行榜
50 ---每日消费活动id
51 ---集字活动
52 ---登录有礼
53 ---圣诞节代币兑换
54 ---礼包抢购
55 ---限时秒杀
56 ---单笔充值
57 ---元旦掉落
58 ---新的寻宝有礼
59 ---副本有礼运营活动
60 ---玄神有礼
61 ---公会有礼活动
62 ---7天充值
63 ---新元宝转盘
64 ---魂珠积分活动
65 ---元宝返还
66 ---连续充值
67 ---神秘商店
68 ---每日累充活动
70 ---宝石积分竞技
71 ---BOSS积分竞技
72 ---元宝宝箱活动
73 ---幸运转盘
74 ---讨伐BOSS
--]]

HanlderGatherActivityInfoEnum = 
{
	--活动id做key
	[13] = gatherConsumeActivityRankInfo,
	[14] = gatherNewPayActivityRankInfo,
	[15] = gatherSoulBeadActivityRankInfo,
	[16] = gatherGemScoreCompActivityRankInfo,
	[17] = gatherBossScoreCompActivityRankInfo,
	[50] = GatherDayCostActivityInfo,
	[51] = TextCollectActivityInfo,
	[52] = FestivalLoginActivityInfo,
	[53] = GiftExchangeActivityInfo,
	[56] = PayActivityInfo,
-- 	[57] = NewYearDropActivityInfo,
	[58] = GatherTreasureGiftActivityInfo,
	[59] = GatherInstanceGiftActivityInfo,
	[60] = XuanshenYouLiActivityInfo,
	[61] = GatherGuildGiftActivityInfo,
	[62] = GatherSevenDayPayActivityInfo,
	[63] = NewChargeBackGoldActivityInfo,
	[64] = GatherSoulBeadScoreActivityInfo,
	[65] = GatherGoldRetActivityInfo,
	[66] = GatherKeepPayActivityInfo,
	[67] = OnInitOperateShop,
	[68] = GatherCumulativePayActivityInfo,
	[69] = FengTianYouLiActivityInfo,
	[70] = GatherGemCompetitiveActivityInfo,
	[71] = GatherBossScoreActivityInfo,
	[72] = GatherGoldBoxActivityInfo,
	[73] = GatherConsumeDialActivityInfo,
	[74] = TaoFaBossActivityInfo,

}

HandlerReqGetActAwardEnum = 
{
	--活动id做key
	[50] = HandlerGetDayCostActivityAwardByIndex,
	[51] = HandlerTextCollectActivityAwardByIndex,
	[52] = HandlerFestivalLoginAwardByIndex,
	[53] = HandlerGetGiftExchangeActivityAwardByIndex,
	[56] = HandlerPayActivityAwardByIndex,
	[58] = HandlerGetTreasureGiftActivityAwardByIndex,
	[59] = HandlerGetInstanceGiftActivityAwardByIndex,
	[60] = HandlerGetXuanShenYouLiAwardByIndex,
	[61] = HandlerGetGuildGiftActivityAwardByIndex,
	[62] = HandlerGetSevenDayPayActivityAwardByIndex,
	[63] = HandlerNewChargeBackGoldAwardByIndex,
	[64] = HandlerGetSoulBeadScoreActivityAwardByIndex,
	[65] = HandlerGetGoldRetActivityAwardByIndex,
	[66] = HandlerGetKeepPayActivityAwardByIndex,
	[68] = HandlerGetCumulativePayActivityAwardByIndex,
	[69] = HandlerGetFengTianYouLiAwardByIndex,
	[70] = HandlerGetGemCompetitiveActivityAwardByIndex,
	[71] = HandlerGetBossScoreActivityAwardByIndex,
	[72] = HandlerGetGoldBoxActivityAwardByIndex,
	[73] = HandlerGetConsumeDialActivityAwardByIndex,
	[74] = HandlerGetTaoFaBossAwardByIndex,
}

--合服清理函数
HandlerUnionClear = {
	[13] = cleargatherConsumeActivityRankInfo,
	[14] = cleargatherNewPayActivityRankInfo,
	[15] = cleargatherSoulBeadActivityRankInfo,
	[16] = cleargatherGemScoreCompActivityRankInfo,
	[17] = cleargatherBossScoreCompActivityRankInfo,
	[50] = clearGatherDayCostActivityInfo,
	[51] = clearTextCollectActivityInfo,
	[52] = clearFestivalLoginActivityInfo,
	[53] = clearGiftExchangeActivityInfo,
	[54] = clearOnGiftBuyInfo,
	[56] = clearPayActivityInfo,
-- 	[57] = clearNewYearDropActivityInfo,
	[58] = clearGatherTreasureGiftActivityInfo,
	[59] = clearGatherInstanceGiftActivityInfo,
	[60] = clearXuanshenYouLiActivityInfo,
	[61] = clearGatherGuildGiftActivityInfo,
	[62] = clearGatherSevenDayPayActivityInfo,
	[63] = clearNewChargeBackGoldActivityInfo,
	[64] = clearGatherSoulBeadScoreActivityInfo,
	[65] = clearGatherGoldRetActivityInfo,
	[66] = clearGatherKeepPayActivityInfo,
	[67] = clearOnInitOperateShop,
	[68] = clearGatherCumulativePayActivityInfo,
	[69] = clearFengTianYouLiActivityInfo,
	[70] = clearGatherGemCompetitiveActivityInfo,
	[71] = clearGatherBossScoreActivityInfo,
	[72] = clearGatherGoldBoxActivityInfo,
	[73] = clearGatherConsumeDialActivityInfo,
	[74] = clearTaoFaBossActivityInfo,
}

--合服次数不一致，清理活动数据
function ClearActivity(player)
	for actId, func in pairs(HandlerUnionClear) do
		if func ~= nil then
			func(player)
		end
	end
end


OPERATING_REQ_INFO_MSG_ID = 4801
OPERATING_REQ_GET_AWARD_MSG_ID = 4802
OPERATING_GATHER_OPEN_ACT_STATUS = 4803


--这个接口是用来判断消费活动是否开启的
--返回的时候从后往前返回
--因为lua栈是先进后出
function CheckConsumeActivityIsOpen(player)
	local ret1 = 0 --消费返利
	if CheckConsumeRetActIsOpen() == true then
		ret1 = 1
	end

	local ret2 = 0 --消费返还元宝
	if CheckActGoldRetIsOpen() == true then
		ret2 = 1
	end
	
	local ret3 = CheckDayCostIsOpen(player) or 0 --每日消费
	local ret4 = isCosumeActivityRankOpen(player) or 0
	return ret4, ret3, ret2, ret1
end

function GetOperActivityConfig(_conf)
	local curTime = os.time()
	for k, v in pairs(_conf) do
		if v.isUseOpen and v.isUseOpen == true then
			local OpenStartDay = v.OpenStartDay
			local OpenEndDay = v.OpenEndDay
			local openTimeStamp;
			local bVaild = false
			if  g_get_union_day() > 0 then
				if v.isUnionFlag and v.isUnionFlag == true then
					bVaild = true
					openTimeStamp = g_get_union_time_sec0() + 1
				end
			else
				if v.isUnionFlag and v.isUnionFlag == true then
					bVaild = false
				else
					openTimeStamp = g_get_init_time_sec0()
					bVaild = true
				end
			end

			if bVaild == true then
				local startTime = openTimeStamp + (OpenStartDay - 1) * 24 * 60 * 60
				local endTime = openTimeStamp + OpenEndDay * 24 * 60 * 60 - 2
				if curTime +2 >= startTime and curTime < endTime then
					v.overtimeStamp = startTime
					return v, startTime, endTime, k
				end
			end
		else
			local startTime = os.time(v.StartTime)
			local endTime = os.time(v.EndTime)
			local openTimeStamp 
			local bVaild = false
			if g_get_union_day() > 0 then
				if v.isUnionFlag and v.isUnionFlag == true then
					openTimeStamp = g_get_union_time_sec0()
					bVaild = true
				end
			else
				if v.isUnionFlag and v.isUnionFlag == true then
					bVaild = false
				else
					openTimeStamp = g_get_init_time_sec0()
					bVaild = true
				end
				
			end

			if bVaild == true then
				if curTime +2>= startTime and curTime < endTime then
					if v.afterOpen then
						local pass = math.floor((startTime - openTimeStamp) / 86400) + 1
						local lessOpen = v.lessOpen or 999999
						if v.afterOpen <= pass and pass <= lessOpen then
							v.overtimeStamp = startTime
							return v, startTime, endTime, k
						end
					else
						v.overtimeStamp = startTime
						return v, startTime, endTime, k
					end
				end
			end
		end
	end
	return nil, curTime - 1000, curTime - 100, nil
end


function NewGatherMailItemAndGold(awardConf)
	local award = awardConf.awardList
	-- print_r(award)
	local item = {}
	local gold = {0, 0, 0, 0}
	local bindList = {}
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
			if v.bind then
				table.insert(bindList, v.bind)
			else
				--不填我就默认是绑定的了
				table.insert(bindList, 1)
			end
		end
	end
	-- print_r(item)
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

	local mailbinds = ""
	if #bindList > 0 then
		mailbinds = mailbinds.."["
		for i = 1, #bindList do
			if i > 1 then
				mailbinds = mailbinds..","
			end
			mailbinds = mailbinds..bindList[i]
		end
		mailbinds = mailbinds.."]"
	end
	-- print(mailGold)
	-- print(mailItem)
	return mailItem, mailGold, mailbinds
end


--[[
	我们这里做一个约定
	get_param里面有三个变量
	action是存关键值的，比如每日累消活动，action存的今天消费的金额
	misc存的就是一件领取奖励的标识状态位
	type存的就是活动版本号
--]]

function IsResetActivityAwardFlagInfo(player, conf, paramKey, timeKey, overTime)
	--这里传递一个conf在活动期间内的配置
	local flag = false
	if conf ~= nil then
		-- if timeKey ~= nil then
		-- local lastOverTime = player:get_param(timeKey)
		-- else
		-- 	local action, misc, type_ = player:get_param_all_info(paramKey)
		-- 	if type_ ~= conf.version then
		-- 		--版本号不一样的就重置所有的标识位
		-- 		flag = true
		-- 	end
		-- end
		overTime = conf.overtimeStamp
		local useTime = false
		local lastOverTime = 0
		if timeKey ~= nil then
			lastOverTime = player:get_param(timeKey)
			if lastOverTime ~= 0 then
				useTime = true
			end
		end

		if useTime == true then
			if lastOverTime ~= overTime then
				flag = true
			end
		else
			local action, misc, type_ = player:get_param_all_info(paramKey)
			if conf.version and type_ ~= conf.version then
				flag = true
			end
		end
		player:set_param(timeKey, overTime)
	end
	return flag 
end




--请求活动信息
--我们会把活动的信息下发给玩家
function HandlerReqActivityInfo(player, actId)
	local func = HanlderGatherActivityInfoEnum[actId]
	if func then
		func(player)
	else
		print("HandlerReqActivityInfo can not found the HanlderGatherActivityInfoEnum by actId:",actId)
	end
end




function HandlerReqGetActivityAwardByIndex(player, actId, index)
	local func = HandlerReqGetActAwardEnum[actId]
	if func then
		func(player, index)
	else
		print("HandlerReqGetActivityAwardByIndex can not found the HandlerReqGetActAwardEnum by actId:",actId)
	end
end


GetActRealRankHandleEnum = 
{
	[16] = getGemScoreCompActivityRealRank,
	[17] = getBossScoreCompActivityRealRank,
}

function GetOperActivitiRealRankByActID(actId, rank, compareKey, beforRank, confIndex)
	local func = GetActRealRankHandleEnum[actId]
	if func ~= nil then
		return func(rank, compareKey, beforRank, confIndex)
	else
		print("GetOperActivitiRealRankByActID can not found the func by actId:",actId)
	end

	return 0
end




HandlerGatherOpenActEnum=
{
	[13] = gatherConsumeActivityRankStatus,
	[14] = gatherNewPayActivityRankStatus,
	[15] = gatherSoulBeadActivityRankStatus,
	[16] = gatherGemScoreCompActivityRankStatus,
	[17] = gatherBossScoreCompActivityRankStatus,
	[50] = GatherDayCostActivityStatus,
	[51] = TextCollectFestivalActivityStatus,
	[52] = FestivalLoginActivityStatus,
	[53] = GiftExchangeActivityStatus,
	[54] = GiftBuyActivityStatus,
	[56] = OncePayActivityStatus,
	-- [57] = NewYearDropActivityStatus,
	[58] = GatherTreasureGiftActivityStatus,
	[59] = GatherInstanceGiftActivityStatus,
	[60] = XuanShenYouLiActivityStatus,
	[61] = GatherGuildGiftActivityStatus,
	[62] = GatherSevenDayPayActivityStatus,
	[63] = NewChargeBackGoldActivityStatus,
	[64] = GatherSoulBeadScoreActivityStatus,
	[65] = GatherGoldRetActivityStatus,
	[66] = GatherKeepPayActivityStatus,
	[67] = OperateShopActivityStatus,
	[68] = GatherCumulativePayActivityStatus,
	[69] = FengTianYouLiActivityStatus,
	[70] = GatherGemCompetitiveActivityStatus,
	[71] = GatherBossScoreActivityStatus,
	[72] = GatherGoldBoxActivityStatus,
	[73] = GatherConsumeDialActivityStatus,
	[74] = TaoFaBossActivityStatus,
}

--收集开放的活动id列表
function HandlerGatherOpenActivityInfo(player, actId)
	local arr = {}
	local retMsg = {arr = arr}
	if actId == 0 or actId == nil then
	--这里是通知所有的活动
		for actId, func in pairs(HandlerGatherOpenActEnum) do
			local info = 
			{
				actid = actId,
				isOpen = 0,
				startTime = 0,
				endTime = 0,
				status =0,
			}
			local isOpen, startTime, endTime, status = func(player)
			info.isOpen = isOpen
			info.startTime = startTime
			info.endTime = endTime
			info.status = status
			table.insert(arr, info)
		end
	else
		local info = 
		{
			actid = actId,
			isOpen = 0,
			startTime = 0,
			endTime = 0,
			status = 0
		}
		local func = HandlerGatherOpenActEnum[actId]
		if func ~= nil then
			local isOpen, startTime, endTime, status = func(player)
			info.isOpen = isOpen
			info.startTime = startTime
			info.endTime = endTime
			info.status = status
		end
		table.insert(arr, info)
	end
	print_r(retMsg)
	player:SendPacketToSelf(OPERATING_GATHER_OPEN_ACT_STATUS, 0, encode(retMsg))
end














