--[[

坐骑竞技
--]]

local S2C_REQ_INFO_MSG_ID 	= 4422
local PARAM_KEY = 756

local function resetMountCompetitiveInfo(player, key)
	local _, awardFlag, version = player:get_param_all_info(PARAM_KEY)
	if OpenSerActSetting[key].version and version ~= OpenSerActSetting[key].version then
		awardFlag = 0
		version = OpenSerActSetting[key].version
		player:set_param_misc(PARAM_KEY, awardFlag)
		player:set_param_type(PARAM_KEY, version)
	end
	return awardFlag
end

function HandlerReqMountCompetitiveInfo(player, openSerTime, key)
	local awardFlag = resetMountCompetitiveInfo(player, key) 
	local start, over = GetOpenSerActStartAndEndTime(openSerTime, key)
	local retMsg = {
		beginTime = start,
		endTime = over,
		curTime = os.time(),
		actId = ActNameToActId[key],
		awardFlag = awardFlag,
	}
	--print_r(retMsg)
	player:SendPacketToSelf(S2C_REQ_INFO_MSG_ID, 0, encode(retMsg))
end


function CheckCanGetMountCompetitiveAward(player, key, index, openSerTime)
	local config = OpenSerActSetting[key] and OpenSerActSetting[key].config
	local mountlevel, star = player:get_mount_info()
	if config == nil then
		print("if config == nil then key",key)
		return false, error_msg.notAward
	end
	local awardFlag = resetMountCompetitiveInfo(player, key)
	if index ~= nil then
		if config[index] == nil then
			return false, error_msg.notAward
		end 
		local flag = GetBitFlagByIndex(awardFlag, index)
		if flag == 1 then
			return false, error_msg.rePeat
		end
		local needlevel = config[index].level or 0
		local needstar = config[index].star or 0
		if mountlevel > needlevel then
			return true
		elseif mountlevel == needlevel and star >= needstar then
			return true
		else
			return false, error_msg[key]
		end
	else 
		for k, v in pairs(config) do
			local flag = GetBitFlagByIndex(awardFlag, k)
			if flag == 0 then
				local needlevel = v.level or 0
				local needstar = v.star or 0	
				if mountlevel > needlevel then
					return true
				elseif mountlevel == needlevel and star >= needstar then
					return true
				end
			end
		end

		return false
	end
end



function SendMountCompetitiveAward(player, key, index)
	local bFlag = false
	local awardFlag = resetMountCompetitiveInfo(player, key) 
	local config = OpenSerActSetting[key] and OpenSerActSetting[key].config
	local award = config and config[index] and config[index].award
	if award then
		local itemCount = config[index].itemCount or 0
		if itemCount <=  player:num_bag_black(0) then
			local optType = AddItemOptType[key] or 0
			local consumeType = AddMoneyOptType[key] or 0
			local fly = 0
			for k, v in ipairs(award) do
				local bind = 1
				if v.bind and v.bind == 1 then
					bind = 0
				end
				player:NewAddItem(v.itemId, v.count, optType, consumeType, fly, bind)
			end
			bFlag = true
		else
			local notifyMsg = "您的背包空间不足"..itemCount.."格"
			player:alert(10, 0, 0,notifyMsg)
		end
	end
	if bFlag == true then
		awardFlag = player:set_param_misc_index_flag(PARAM_KEY, index)
	end
	return bFlag, awardFlag
end