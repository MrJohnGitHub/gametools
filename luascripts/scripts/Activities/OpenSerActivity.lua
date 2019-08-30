-- 开服活动
local XueYuType 	= 1
local BaoShiType 	= 3
local HunZhuType 	= 4
local ShenYuType	= 351
local XiuLianType	= 232

local S2C_REQ_INFO_MSG_ID 	= 4422
local S2C_REQ_GET_AWARD_MSG_ID = 4423

local OpenSerActShenYuFlag 		= 635
local OpenSerActBaoShiFlag 		= 636
local OpenSerActHunZhuFlag 		= 637
local OpenSerActXueYuFlag 		= 638
local OpenSerActXiuLianFlag 	= 639
local OpenSerActKeepPayFlag 	= 640
local OpenSerActCumulativePayFlag = 678
local OpenSerActBossScoreFlag = 679
local OpenSerActQianghuaDabiaoFlag = 812
local OpenSerActQianghuaDabiao = 811

local PAY_ACT_VERSION = 641 
local CUMULATIVE_PAY_VERSION = 688

function GetOpenSerActStartAndEndTime(openSerTime, key)
	local actPayConfig = OpenSerActSetting[key]
	local startTimeStamp = 0
	local endTimeStamp = 0
	if actPayConfig.natural_time and  actPayConfig.natural_time.vaild == true then
		startTimeStamp = os.time(actPayConfig.natural_time.startTime)
		endTimeStamp = os.time(actPayConfig.natural_time.endTime)
	else
		local openDate = os.date("*t", openSerTime)
		openDate.hour = 0
		openDate.min = 0
		openDate.sec = 0
		openSerTime = os.time(openDate)
		local startDay = OpenSerActSetting[key] and OpenSerActSetting[key].startDay or 1
		local endDay = OpenSerActSetting[key] and OpenSerActSetting[key].endDay or 1
		startTimeStamp = openSerTime + (startDay - 1) * 24 * 60 * 60
		endTimeStamp = openSerTime + endDay * 24 * 60 * 60
		local endDate = os.date("*t", endTimeStamp)
		endDate.hour = 0
		endDate.min = 0
		endDate.sec = 0
		endTimeStamp = os.time(endDate)
		endTimeStamp = endTimeStamp - 1
	end
	return startTimeStamp, endTimeStamp
end

--通用的校验函数
local function GeneralCheckFunc(player, key, index, compareKey)
	local config = OpenSerActSetting[key] and OpenSerActSetting[key].config
	if config then
		if index ~= nil then
			if config[index] == nil then
				return false, error_msg.notAward
			end

			if CheckPlayerHasGetAward(player, key, index) == false then
				if compareKey >= config[index].level then
					return true
				else
					return false, error_msg[key]
				end
			else
				return  false, error_msg.rePeat
			end
		else
			--不传index的主要是用在上线的判断是否要通知前端
			for k, v in ipairs(config) do
				if CheckPlayerHasGetAward(player, key, k) == false then
					if compareKey >= v.level then
						return true
					end
				end
			end
		end
	else
		print("GeneralCheckFunc config is nil")
	end

	return false, error_msg.notAward
end

local function CheckShenYuCanGetAward(player, key, index)
	local shenyuLevel = player:get_param(ShenYuType) 
	return GeneralCheckFunc(player, key, index, shenyuLevel)
end

local function CheckBaoShiCanGetAward(player, key, index)
	local baoshiLevel = player:GetNalchmyLevelByType(BaoShiType) 
	return GeneralCheckFunc(player, key, index, baoshiLevel)
end

local function CheckHunZhuCanGetAward(player, key, index)
	local hunzhuLevel = player:GetNalchmyLevelByType(HunZhuType) 
	return GeneralCheckFunc(player, key, index, hunzhuLevel)
end

local function CheckXueYuCanGetAward(player, key, index)
	local xueyuLevel = player:GetNalchmyLevelByType(XueYuType) 
	return GeneralCheckFunc(player, key, index, xueyuLevel)
end

local function CheckXiuLianCanGetAward(player, key, index)
	local xiulianLevel = player:get_param(XiuLianType) 
	return GeneralCheckFunc(player, key, index, xiulianLevel)
end

local function HandlerBossScoreCanGetAward(player, key, index)
	local BossScoreLevel = player:GetBossScoreLevel()
	print("HandlerBossScoreCanGetAward BossScoreLevel:", BossScoreLevel)
	return GeneralCheckFunc(player, key, index, BossScoreLevel)
end

local function HandlerQianghuaDabiaoCanGetAward(player, key, index)
	local QianghuaDabiaoLevel = player:get_param(OpenSerActQianghuaDabiao);
	print("HandlerBossScoreCanGetAward QianghuaDabiaoLevel:", QianghuaDabiaoLevel)
	return GeneralCheckFunc(player, key, index, QianghuaDabiaoLevel)
end

local function CheckCumulativePayCanGetAward(player, key, index, openSerTime)
	local startTime, endTime = GetOpenSerActStartAndEndTime(openSerTime, key)
	local cumulativePay = player:GetGreaterParam(startTime - 3600, endTime) or 0
	local config = OpenSerActSetting[key] and OpenSerActSetting[key].config
	if config ~= nil then
		if index ~= nil then
			local indexConf = config[index]
			if indexConf ~= nil then
				if CheckPlayerHasGetAward(player, key, index) == true then
					return false, error_msg.rePeat
				end

				if cumulativePay < indexConf.payCount then
					return false, error_msg.payNotEnough
				end
				return true
			else
				return false, error_msg.awardIndexNotExist
			end
		else
			--所有的
			local bFlag = false
			for k, v in pairs(config) do
				if CheckPlayerHasGetAward(player, key, k) == false and v.payCount <= cumulativePay then
					bFlag = true
					break
				end
			end

			return bFlag
		end
	else
		return false, error_msg.actNotExist
	end
end


local function CheckKeepPayCanGetAwardByIndex(player, key, index, dangci_list, realConfig)
	if CheckPlayerHasGetAward(player, key, index) == true then
		return false, error_msg.rePeat
	else
		local dangci = realConfig.dangci
		local nCount = dangci_list[dangci] or 0

		if nCount < realConfig.keepDay then
			return  false, error_msg.keepPay
		else
			return true
		end
	end
end


local function CheckKeepPayCanGetAward(player, key, index, openSerTime)
	local openSerConfig = OpenSerActSetting and OpenSerActSetting[key]
	if openSerConfig then
		local dangci_list = {}
		local dangci_config = openSerConfig.dangci_config
		local awardConfig = openSerConfig.config
		local startTime, endTime = GetOpenSerActStartAndEndTime(openSerTime, key)
		for k, v in ipairs(dangci_config) do
			local nCount = player:GetGreaterParamCount(v, startTime - 3600, endTime) 
			dangci_list[k] = nCount
		end

		if index ~= nil then
			local realConfig = awardConfig[index]
			if realConfig ~= nil then
				return CheckKeepPayCanGetAwardByIndex(player, key, index, dangci_list, realConfig)
			else
				return false, error_msg.notAward
			end
		else
			--不传index的都是针对玩家上线判断活动状态的
			for k, v in ipairs(awardConfig) do
				local flag = CheckKeepPayCanGetAwardByIndex(player, key, k, dangci_list, v)
				if flag == true then
					return flag
				end
			end

		end
	else
		return false, error_msg.notAward
	end
end


local function GeneralSendAwardFunc(player, key, index)
	local config = OpenSerActSetting[key] and OpenSerActSetting[key].config
	local bFlag = false
	if config and config[index] then
		local award = config[index].award
		if award ~= nil then
			local itemCount = config[index].itemCount or 0
			if itemCount <= player:num_bag_black(0) then
				local optType = AddItemOptType[key]
				local consumeType = AddMoneyOptType[key]
				local fly = 0
				-- if key == 'keepPay' then
				-- 	fly = 1
				-- end
				for k, v in ipairs(award) do
					local bind = 1
					if v.bind and v.bind == 1 then
						bind = 0
					end
					player:NewAddItem(v.itemId, v.count, optType, consumeType, fly, bind)
				end
				bFlag = true
			else
				--飘错误提示
				local notifyMsg = "您的背包空间不足"..itemCount.."格"
				player:alert(10, 0, 0,notifyMsg)
				bFlag = false
			end
		else
			-- print("award is nil by index:", index)
		end
	else
		-- print("config is nil by index:", index)
	end

	return bFlag
end

local function HandleSendShenYuAward(player, key, index)
	local bFlag = GeneralSendAwardFunc(player, key, index)
	local awardFlag = player:get_param(OpenSerActShenYuFlag)
	if bFlag == true then
		player:SetFlagBitByIndex(OpenSerActShenYuFlag, index)
		awardFlag = player:get_param(OpenSerActShenYuFlag)
	end
	return bFlag, awardFlag
end

local function HandleSendBaoShiAward(player, key, index)
	local bFlag = GeneralSendAwardFunc(player, key, index)
	local awardFlag = player:get_param(OpenSerActBaoShiFlag)
	if bFlag == true then
		player:SetFlagBitByIndex(OpenSerActBaoShiFlag, index)
		awardFlag = player:get_param(OpenSerActBaoShiFlag)
	end
	return bFlag, awardFlag
end

local function HandleSendHunZhuAward(player, key, index)
	local bFlag = GeneralSendAwardFunc(player, key, index)
	local awardFlag = player:get_param(OpenSerActHunZhuFlag)
	if bFlag == true then
		player:SetFlagBitByIndex(OpenSerActHunZhuFlag, index)
		awardFlag = player:get_param(OpenSerActHunZhuFlag)
	end
	return bFlag, awardFlag
end

local function HandleSendXueYuAward(player, key, index)
	local bFlag = GeneralSendAwardFunc(player, key, index)
	local awardFlag = player:get_param(OpenSerActXueYuFlag)
	if bFlag == true then
		player:SetFlagBitByIndex(OpenSerActXueYuFlag, index)
		awardFlag = player:get_param(OpenSerActXueYuFlag)
	end
	return bFlag, awardFlag
end

local function HandleSendXiuLianAward(player, key, index)
	local bFlag = GeneralSendAwardFunc(player, key, index)
	local awardFlag = player:get_param(OpenSerActXiuLianFlag)
	if bFlag == true then
		player:SetFlagBitByIndex(OpenSerActXiuLianFlag, index)
		awardFlag = player:get_param(OpenSerActXiuLianFlag)
	end
	return bFlag, awardFlag
end

local function HandleSendKeepPayAward(player, key, index)
	local bFlag = GeneralSendAwardFunc(player, key, index)
	local awardFlag = player:get_param(OpenSerActKeepPayFlag)
	if bFlag == true then
		player:SetFlagBitByIndex(OpenSerActKeepPayFlag, index)
		awardFlag = player:get_param(OpenSerActKeepPayFlag)
		HandlerGetFanTianGifState(player)
	end
	return bFlag, awardFlag
end

local function HandleSendBossScoreAward(player, key, index)
	local bFlag = GeneralSendAwardFunc(player, key, index)
	local awardFlag = player:get_param(OpenSerActBossScoreFlag)
	if bFlag == true then
		player:SetFlagBitByIndex(OpenSerActBossScoreFlag, index)
		awardFlag = player:get_param(OpenSerActBossScoreFlag)
	end
	return bFlag, awardFlag
end

local function HandleSendQianghuaDabiaoAward(player, key, index)
	local bFlag = GeneralSendAwardFunc(player, key, index)
	local awardFlag = player:get_param(OpenSerActQianghuaDabiaoFlag)
	if bFlag == true then
		player:SetFlagBitByIndex(OpenSerActQianghuaDabiaoFlag, index)
		awardFlag = player:get_param(OpenSerActQianghuaDabiaoFlag)
	end
	return bFlag, awardFlag
end

local function HandleSendCumulativePayAward(player, key, index)
	local bFlag = GeneralSendAwardFunc(player, key, index)
	local awardFlag = player:get_param(OpenSerActCumulativePayFlag)
	if bFlag == true then
		player:SetFlagBitByIndex(OpenSerActCumulativePayFlag, index)
		awardFlag = player:get_param(OpenSerActCumulativePayFlag)
		HandlerGetFanTianGifState(player)
	end
	return bFlag, awardFlag
end


local function CheckInActTime(key, openSerTime)
	local startTimeStamp, endTimeStamp = GetOpenSerActStartAndEndTime(openSerTime, key)
	--print(startTimeStamp, endTimeStamp)
	local curTimeStamp = os.time()
	if curTimeStamp >= startTimeStamp and curTimeStamp < endTimeStamp then
		return true
	end
	return false 
end

local function GetCumulativePayAwardFlag(player, key)
	local vesion = OpenSerActSetting[key].vesion
	local lastVesion = player:get_param(CUMULATIVE_PAY_VERSION)
	local awardFlag = player:get_param(OpenSerActCumulativePayFlag)
	if lastVesion ~= vesion then
		player:set_param(CUMULATIVE_PAY_VERSION, vesion)
		awardFlag = 0
		player:set_param(OpenSerActCumulativePayFlag, awardFlag)
	end
	return awardFlag
end

local function GeneralHandleGetActInfo(player, openSerTime, key, awardFlagIndex, advanceIndex)
	local startTimeStamp, endTimeStamp = GetOpenSerActStartAndEndTime(openSerTime, key)
	local actConf = OpenSerActSetting[key]
	local awardFlag = 0
	if key ~= "PayRank" then
		if key == 'CumulativePay' and actConf.natural_time and actConf.natural_time.vaild == true then
			awardFlag = GetCumulativePayAwardFlag(player, key)
		else
			awardFlag = player:get_param(awardFlagIndex)
		end
	end
	local retMsg = {
		beginTime = startTimeStamp,
		endTime = endTimeStamp,
		curTime = os.time(),
		actId = ActNameToActId[key],
		awardFlag = awardFlag,
	}
	if key == "CumulativePay" or key == "PayRank" then
		CumulativePay = player:GetGreaterParam(startTimeStamp - 3600, endTimeStamp)
		retMsg.CumulativePay = CumulativePay
	end
	if key == "QianghuaDabiao" then
		retMsg.lvl = player:get_param(advanceIndex);
	end
	-- print_r(retMsg)
	player:SendPacketToSelf(S2C_REQ_INFO_MSG_ID, 0, encode(retMsg))
end

--获取连续充值的奖励标志
local function GetKeepPayAwardFlag(player, key)
	local vesion = OpenSerActSetting[key].vesion
	local lastVesion = player:get_param(PAY_ACT_VERSION)
	local awardFlag = player:get_param(OpenSerActKeepPayFlag)
	if lastVesion ~= vesion then
		player:set_param(PAY_ACT_VERSION, vesion)
		awardFlag = 0
		player:set_param(OpenSerActKeepPayFlag, awardFlag)
	end
	return awardFlag
end


local function HandleReqActKeepPayInfo(player, openSerTime, key)
	local startTimeStamp, endTimeStamp = GetOpenSerActStartAndEndTime(openSerTime, key)
	local actId = ActNameToActId[key]
	local dangci_list = {}
	local retMsg = {
		beginTime = startTimeStamp,
		endTime = endTimeStamp,
		curTime = os.time(),
		actId = actId,
		todayPay = player:get_param(221),
		showPay = player:GetTomorrowPayIconShow(1),
	}

	local openSerConfig = OpenSerActSetting[key]
	local dangci_config = openSerConfig.dangci_config
	local startTime, endTime = GetOpenSerActStartAndEndTime(openSerTime, key)
	for k, v in ipairs(dangci_config) do
		local nCount = player:GetGreaterParamCount(v, startTimeStamp - 3600, endTimeStamp) 
		dangci_list[k] = nCount
	end

	local dangCiArr = {}
	for k, v in ipairs(dangci_list) do
		local info = {
			money = dangci_config[k],
			num = v,
		}
		table.insert(dangCiArr, info)
	end
	retMsg.dangCiArr = dangCiArr
	retMsg.awardFlag = GetKeepPayAwardFlag(player, key)
	-- print_r(retMsg)
	player:SendPacketToSelf(S2C_REQ_INFO_MSG_ID, 0, encode(retMsg))
end

local function HandleReqActShenYuInfo(player, openSerTime, key)
	GeneralHandleGetActInfo(player, openSerTime, key, OpenSerActShenYuFlag, ShenYuType)
end

local function HandleReqActBaoShiInfo(player, openSerTime, key)
	GeneralHandleGetActInfo(player, openSerTime, key, OpenSerActBaoShiFlag, BaoShiType)
end

local function HandleReqActHunZhuInfo(player, openSerTime, key)
	GeneralHandleGetActInfo(player, openSerTime, key, OpenSerActHunZhuFlag, HunZhuType)
end

local function HandleReqActXueYuInfo(player, openSerTime, key)
	GeneralHandleGetActInfo(player, openSerTime, key, OpenSerActXueYuFlag, XueYuType)
end

local function HandleReqActXiuLianInfo(player, openSerTime, key)
	GeneralHandleGetActInfo(player, openSerTime, key, OpenSerActXiuLianFlag, XiuLianType)
end


local function HandleReqCumulativePayInfo(player, openSerTime, key)
	GeneralHandleGetActInfo(player, openSerTime, key, OpenSerActCumulativePayFlag)
end

local function HandlerReqActBossScoreInfo(player, openSerTime, key)
	GeneralHandleGetActInfo(player, openSerTime, key, OpenSerActBossScoreFlag)
end

local function HandlerReqActQianghuaDabiaoInfo(player, openSerTime, key)
	GeneralHandleGetActInfo(player, openSerTime, key, OpenSerActQianghuaDabiaoFlag,OpenSerActQianghuaDabiao)
end

local function HandlerReqActPayRankInfo(player, openSerTime, key)
	GeneralHandleGetActInfo(player, openSerTime, key)
end


--[[
	校验是否已经领取过奖励
--]]
local function CheckKeepPayHasGetAwardByIndex(player, index)
	local last_version = player:get_param(PAY_ACT_VERSION) 
	local version = OpenSerActSetting['keepPay'].vesion
	if version ~= last_version then
		--版本不一样的时候
		--领取标志位重新改成0
		player:set_param(PAY_ACT_VERSION, version)
		player:set_param(OpenSerActKeepPayFlag, 0)
	end
	return player:GetFlagBitByIndex(OpenSerActKeepPayFlag, index)
end

local function CheckShenYuHasGetAwardByIndex(player, index)
	return player:GetFlagBitByIndex(OpenSerActShenYuFlag, index)
end


local function CheckBaoShiHasGetAwardByIndex(player, index)
	return player:GetFlagBitByIndex(OpenSerActBaoShiFlag, index)
end

local function CheckHunZhuHasGetAwardByIndex(player, index)
	return player:GetFlagBitByIndex(OpenSerActHunZhuFlag, index)
end

local function CheckXueYuHasGetAwardByIndex(player, index)
	return player:GetFlagBitByIndex(OpenSerActXueYuFlag, index)
end
local function CheckXiuLianHasGetAwardByIndex(player, index)
	return player:GetFlagBitByIndex(OpenSerActXiuLianFlag, index)
end

local function CheckCumulativePayHasGetAwardByIndex(player, index)
	local last_version = player:get_param(CUMULATIVE_PAY_VERSION) 
	local version = OpenSerActSetting['CumulativePay'].vesion
	local actConf = OpenSerActSetting['CumulativePay']
	if version ~= last_version and actConf.natural_time and actConf.natural_time.vaild == true then
		--版本不一样的时候
		--领取标志位重新改成0
		player:set_param(CUMULATIVE_PAY_VERSION, version)
		player:set_param(OpenSerActCumulativePayFlag, 0)
	end
	return player:GetFlagBitByIndex(OpenSerActCumulativePayFlag, index)
end

local function CheckBossScoreHasGetAwardByIndex(player, index)
	return player:GetFlagBitByIndex(OpenSerActBossScoreFlag, index)
end

local function CheckQianghuaDabiaoHasGetAwardByIndex(player, index)
	return player:GetFlagBitByIndex(OpenSerActQianghuaDabiaoFlag, index)
end

local HandleOpenSerActFuncSetting = {
	['keepPay'] = {
		ReqActInfoHandle = HandleReqActKeepPayInfo, 
		SendActAwardHandle = HandleSendKeepPayAward,
		CheckHandler = CheckKeepPayCanGetAward,
		CheckHasGet = CheckKeepPayHasGetAwardByIndex,
	},
	['shenyu'] = {
		ReqActInfoHandle = HandleReqActShenYuInfo,
		SendActAwardHandle = HandleSendShenYuAward,
		CheckHandler = CheckShenYuCanGetAward,
		CheckHasGet = CheckShenYuHasGetAwardByIndex,
	},
	['baoshi'] = {
		ReqActInfoHandle = HandleReqActBaoShiInfo,
		SendActAwardHandle = HandleSendBaoShiAward,
		CheckHandler = CheckBaoShiCanGetAward,
		CheckHasGet = CheckBaoShiHasGetAwardByIndex,
	},
	['hunzhu'] = {
		ReqActInfoHandle = HandleReqActHunZhuInfo,
		SendActAwardHandle = HandleSendHunZhuAward,
		CheckHandler = CheckHunZhuCanGetAward,
		CheckHasGet = CheckHunZhuHasGetAwardByIndex,
	},
	['xueyu'] = {
		ReqActInfoHandle = HandleReqActXueYuInfo,
		SendActAwardHandle = HandleSendXueYuAward,
		CheckHandler = CheckXueYuCanGetAward,
		CheckHasGet = CheckXueYuHasGetAwardByIndex,
	},
	['xiulian'] = {
		ReqActInfoHandle = HandleReqActXiuLianInfo,
		SendActAwardHandle = HandleSendXiuLianAward,
		CheckHandler = CheckXiuLianCanGetAward,
		CheckHasGet = CheckXiuLianHasGetAwardByIndex,
	},

	["CumulativePay"] = {
		ReqActInfoHandle = HandleReqCumulativePayInfo,
		SendActAwardHandle = HandleSendCumulativePayAward,
		CheckHandler = CheckCumulativePayCanGetAward,
		CheckHasGet = CheckCumulativePayHasGetAwardByIndex,
	},

	["BossScore"] = {
		ReqActInfoHandle = HandlerReqActBossScoreInfo,
		SendActAwardHandle = HandleSendBossScoreAward,
		CheckHandler = HandlerBossScoreCanGetAward,
		CheckHasGet = CheckBossScoreHasGetAwardByIndex,
	},

	["PayRank"] = {
		ReqActInfoHandle = HandlerReqActPayRankInfo,
	},

	['mount'] = {
		ReqActInfoHandle = HandlerReqMountCompetitiveInfo,
		SendActAwardHandle = SendMountCompetitiveAward,
		CheckHandler = CheckCanGetMountCompetitiveAward,
	},
	["QianghuaDabiao"] = {
		ReqActInfoHandle = HandlerReqActQianghuaDabiaoInfo,
		SendActAwardHandle = HandleSendQianghuaDabiaoAward,
		CheckHandler = HandlerQianghuaDabiaoCanGetAward,
		CheckHasGet = CheckQianghuaDabiaoHasGetAwardByIndex,
	},
 }

function CheckPlayerHasGetAward(player, key, index)
	local func = HandleOpenSerActFuncSetting[key] and  HandleOpenSerActFuncSetting[key].CheckHasGet
	if func then
		local flag = func(player, index)
		if flag == 1 then
			return true
		end
	end

	return false
end


local function CheckCanGetAward(player, key, openSerTime, index)
	--判断是否在活动期间内
	if CheckInActTime(key, openSerTime) == false then
		return false, error_msg.timeOver
	end
	local func = HandleOpenSerActFuncSetting[key] and HandleOpenSerActFuncSetting[key].CheckHandler
	if func ~= nil then
		return func(player, key, index, openSerTime)
	end

	return false, error_msg.notAward

end


local function SendOpenSerActAward(player, key, index)
	local func = HandleOpenSerActFuncSetting[key] and HandleOpenSerActFuncSetting[key].SendActAwardHandle
	local retMsg = {
		index = index,
		actId = ActNameToActId[key],
		flag = 1,
		awardFlag = 0,
	}
	local flag = false
	if func then
		local bFlag, awardFlag = func(player, key, index)
		retMsg.awardFlag = awardFlag
		if bFlag then
			retMsg.flag = 0
			flag = true
		end
	end
	-- print_r(retMsg)
	player:SendPacketToSelf(S2C_REQ_GET_AWARD_MSG_ID, 0, encode(retMsg))
	return flag
end



function CheckOpenActCanShowAndHasAwardGet(player, initTime, actId)
	local actName = ActIdToActName[actId]
	if actName == nil then
		return false
	end

	local start, over = GetOpenSerActStartAndEndTime(initTime, actName)
	local cur = os.time()
	local showFlag = false
	if cur >= start and cur < over then
		showFlag = true
	end

	local status = NotifyCanGetOpenSerActAward(player, initTime, actId)
	return showFlag, status 
end

function GatherMailItemAndGold(awardConf)
	local award = awardConf.award
	-- print_r(award)
	local item = {}
	local gold = {0, 0, 0, 0}
	local bHaveGold = false
	for k, v in ipairs(award) do
		if v.itemId == 100 then 
			gold[3] = v.count
			bHaveGold = true
		elseif v.itemId == 101 then
			gold[2] = v.count
			bHaveGold = true
		elseif v.itemId == 1 then
			gold[1] = v.count
			bHaveGold = true
		elseif v.itemId == 2 then
			gold[4] = v.count
			bHaveGold = true
		else 
			table.insert(item, v.itemId)
			table.insert(item, v.count)
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
	-- print(mailGold)
	-- print(mailItem)
	return mailItem, mailGold
end

---------------------------------------C++调用的Lua接口-------------------------------

--这个接口是获取充值排行的真实排名的
function GetPlayerRealRank(rank, payNum, beforRank)
	local awardConfig = ActRankAwardConf.PayRank.awardConfig
	local realRank = 0
	if rank > #awardConfig then
		realRank = 0
		return realRank
	end
	--[[
	for k, v in ipairs(awardConfig) do
		if payNum >= v.minPay then
			if beforRank < k then
				realRank = k
			else
				realRank = beforRank + 1
			end
			break
		end
	end
	--]]
	
	for i=1, #awardConfig do
		local v = awardConfig[i]
		if payNum >= v.minPay then
			if beforRank < i then
				realRank = i
			else
				realRank = beforRank + 1
			end
			break
		end
	end

	if realRank > #awardConfig then
		realRank = 0
	end

	return realRank
end

--邮件发送充值排行榜奖励
function MailSendPayRankAward(roleid, rank)
	local awardConfig = ActRankAwardConf['PayRank'] and ActRankAwardConf['PayRank'].awardConfig and ActRankAwardConf['PayRank'].awardConfig[rank]
	if awardConfig ~= nil then
		local mailItem, mailGold = GatherMailItemAndGold(awardConfig)
		local mailConf = ActMailConten.PayRank
		local subject = mailConf.subject[rank] or "unkown"
		local body = mailConf.body[rank] or "unkown"
		g_SendMailMessage(0, roleid, subject, body, mailItem, mailGold, 1, "")
	else
		print("MailSendPayRankAward awardConfig is nil")
	end
end


function CheckActivityIsOpenById(actId)
	if ActOpenSetting[actId] == true then
		return 1
	end

	return 0
end

function CheckActIsOver(actId)
	if actId == 7 or actId == 8 or actId == 2 or actId == 12 then
		return 1
	end
	local retCode = 0
	if actId == 13 then
		retCode = isCosumeActivityRankOpen()
	elseif actId == 14 then
		retCode = isNewPayActivityRankOpen()
	elseif actId == 15 then
		retCode = isSoulBeadActivityRankOpen()
	elseif actId == 16 then
		retCode = isGemScoreCompActivityRankOpen()
	elseif actId == 17 then
		retCode = isBossScoreCompActivityRankOpen()
	else
		retCode = CheckActivityIsOpenById(actId)
		if retCode == 1 then
			local openSerTime = g_get_init_time()
			local key = ActIdToActName[actId]
			if key == "PayRank" then
				if CheckInActTime(key, openSerTime) == false then
					retCode = 0
				end
			else
				local startTimeStamp, endTimeStamp = GetOpenSerActStartAndEndTime(openSerTime, key)
				local curTime = os.time()
				if curTime >= endTimeStamp then
					retCode = 0
				end
			end
		end
	end
	return retCode
end


--客户端请求获取开服活动信息
function HandleReqOpenSerActInfo(player, openSerTime, actId)
	if CheckActivityIsOpenById(actId) == 0 then
		return 
	end

	local key = ActIdToActName[actId]
	local func = HandleOpenSerActFuncSetting[key] and HandleOpenSerActFuncSetting[key].ReqActInfoHandle
	if func then
		func(player, openSerTime, key)
	else
		print("HandleReqOpenSerActInfo func is nil by the key:",key)
	end
end


--领取开服奖励
function ReqGetOpenSerActAward(player, actId, openSerTime, index)
	if CheckActivityIsOpenById(actId) == 0 then
		return 
	end
	local key = ActIdToActName[actId]
	local flag, error_msg = CheckCanGetAward(player, key, openSerTime, index)
	if flag == true then
		local flag = SendOpenSerActAward(player, key, index)
		local config = OpenSerActSetting[key] and  OpenSerActSetting[key].config and OpenSerActSetting[key].config[index]
		if config ~= nil and flag == true then
			if key == "shenyu" then
				g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>将翅膀升到" .. config.level .."级，成功领取开服活动<font color='#ff0000'>神翼竞技豪礼！</font>" .. "<font color='#0be140'>{_showSysWin,我也要领取,OPEN_FUACTIVITY,3}</font>");
			elseif key == "baoshi" then
				g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>将宝石升到" .. config.level .."级，成功领取开服活动<font color='#ff0000'>宝石竞技豪礼！</font>" .. "<font color='#0be140'>{_showSysWin,我也要领取,OPEN_FUACTIVITY,4}</font>");
			elseif key == "hunzhu" then
				g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>将魂珠升到" .. config.level .."级，成功领取开服活动<font color='#ff0000'>魂珠竞技豪礼！</font>" .. "<font color='#0be140'>{_showSysWin,我也要领取,OPEN_FUACTIVITY,5}</font>");
			elseif key == "xiulian" then
				local fentianName = player:GetFenTianTrainName(config.level) or ""
				g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>达到焚天修炼" .. fentianName .."，成功领取开服活动<font color='#ff0000'>修炼竞技豪礼！</font>" .. "<font color='#0be140'>{_showSysWin,我也要领取,OPEN_FUACTIVITY,6}</font>");
			elseif key == "BossScore" then
				local level = math.mod(config.level, 100)
				local advance = math.floor(config.level / 100)
				local name = {
					[1] = "青龙",
					[2] = "白虎",
					[3] = "朱雀",
					[4] = "玄武",
				}
				g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>将BOSS积分升至" .. name[advance]..level.."级，成功领取开服活动<font color='#ff0000'>积分竞技豪礼！</font>" .. "<font color='#0be140'>{_showSysWin,我也要领取,OPEN_FUACTIVITY,7}</font>");
			elseif key == "keepPay" then
				g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>领取了<font color='#ff0000'>连充豪礼</font>第" ..index.. "天奖励，每天充值一点点，奖励领不停！<font color='#0be140'>{_showSysWin,我也要领取,OPEN_INVESTPLAN,2}</font>");
			elseif key == "CumulativePay" then
				g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>领取了<font color='#ff0000'>累充豪礼</font>" ..config.payCount.. "元宝奖励，累计充值档次越高，奖励越丰厚！<font color='#0be140'>{_showSysWin,我也要领取,OPEN_INVESTPLAN,3}</font>");
			elseif key == 'mount' then
				g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>将坐骑等级提升至"..config.level.."阶"..config.star.."星,成功领取开服活动<font color='#ff0000'>坐骑竞技豪礼</font><font color='#0be140'>{_showSysWin,我也要领取,OPEN_FUACTIVITY,8}</font>");
			elseif key == 'QianghuaDabiao' then
				g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>将全身强化等级提升至"..config.level.."级，成功领取开服活动<font color='#ff0000'>强化竞技豪礼！</font><font color='#0be140'>{_showSysWin,我也要领取,OPEN_FUACTIVITY,9}</font>");
			end
		end
	else
		--飘错误提示
		-- local notifyMsg = "没有可以领取的奖励"
		player:alert(10, 0, 0,error_msg)
	end
end

--通知前端开服活动奖励可以领取
--服务端主推
function NotifyCanGetOpenSerActAward(player, openSerTime, actId)
	if actId ~= 0 then
		if CheckActivityIsOpenById(actId) == 0 then
			return 0
		end

		local key =  ActIdToActName[actId]
		if key ~= nil then
			local flag = CheckCanGetAward(player, key, openSerTime)
			if flag == true then
				return 1
			end
		end

		return 0
	else
		for k, v in pairs(ActIdToActName) do
			if CheckActivityIsOpenById(k) == 1 then
				local flag = CheckCanGetAward(player, v, openSerTime)
				if flag == true then
					return 1
				end
			end
		end
		return 0
	end
end

--这是给C++调用的
--用来通知前端开服活动是否有奖励领取
--开服活动图标里面现在不包括连充
--所以只能临时加了这个函数了
function NotifyCanGetOpenSerActAwardWithoutKeepPay(player, openSerTime, actId)
	-- body
	if actId == 1 or actId == 9 then
		return 0
	end

	if actId ~= 0 then
		if CheckActivityIsOpenById(actId) == 0 then
			return 0
		end

		local key =  ActIdToActName[actId]
		if key ~= nil then
			local flag = CheckCanGetAward(player, key, openSerTime)
			if flag == true then
				return 1
			end
		end

		return 0
	else
		for k, v in pairs(ActIdToActName) do
			if k ~= 1 and k ~= 9 then
				if CheckActivityIsOpenById(k) == 1 then
					local flag = CheckCanGetAward(player, v, openSerTime)
					if flag == true then
						return 1
					end
				end
			end
		end
		return 0
	end
end

function OnHandlerGetActRankInfo(player, openSerTime, actId)
	local key = ActIdToActName[actId] 
	if key ~= nil and actId ~= 13 then
		local rankCount = ActRankAwardConf[key] and ActRankAwardConf[key].rankCount
		if rankCount ~= nil then
			if key ~= "PayRank" then
				SendOpenActRankInfo(player, actId, rankCount, 0)
			else
				local showCount = #ActRankAwardConf.PayRank.awardConfig or 0
				SendOpenActRankInfo(player, actId, rankCount, showCount)
			end
		end
	else
		if actId == 13 then
			local conf, start, over, index = GetOperActivityConfig(g_ConsumeRankTimeConf)
			if conf ~= nil then
				local rankCount = g_consmeRankAwardConf[index].rankCount
				local showCount = #g_consmeRankAwardConf[index].award
				SendOpenActRankInfo(player, actId, rankCount, showCount)
			end
		elseif actId == 14 then
			local conf, start, over, index = GetOperActivityConfig(g_PayRankTimeConf)
			if conf ~= nil then
				local rankCount = g_PayRankAwardConf[index].rankCount
				local showCount = #g_PayRankAwardConf[index].award
				SendOpenActRankInfo(player, actId, rankCount, showCount)
			end
		elseif actId == 15 then
			local conf, start, over, index = GetOperActivityConfig(g_SoulBeadTimeConf)
			if conf ~= nil then
				local rankCount = g_SoulBeadAwardConf[index].rankCount
				local showCount = #g_SoulBeadAwardConf[index].award
				SendOpenActRankInfo(player, actId, rankCount, showCount)
			end
		elseif actId == 16 then
			local conf, start, over, index = GetOperActivityConfig(g_GemScoreCompTimeConf)
			if conf ~= nil then
				local rankCount = g_GemScoreCompAwardConf[index].rankCount
				local showCount = #g_GemScoreCompAwardConf[index].award
				SendOpenActRankInfo(player, actId, rankCount, showCount)
			end
		elseif actId == 17 then
			local conf, start, over, index = GetOperActivityConfig(g_BossScoreCompTimeConf)
			if conf ~= nil then
				local rankCount = g_BossScoreCompAwardConf[index].rankCount
				local showCount = #g_BossScoreCompAwardConf[index].award
				SendOpenActRankInfo(player, actId, rankCount, showCount)
			end
		end
	end
end




--


function OnActivityOverSendAward(openSerTime)
	local whichDay = GetTodayIsWhichDay(openSerTime)
	for key, actId in pairs(ActNameToActId) do
		if actId ~= 2 and actId ~= 3 and actId ~= 4 and actId ~= 6 and actId ~= 11 and actId ~= 12 then
			local endDay = OpenSerActSetting[key] and OpenSerActSetting[key].endDay
			if endDay and endDay + 1 == whichDay then
				local rankConf = ActRankAwardConf[key]
				if rankConf ~= nil then
					if key ~= "PayRank" then
						local awardConfig = rankConf.awardConfig
						for rank = 1, #awardConfig do
							local v = awardConfig[rank]
							local subject = ActMailConten[key] and  ActMailConten[key]['subject'] and ActMailConten[key]['subject'][rank] or 'unkown'
							local body = ActMailConten[key] and  ActMailConten[key]['body'] and ActMailConten[key]['body'][rank] or 'unkown'
							MailSendActRankAward(actId, rank, v.itemId, v.count, subject, body)
						end
					else
						--充值排行榜
						--结束发奖要特殊处理
						local awardConfig = rankConf.awardConfig
						local sendCount = #awardConfig
						if sendCount > 0 then
							g_MailSendPayRankAward(sendCount)
						end
					end
				end
				--清除排行榜数据
			end
		end
	end
	
	--调用发消费排行榜奖励的接口
	ConsumeRankActivityOverNotifySendAward()
	--调用发充值排行绑奖励都接口
	NewPayRankActivityOverNotifySendAward()
	--发送魂珠积分排行榜奖励
	SoulBeadActivityOverNotifySendAward()
	--宝石积分排行通知发奖
	GemScoreCompActivityOverNotifySendAward()
	--BOSS积分排行通知发奖
	BossScoreCompActivityOverNotifySendAward()
end


--
function CheckCanInActRank(actId, compareKey)
	if redPacketConf[actId] ~= nil then
		local money = redPacketConf[actId].money
		if compareKey >= money then
			return 1
		end
		return 0
	end
	if actId == 13 or actId == 14 or actId == 15 or actId == 16 or actId == 17 then
		return 1
	end
	
	local key = ActIdToActName[actId]
	if key ~= nil then
		local minLevel = ActRankAwardConf[key].minLevel or 1
		if compareKey >= minLevel then
			return 1
		else
			return 0
		end
	else
		return 0
	end
end
