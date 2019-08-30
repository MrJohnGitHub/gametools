

--[[

充值有礼活动
--]]


local g_pay_award_config = 
{
	start_time = {year = 2016, month = 11, day = 7, hour = 0, min = 0, sec = 0},
	end_time = {year = 2016, month = 12, day = 28, hour = 0, min = 0, sec = 0},
	open_ser_tm = {
		start_day = 8,
		end_day = 10,
	},
	use_open = false,
	pay_list = 
	{
		[1] = 
		{
			payNum = 1000, --充值的元宝需要达到的数量
			itemCount = 4, --奖励中有几个物品就填几
			award = 
			{
				[1] = {itemid = 10411, count = 1, bind = 1},
				[2] = {itemid = 10186, count = 40, bind = 1},
				[3] = {itemid = 10268, count = 1, bind = 1},
				[4] = {itemid = 12014, count = 2, bind = 1}
			}
				
		},
		[2] = 
		{
			payNum = 10000, --充值的元宝需要达到的数量
			itemCount = 5, --奖励中有几个物品就填几
			award = 
			{
				[1] = {itemid = 10165, count = 2, bind = 1},
				[2] = {itemid = 10186, count = 100, bind = 1},
				[3] = {itemid = 10287, count = 5, bind = 1},
				[4] = {itemid = 12014, count = 10, bind = 1}
			}
		},
	}
}



local g_single_pay_config = {
	versoin = 1,
	start_time = {year = 9999, month = 11, day = 7, hour = 0, min = 0, sec = 0},
	end_time = {year = 99999, month = 12, day = 27, hour = 0, min = 0, sec = 0},
	open_ser_tm = {
		start_day = 1,
		end_day = 17,
	},
	use_open = false,
	pay_list = 
	{
		[1] = 
		{	payNum = 1000, --充值的元宝需要达到的数量
			itemCount = 4, --奖励中有几个物品就填几
			award = 
			{
				[1] = {itemid = 12022, count = 1, bind = 1},
				[2] = {itemid = 12014, count = 5, bind = 1},
				[3] = {itemid = 10287, count = 2, bind = 1},
				[4] = {itemid = 40901, count = 2, bind = 1}
			}
		},
		[2] = 
		{
			payNum = 10000, --充值的元宝需要达到的数量
			itemCount = 4, --奖励中有几个物品就填几
			award = 
			{
				[1] = {itemid = 12022, count = 1, bind = 1},
				[2] = {itemid = 12014, count = 10, bind = 1},
				[3] = {itemid = 10287, count = 5, bind = 1},
				[4] = {itemid = 40901, count = 5, bind = 1}
			}
		},
		[3] = 
		{
			payNum = 50000, --充值的元宝需要达到的数量
			itemCount = 4, --奖励中有几个物品就填几
			award = 
			{
				[1] = {itemid = 12023, count = 1, bind = 1},
				[2] = {itemid = 12014, count = 20, bind = 1},
				[3] = {itemid = 10287, count = 10, bind = 1},
				[4] = {itemid = 40901, count = 10, bind = 1}
			}
		},
	}
}



local S2C_REQ_PAY_AWARD_INFO 		= 4444
local S2C_REQ_GET_PAY_AWARD 		= 4445
local S2C_REQ_SINGLE_PAY_INFO 		= 4446
local S2C_REQ_GET_SINGLE_PAY_AWARD 	= 4447
local S2C_REQ_ACTIVITY_ICON_STATUS	= 4448

local PayGifAwardFlag 			= 689
local SinglePayAwardFlag 		= 690
local todayTotalPayParam 		= 221
local SingleLimitPayParam 		= 691 --用来标识单笔充值哪个能领取
local singlePayLastVersionParam = 692


-- showFlag, status, start, over 

function GetActivityStartAndOverTimeStamp(_config)
	local startTimeStamp = 0
	local endTimeStamp = 0
	if _config.use_open and _config.use_open == true and  _config.open_ser_tm then
		local openTimeStamp = g_get_init_time()
		local openDate = os.date("*t", openTimeStamp)
		openDate.hour = 0
		openDate.min = 0
		openDate.sec = 0
		openTimeStamp = os.time(openDate)
		local startDay = _config.open_ser_tm.start_day or 1
		local endDay = _config.open_ser_tm.end_day or 1
		startTimeStamp = openTimeStamp + (startDay - 1) * 24 * 60 * 60
		endTimeStamp = openTimeStamp + endDay * 24 * 60 * 60 - 1
	else
		startTimeStamp = os.time(_config.start_time)
		endTimeStamp = os.time(_config.end_time)
	end
	return startTimeStamp, endTimeStamp
end

--校验充值有礼是否可以领取奖励
local function CheckPlayerCanGetPayAwardByIndex(player, index)
	local start, over = GetActivityStartAndOverTimeStamp(g_pay_award_config)
	local cur = os.time()
	if start > cur or cur >= over then
		return false, "不在活动期间内,不能领取奖励"
	end

	local payConf = g_pay_award_config.pay_list and  g_pay_award_config.pay_list[index]
	if payConf == nil then
		return false, "不存在下标为"..index.."的奖励"
	end
	local needPay = payConf.payNum
	local iTotalPay = player:get_param(todayTotalPayParam)
	if iTotalPay < needPay then
		return false, "今日累计充值金额还不足,不能领取奖励"
	end

	local flag = player:GetFlagBitByIndex(PayGifAwardFlag, index)
	if flag == 1 then
		return false, "不能重复领取奖励"
	end

	if player:num_bag_black(0) < payConf.itemCount then
		return false, "背包空间不足,请先清理背包"
	end

	return true 
end


local function resetSinglePayAwardFlag(player)
	local lastVersion = player:get_param(singlePayLastVersionParam)
	if lastVersion ~= g_single_pay_config.versoin then
		player:set_param(SinglePayAwardFlag, 0)
		player:set_param(SingleLimitPayParam, 0)
		player:set_param(singlePayLastVersionParam, g_single_pay_config.versoin or 0)
	end
end


local function CheckSinglePayCanGetAward(player, index)
	local start, over = GetActivityStartAndOverTimeStamp(g_single_pay_config)
	local cur = os.time()
	if start > cur or cur >= over then
		return false, "不在活动期间内,不能领取奖励"
	end

	local payConf = g_single_pay_config.pay_list and  g_single_pay_config.pay_list[index]
	if payConf == nil then
		return false, "不存在下标为"..index.."的奖励"
	end

	local needPay = payConf.payNum

	local flag = player:GetFlagBitByIndex(SingleLimitPayParam, index)
	if flag == 0 then
		return false, "您还没有单笔"..needPay.."元宝的充值,不能领取奖励"
	end
	
	local flag = player:GetFlagBitByIndex(SinglePayAwardFlag, index)
	if flag == 1 then
		return false, "不能重复领取奖励"
	end

	if player:num_bag_black(0) < payConf.itemCount then
		return false, "背包空间不足,请先清理背包"
	end

	return true
end



local function SendActivityAward(player, _config, index)
	local awardConf = _config.pay_list and  _config.pay_list[index]
	if awardConf == nil then
		return 
	end

	for k, v in ipairs(awardConf.award) do
		player:NewAddItem(v.itemid, v.count, 251, 102, 0, v.bind)
	end
end

function CheckIsHasPayAwardCanGet(player)
	local status = 0
	local loop = #g_pay_award_config.pay_list
	for i = 1, loop do
		if CheckPlayerCanGetPayAwardByIndex(player, i) == true then
			status = 1
			break
		end
	end
	return status
end

function CheckIsHasSinglePayAwardCanGet(player)
	local status = 0
	local loop = #g_single_pay_config.pay_list
	for i = 1, loop do
		if CheckSinglePayCanGetAward(player, i) == true then
			status = 1
			break
		end
	end
	return status
end

function SetPlayerSingleLimitPay(player, payNum)
	resetSinglePayAwardFlag(player)
	local cur = os.time()
	local start, over = GetActivityStartAndOverTimeStamp(g_single_pay_config)
	if cur >= start and cur < over then
		for k, v in pairs(g_single_pay_config.pay_list) do
			if v.payNum == payNum then
				player:SetFlagBitByIndex(SingleLimitPayParam, k)
			end
		end
	end
	HandleReqPayAwardInfo(player)
	HandleReqSinglePayInfo(player)
end


-----------------------------------------------------游戏协议--------------------------------------------

--请求充值有礼信息
function HandleReqPayAwardInfo(player)
	local start, over = GetActivityStartAndOverTimeStamp(g_pay_award_config)
	local retMsg = 
	{
		todayPay = player:get_param(todayTotalPayParam),
		awardFlag = player:get_param(PayGifAwardFlag),
		start = start,
		over = over,
	}
	-- print_r(retMsg)
	player:SendPacketToSelf(S2C_REQ_PAY_AWARD_INFO, 0, encode(retMsg))
end

--请求领取充值有礼的奖励
function HandleReqGetPayAward(player, index)
	local ret, errorMsg = CheckPlayerCanGetPayAwardByIndex(player, index)
	if ret == false then
		player:alert(10, 0, 0, errorMsg)
		return 
	end
	player:SetFlagBitByIndex(PayGifAwardFlag, index)
	SendActivityAward(player, g_pay_award_config, index)
	HandleReqPayAwardInfo(player)
	HandleReqPayActivityIconStatus(player)
	g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>领取了充值有礼奖励，每天充值就送超值材料！<font color='#0be140'>{_showSysWin,我也要领取,OPEN_SPECIALGIFTACT,2}</font>");
end


--请求单笔付费活动信息
function HandleReqSinglePayInfo(player)
	resetSinglePayAwardFlag(player)
	local start, over = GetActivityStartAndOverTimeStamp(g_single_pay_config)
	local retMsg = 
	{
		awardFlag =player:get_param(SinglePayAwardFlag),
		canFlag = player:get_param(SingleLimitPayParam),
		start = start,
		over = over
	}
	-- print_r(retMsg)
	player:SendPacketToSelf(S2C_REQ_SINGLE_PAY_INFO, 0, encode(retMsg))
end

--请求领取单笔付费活动奖励
function HandleReqGetSinglePayAward(player, index)
	resetSinglePayAwardFlag(player)
	local ret, errorMsg = CheckSinglePayCanGetAward(player, index)
	if ret == false then
		player:alert(10, 0, 0, errorMsg)
		return 
	end
	player:SetFlagBitByIndex(SinglePayAwardFlag, index)
	SendActivityAward(player, g_single_pay_config, index)
	HandleReqSinglePayInfo(player)
	HandleReqPayActivityIconStatus(player)
	local payNum = g_single_pay_config.pay_list[index] and  g_single_pay_config.pay_list[index].payNum or 0
	g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>领取了单笔充值"..payNum.."奖励，一次性充值数值越高,奖励越丰厚！<font color='#0be140'>{_showSysWin,我也要领取,OPEN_SPECIALGIFTACT,3}</font>");

end




function CheckPayAwardCanShowIcon(player)
	local start, over = GetActivityStartAndOverTimeStamp(g_pay_award_config)
	local cur = os.time()
	if cur < start or cur >= over then
		return false
	end

	local status = CheckIsHasPayAwardCanGet(player)

	return true, status, start, over
end

function CheckSinglePayCanShowIcon(player)
	local start, over = GetActivityStartAndOverTimeStamp(g_single_pay_config)
	local cur = os.time()
	if cur < start or cur >= over then
		return false
	end

	local status = CheckIsHasSinglePayAwardCanGet(player)

	return true, status, start, over
end

function CheckOperateYBZP(player)
	local start, over = GetActivityStartAndOverTimeStamp(g_operate_ybzp)
	local cur = os.time()
	if cur < start or cur >= over then
		return false
	end
	local status = CheckOperateYBZPReward(player);
	return true, status, start, over
end

local HandleCheckIconShowList = 
{
	[1] = CheckLoginPresentIcon,
	[2] = CheckPayAwardCanShowIcon,
	[3] = CheckSinglePayCanShowIcon,
	[4] = CheckTextCollectIcon,
	[5] = CheckOperateYBZP,
}

--请求是否能显示特惠活动的图标
function HandleReqPayActivityIconStatus(player)
	local arr = {}
	local retMsg = {arr = arr}
	for id, func in pairs(HandleCheckIconShowList or {}) do
		local showFlag, status, start, over = func(player)
		if showFlag == true then
			local info = 
			{
				id = id,
				status = status,
				start = start,
				over = over
			}
			table.insert(arr, info)
		end
	end
	-- print_r(retMsg)
	player:SendPacketToSelf(S2C_REQ_ACTIVITY_ICON_STATUS, 0, encode(retMsg))
	
	arr = {}
	retMsg = {arr = arr}
	for id, func in pairs(CheckIconShowList or {}) do
		local showFlag, status, start, over = func(player)
		local info = 
		{
			id = id,
			status = status,
			start = start,
			over = over
		}
		table.insert(arr, info)
	end
	-- print_r(retMsg)
	player:SendPacketToSelf(4415, 0, encode(retMsg))
end


