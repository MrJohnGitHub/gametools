








local g_yzwc_award_config = 
{

	['kill'] = {

		[1] = {
			minKill = 5,
			itemCount = 0,
			award = {
				[1] = {itemid = 2, count = 500000, bind = 1},
			},

		},
		
		[2] = {
			minKill = 10,
			itemCount = 0,
			award = {
				[1] = {itemid = 2, count = 1000000, bind = 1},
			},

		},
		
		[3] = {
			minKill = 15,
			itemCount = 0,
			award = {
				[1] = {itemid = 2, count = 1500000, bind = 1},
			},

		},
		
		[4] = {
			minKill = 20,
			itemCount = 0,
			award = {
				[1] = {itemid = 2, count = 2000000, bind = 1},
			},
		},
			
		[5] = {
			minKill = 25,
			itemCount = 0,
			award = {
				[1] = {itemid = 2, count = 2500000, bind = 1},
			},

		},
		
		[6] = {
			minKill = 30,
			itemCount = 0,
			award = {
				[1] = {itemid = 2, count = 3000000, bind = 1},
			},

		},
	}, --杀人奖励

	['join_duration'] = {
		[1] = {
			minJoin = 180, --秒为单位
			itemCount = 0,
			award = {
				[1] = {itemid = 10407, count = 4, bind = 1},
			},
		} ,
		
		[2] = {
			minJoin = 360, --秒为单位
			itemCount = 0,
			award = {
				[1] = {itemid = 10407, count = 4, bind = 1},
			},
		} ,
		
		[3] = {
			minJoin = 540, --秒为单位
			itemCount = 0,
			award = {
				[1] = {itemid = 10407, count = 4, bind = 1},
			},
		} ,
		
		[4] = {
			minJoin = 720, --秒为单位
			itemCount = 0,
			award = {
				[1] = {itemid = 10407, count = 4, bind = 1},
			},
		} ,
		
		[5] = {
			minJoin = 900, --秒为单位
			itemCount = 0,
			award = {
				[1] = {itemid = 10407, count = 4, bind = 1},
			},
		} ,
		
		[6] = {
			minJoin = 1080, --秒为单位
			itemCount = 0,
			award = {
				[1] = {itemid = 10407, count = 4, bind = 1},
			},
		} ,
		
		
	}, --参与时长


	['rank_award'] = {
		[1] = {
			itemCount = 1,
			award = {
				[1] = {itemid = 10407, count = 32, bind = 1},
			},
		},
		
		[2] = {
			itemCount = 1,
			award = {
				[1] = {itemid = 10407, count = 28, bind = 1},
			},
		},
		
		[3] = {
			itemCount = 1,
			award = {
				[1] = {itemid = 10407, count = 24, bind = 1},
			},
		},
		
		[4] = {
			itemCount = 1,
			award = {
				[1] = {itemid = 10407, count = 20, bind = 1},
			},
		},
		
		[5] = {
			itemCount = 1,
			award = {
				[1] = {itemid = 10407, count = 18, bind = 1},
			},
		},
		
		[6] = {
			itemCount = 1,
			award = {
				[1] = {itemid = 10407, count = 16, bind = 1},
			},
		},
		
		[7] = {
			itemCount = 1,
			award = {
				[1] = {itemid = 10407, count = 14, bind = 1},
			},
		},
		
		[8] = {
			itemCount = 1,
			award = {
				[1] = {itemid = 10407, count = 12, bind = 1},
			},
		},
		
		[9] = {
			itemCount = 1,
			award = {
				[1] = {itemid = 10407, count = 10, bind = 1},
			},
		},
		
		[10] = {
			itemCount = 1,
			award = {
				[1] = {itemid = 10407, count = 8, bind = 1},
			},
		},
		[11] = {
			itemCount = 1,
			award = {
				[1] = {itemid = 10407, count = 5, bind = 1},
			},
		},
		
	
	}, --排名奖励
}



local function HandleReqGetYzwcKillAward(player, count, index)
	local conf = g_yzwc_award_config.kill and g_yzwc_award_config.kill[index]
	if conf == nil then
		local errorMsg = "奖励不存在"
		player:alert(10, 0, 0, errorMsg)
		return 0
	end

	if count < conf.minKill then
		local errorMsg = "累计杀人不足,不能领取奖励"
		player:alert(10, 0, 0, errorMsg)
		return 0
	end

	if player:num_bag_black(0) < conf.itemCount then
		local errorMsg = "背包不足,请先清理背包"
		player:alert(10, 0, 0, errorMsg)
		return 
	end

	for k, v in ipairs(conf.award or {}) do
		player:NewAddItem(v.itemid, v.count, 243, 71, 0, v.bind)
	end

	return 1
end

local function HandleReqGetYzwcJionDurationAward(player, count, index)
	local conf = g_yzwc_award_config.join_duration and g_yzwc_award_config.join_duration[index]
	if conf == nil then
		local errorMsg = "奖励不存在"
		player:alert(10, 0, 0, errorMsg)
		return 0
	end

	if count < conf.minJoin then
		local errorMsg = "参与时间不足,不能领取奖励"
		player:alert(10, 0, 0, errorMsg)
		return 0
	end

	if player:num_bag_black(0) < conf.itemCount then
		local errorMsg = "背包不足,请先清理背包"
		player:alert(10, 0, 0, errorMsg)
		return 
	end

	for k, v in ipairs(conf.award or {}) do
		player:NewAddItem(v.itemid, v.count, 243, 71, 0, v.bind)
	end

	return 1
end

local function GetMailItemAndGold(award)
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
	--print(mailGold)
	--print(mailItem)
	return mailItem, mailGold
end



function HandleReqGetYzwcAward(player, count, awardType, index)

	if awardType == 0 then
		return HandleReqGetYzwcKillAward(player, count, index)
	elseif awardType == 1 then
		return HandleReqGetYzwcJionDurationAward(player, count, index)
	end

	return 0
end


function YzwcOverMailSendKillAward(role_id, totalKill, awardFlag)
	for k, v in ipairs(g_yzwc_award_config.kill or {}) do
		if v.minKill <= totalKill then
			if GetBitFlagByIndex(awardFlag, k) == 0 then
				local subject = "夜战王城累计杀人奖励"
				local body = string.format("这是您未领取的累计杀人超过%d个的夜战王城的奖励,请查收。", v.minKill)
				local mailItem, mailGold = GetMailItemAndGold(v.award)
				g_SendMailMessage(0, role_id, subject, body, mailItem, mailGold, 1,"")
			end
		end
	end
end


function YzwcOverMailSendJoinDurationAward(role_id, totalJoin, awardFlag)
	for k, v in ipairs(g_yzwc_award_config.join_duration or {}) do
		if v.minJoin <= totalJoin then
			if GetBitFlagByIndex(awardFlag, k) == 0 then
				local subject = "夜战王城参与奖励"
				local min = v.minJoin / 60
				local body = string.format("这是您未领取的参与时长超过%d分钟的夜战王城的奖励,请查收。", min)
				local mailItem, mailGold = GetMailItemAndGold(v.award)
				g_SendMailMessage(0, role_id, subject, body, mailItem, mailGold, 1,"")
			end
		end
	end
end


function YzwcOverMailSendRankAward(role_id, rank)
	local conf = g_yzwc_award_config.rank_award
	if rank > #conf then
		return 
	end
	local subject = "夜战王城排名奖励"
	local body = ""
	if rank == 11 then
		body = "根据您在夜战王城中的积分表现，现给予您如下奖励，请查收。";
	else
		body = string.format("这是您夜战王城排行第%d名的奖励,请查收。", rank)
	end

	local mailItem, mailGold = GetMailItemAndGold(conf[rank].award)
	g_SendMailMessage(0, role_id, subject, body, mailItem, mailGold, 1,"")
end


