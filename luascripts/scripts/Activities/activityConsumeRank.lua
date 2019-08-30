--[[

消费活动排行榜
--]]


local ACT_ID = 13
local paramKey = 759
local TIME_PARAM_KEY = 820
function isCosumeActivityRankOpen(player)
	-- body
	local conf, start, over = GetOperActivityConfig(g_ConsumeRankTimeConf)
	local open = 0
	if conf ~= nil then
		if player ~= nil then
			local flag = IsResetActivityAwardFlagInfo(player, conf, paramKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
			if flag == true then
				player:set_param_action(paramKey, 0)
				player:set_param_misc(paramKey, 0)
				player:set_param_type(paramKey, conf.version)
			end
		end
		open = 1
	end

	return open
end

function cleargatherConsumeActivityRankInfo(player)
	player:set_param_action(paramKey, 0)
	player:set_param_misc(paramKey, 0)
	player:set_param_type(paramKey, 0)
end

function gatherConsumeActivityRankInfo(player)
	local conf, start, over, index = GetOperActivityConfig(g_ConsumeRankTimeConf)
	local flag = IsResetActivityAwardFlagInfo(player, conf, paramKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(paramKey, 0)
		player:set_param_misc(paramKey, 0)
		player:set_param_type(paramKey, conf.version)
	end
	local action, misc, type_ = player:get_param_all_info(paramKey)
	local retMsg = 
	{
		startTime = start,
		endTime = over,
		actid = ACT_ID,
		cost = action,
	}	
	local award = g_consmeRankAwardConf[index] and g_consmeRankAwardConf[index].award
	if award ~= nil then
		retMsg.award = award
		retMsg.icon = conf.icon
	end
	-- print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_INFO_MSG_ID, 0, encode(retMsg))
end


function getConsumeActivityRealRank(rank, consumeNum, beforRank, index)
	if index  == 0 then
		local conf, start, over, confIndex = GetOperActivityConfig(g_ConsumeRankTimeConf)
		index = confIndex
	end
	local realRank = 0
	local rankConf = g_consmeRankAwardConf[index] and g_consmeRankAwardConf[index].award
	if rankConf ~= nil then
		if rank > #rankConf then
			realRank = 0
			return realRank
		end
		for i = 1, #rankConf do
			if consumeNum >= rankConf[i].minConsume then
				if beforRank < i then
					realRank = i
				else
					realRank = beforRank + 1
				end
				break
			end
		end

		if realRank > #rankConf then
			realRank = 0
		end	
	end

	return realRank
end



function gatherConsumeActivityRankStatus(player)
	local conf, startTime, endTime = GetOperActivityConfig(g_ConsumeRankTimeConf)
	local open = 0
	local status = 0
	if conf ~= nil then
		open = 1
	end

	return open, startTime, endTime, status
end

--活动结束
--通知C++发奖励
function ConsumeRankActivityOverNotifySendAward()
	local cur = os.time()
	local index = 0
	for k, v in pairs(g_ConsumeRankTimeConf) do
		local startTime = 0
		local endTime = 0
		if v.isUseOpen and v.isUseOpen == true then
			local OpenStartDay = v.OpenStartDay
			local OpenEndDay = v.OpenEndDay
			local openTimeStamp = g_get_init_time()
			
			if  g_get_union_day() > 0 then
				if v.isUnionFlag and v.isUnionFlag == true then
					openTimeStamp = g_get_union_time()
				end
			end
			
			startTime = openTimeStamp + (OpenStartDay - 1) * 24 * 60 * 60
			endTime = openTimeStamp + OpenEndDay * 24 * 60 * 60 - 1
		else
			startTime = os.time(v.StartTime)
			endTime = os.time(v.EndTime)
		end
		--跟结束时间相差在10秒以内就算是刚刚结束需要的那份配置
		if cur > endTime and cur - endTime <= 10 then
			index = k
			break 
		end
	end

	if index ~= 0 then
		local award = g_consmeRankAwardConf[index] and g_consmeRankAwardConf[index].award
		if award ~= nil then
			local sendCount = #award
			if sendCount > 0 then
				g_MailSendConsumeRankActivityAward(sendCount, index)
			end
		end
	end
end


--邮件发送消费排行榜活动奖励
function MailSendConsumeRankAward(roleid, rank, confIndex)
	local rankConf = g_consmeRankAwardConf[confIndex] and g_consmeRankAwardConf[confIndex].award
	if rankConf and rankConf[rank] and rankConf[rank].awardList then
		local mailItem, mailGold, mailbinds = NewGatherMailItemAndGold(rankConf[rank])
		local subject = "消费排行榜奖励"
		local body = "恭喜你在消费排行榜活动中获得第<font color='#FFFF000'>"..rank.."</font>名，以下是给予您的奖励，请查收。"
		g_SendMailMessage(0, roleid, subject, body, mailItem, mailGold, 1, mailbinds)
	else
		print("MailSendConsumeRankAward awardConfig is nil")
	end

end