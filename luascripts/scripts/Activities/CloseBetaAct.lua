-- 封测活动


--[[

	配置说明
	award里面的itemId:是物品就填物品ID， 金币填1，绑金填2  元宝填100 绑元填101

]]

local CloseBetaConf = {
	--[[
		2是登录封测活动奖励配置
	
	]]

	[1] = {
		open = false,
		startTime = {year = 2016, month = 7, day = 27, hour = 0, min = 0, sec = 0},
		endTime = {year = 2016, month = 8, day = 27, hour = 0, min = 0, sec = 0},
		awardConf = {
			[1] = {
				loginCount = 1, --登录累计天数
				award = {
					[1] = {itemId = 100, count = 500, bind = 1},
				},
			},

			[2] = {
				loginCount = 2, --登录累计天数
				award = {
					[1] = {itemId = 100, count = 1000, bind = 1},
				},
			},

			[3] = {
				loginCount = 3, --登录累计天数
				award = {
					[1] = {itemId = 100, count = 1000, bind = 1},
				},
			},

			[4] = {
				loginCount = 4, --登录累计天数
				award = {
					[1] = {itemId = 100, count = 1000, bind = 1},
				},
			},

			[5] = {
				loginCount = 5, --登录累计天数
				award = {
					[1] = {itemId = 100, count = 1000, bind = 1},
				},
			},

			[6] = {
				loginCount = 6, --登录累计天数
				award = {
					[1] = {itemId = 100, count = 1000, bind = 1},
				},
			},

			[7] = {
				loginCount = 7, --登录累计天数
				award = {
					[1] = {itemId = 100, count = 1000, bind = 1},
				},
			},	

			[8] = {
				loginCount = 8, --登录累计天数
				award = {
					[1] = {itemId = 100, count = 1000, bind = 1},
				},
			},	

			[9] = {
				loginCount = 9, --登录累计天数
				award = {
					[1] = {itemId = 100, count = 1000, bind = 1},
				},
			},	

			[10] = {
				loginCount = 10, --登录累计天数
				award = {
					[1] = {itemId = 100, count = 1000, bind = 1},
				},
			},	

			[11] = {
				loginCount = 11, --登录累计天数
				award = {
					[1] = {itemId = 100, count = 1000, bind = 1},
				},
			},	

			[12] = {
				loginCount = 12, --登录累计天数
				award = {
					[1] = {itemId = 100, count = 1000, bind = 1},
				},
			},	

			[13] = {
				loginCount = 13, --登录累计天数
				award = {
					[1] = {itemId = 100, count = 1000, bind = 1},
				},
			},	

			[14] = {
				loginCount = 14, --登录累计天数
				award = {
					[1] = {itemId = 100, count = 1000, bind = 1},
				},
			},	
		},
	},

	--[[
		1是在线时间配置
		open配置为false则这个活动就直接不开放
	]]
	[2] = {
		open = false,
		startTime = {year = 2016, month = 7, day = 27, hour = 0, min = 0, sec = 0},
		endTime = {year = 2016, month = 8, day = 27, hour = 0, min = 0, sec = 0},
		awardConf = {
			[1] = {
				onLineTime = 0.5 * 60, --在线时间, 这里的在线时间单位是分钟
				award = {
					[1] = {itemId = 100, count = 500, bind = 1},
				}, --奖励
			},

			[2] = {
				onLineTime = 1 * 60,
				award = {
					[1] = {itemId = 100, count = 500, bind = 1},
				},
			},

			[3] = {
				onLineTime = 2 * 60,
				award = {
					[1] = {itemId = 100, count = 1000, bind = 1},
				},
			},
		}, --奖励配置
	}, 


	--[[
		升级奖励配置
	]]

	[3] = {
		open = false,
		startTime = {year = 2016, month = 7, day = 27, hour = 0, min = 0, sec = 0},
		endTime = {year = 2016, month = 8, day = 27, hour = 0, min = 0, sec = 0},

		awardConf = {
			[1] = {
				level = 60, --等级
				award = {
					[1] = {itemId = 100, count = 500, bind = 1},
				},
			},

			[2] = {
				level = 65, --等级配置
				award = {
					[1] = {itemId = 100, count = 1000, bind = 1},
				},
			},

			[3] = {
				level = 70,
				award = {
					[1] = {itemId = 100, count = 2000, bind = 1},
				},

			},
			[4] = {
				level = 80,
				award = {
					[1] = {itemId = 100, count = 5000, bind = 1},
				},

			},
		},

	}, 
}



local FCACT_REQ_INFO_MSG_ID = 4426


local function IsCloseBetaActOpen(actId)
	local bOpen = false
	local conf = CloseBetaConf[actId]
	if conf then
		local open = conf.open or false
		local startTimeStamp = os.time(conf.startTime)
		local endTimeStamp = os.time(conf.endTime)
		local curTimeStamp = os.time()
		if open and curTimeStamp >= startTimeStamp and curTimeStamp < endTimeStamp then
			bOpen = true
		end
	end

	return bOpen
end



local function GetCloseBetaActStartAndEndTimeStamp(actId)
	local conf = CloseBetaConf[actId]
	local startTimeStamp = 0
	local endTimeStamp = os.time() - 60
	if conf and conf.open == true then
		startTimeStamp = os.time(conf.startTime)
		endTimeStamp = os.time(conf.endTime)
	end 
	return startTimeStamp, endTimeStamp
end

local function CheckHasNotEvertGetAward(player, awardIndex, flagParamIndex)
	local retCode = player:GetFlagBitByIndex(flagParamIndex, awardIndex)
	if retCode == 1 then
		return false, "已经领取过奖励，不能重复领取"
	end

	return true
end

local function HandleCheckOnlineTimeAct(player, actId, awardIndex, flagParamIndex)
	local retCode, errMsg = CheckHasNotEvertGetAward(player, awardIndex, flagParamIndex)
	if retCode == true then
		local onlineTime =  player:get_online_time()
		local actConf = CloseBetaConf[actId]
		local realConf = actConf and actConf.awardConf and actConf.awardConf[awardIndex]
		if realConf then
			local needTime = realConf.onLineTime * 60
			if onlineTime >= needTime then
				return true, "", realConf
			else
				local errMsg = "在线累计时间不足，不能领取奖励"
				return false, errMsg
			end

		else
			local errMsg = "活动配置有误，不存在活动id:"..actId..", 奖励下标为:"..awardIndex.."的奖励"
			return false, errMsg
		end
	else
		return retCode, errMsg
	end
end

local function HandleCheckLoginCountAct(player, actId, awardIndex, flagParamIndex)
	local retCode, errMsg = CheckHasNotEvertGetAward(player, awardIndex, flagParamIndex)
	if retCode == true then
		local loginCount = player:get_param(642)
		local actConf = CloseBetaConf[actId]
		local realConf = actConf and actConf.awardConf and actConf.awardConf[awardIndex]
		if realConf then
			local needCount = realConf.loginCount 
			if loginCount >= needCount then
				return true, "", realConf
			else
				local errMsg = "登录累计天数不足，不能领取奖励"
				return false, errMsg
			end

		else
			local errMsg = "活动配置有误，不存在活动id:"..actId..", 奖励下标为:"..awardIndex.."的奖励"
			return false, errMsg
		end
	else
		return retCode, errMsg
	end
end

local function HandleCheckLevelUpAct(player, actId, awardIndex, flagParamIndex)
	-- body
	local retCode, errMsg = CheckHasNotEvertGetAward(player, awardIndex, flagParamIndex)
	if retCode == true then
		local level = player:get_level()
		local actConf = CloseBetaConf[actId]
		local realConf = actConf and actConf.awardConf and actConf.awardConf[awardIndex]
		if realConf then
			local needLevel = realConf.level 
			if level >= needLevel then
				return true, "", realConf
			else
				local errMsg = "等级不足，不能领取奖励"
				return false, errMsg
			end

		else
			local errMsg = "活动配置有误，不存在活动id:"..actId..", 奖励下标为:"..awardIndex.."的奖励"
			return false, errMsg
		end
	else
		return retCode, errMsg
	end
end




local function HandleGetOnlineTimeActInfo(player, actId)
	local start, over = GetCloseBetaActStartAndEndTimeStamp(actId)
	local online = player:get_online_time()
	local awardFlag = player:get_param(644)
	local retMsg = {
		actId = actId,
		startTimeStamp = start, --活动开始时间
		endTimeStamp = over, --活动结束时间
		curTimeStamp = os.time(), --当前时间
		onLineTime = online, --在线累计时间
		awardFlag =  awardFlag,--奖励领取标志
	}
	--print_r(retMsg)
	player:SendPacketToSelf(FCACT_REQ_INFO_MSG_ID, 0, encode(retMsg))
end


local function HandleGetLoginCountActInfo(player, actId)
	local start, over = GetCloseBetaActStartAndEndTimeStamp(actId)
	local nCount = player:get_param(642)
	local awardFlag = player:get_param(643)
	local retMsg = {
		actId = actId,
		startTimeStamp = start, --活动开始时间
		endTimeStamp = over, --活动结束时间
		curTimeStamp = os.time(), --当前时间
		loginCount = nCount, --登录累计天数
		awardFlag = awardFlag --奖励领取标志
	}
	--print_r(retMsg)
	player:SendPacketToSelf(FCACT_REQ_INFO_MSG_ID, 0, encode(retMsg))
end

local function HandleGetLevelUpActInfo(player, actId)
	local start, over = GetCloseBetaActStartAndEndTimeStamp(actId)
	local awardFlag = player:get_param(645)
	local retMsg = {
		actId = actId,
		startTimeStamp = start, --活动开始时间
		endTimeStamp = over, --活动结束时间
		curTimeStamp = os.time(), --当前时间
		awardFlag = awardFlag --奖励领取标志
	}
	--print_r(retMsg)
	player:SendPacketToSelf(FCACT_REQ_INFO_MSG_ID, 0, encode(retMsg))
end


local optTypeList = {
	[1] = 240,
	[2] = 241,
	[3] = 239,
}

local function SendActAward(player, actId, realConf)
	local awardList = realConf.award
	if awardList == nil then
		return 
	end
	local optType = optTypeList[actId]
	local fly = 0
	local addCount = 0
	for k, v in ipairs(awardList) do
		local bind = v.bind or 0
		player:NewAddItem(v.itemId, v.count, optType, 0, fly, bind)
		if v.itemId == 100 then
			addCount = addCount + v.count
		end
	end
	player:SendVcoinFly(addCount, 10,1)
end


local getCheckHandler = {
	[1] = HandleCheckLoginCountAct,
	[2] = HandleCheckOnlineTimeAct,
	[3] = HandleCheckLevelUpAct,
}


local getActInfoHandleList = {
	[1] = HandleGetLoginCountActInfo,
	[2] = HandleGetOnlineTimeActInfo,
	[3] = HandleGetLevelUpActInfo,
}


local awardFlagParamIndex = {
	[1] = 643,
	[2] = 644,
	[3] = 645,
}



function HandleReqGetCloseBetaActInfo(player, actId)
	local func = getActInfoHandleList[actId]
	if func then
		func(player, actId)
	end
end


function HandleReqGetCloseBetaActAward(player, actId, awardIndex)
	if IsCloseBetaActOpen(actId) == false then
		local notifyMsg = "活动已经结束"
		player:alert(10, 0, 0,notifyMsg)
		return 
	end

	if player:get_level() < 25 then
		return 
	end

	local checkFunc = getCheckHandler[actId]
	if checkFunc ~= nil then
		local flagParamIndex = awardFlagParamIndex[actId]
		local retCode, errMsg, realConf = checkFunc(player, actId, awardIndex, flagParamIndex) 
		if retCode == true then
			player:SetFlagBitByIndex(flagParamIndex, awardIndex)
			SendActAward(player, actId, realConf)
			HandleReqGetCloseBetaActInfo(player, actId)
		else
			player:alert(10, 0, 0,errMsg)
		end
	end
end


function AcrossDayNotifyCloseBetaAct(player)
	local curDate = os.date("*t", os.time())
	local bNotify = false
	if curDate.hour == 0 and curDate.min == 0 and curDate.sec == 0 then
		bNotify = true
	end

	if bNotify == false then
		return 
	end

	for actId, _ in ipairs(awardFlagParamIndex) do
		if IsCloseBetaActOpen(actId) == true then
			HandleReqGetCloseBetaActInfo(player, actId)
		end
	end
end

function CheckIsDuringCloseBetaAct()
	local bOpen = false
	for actId, _ in ipairs(CloseBetaConf) do
		if IsCloseBetaActOpen(actId) == true then
			bOpen = true
			break
		end
	end

	return bOpen
end