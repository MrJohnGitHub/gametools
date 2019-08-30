local ACT_ID = 57

function clearNewYearDropActivityInfo(player)
end

function NewYearDropActivityInfo(player)
	local conf, startTime, endTime = GetOperActivityConfig(G_NewYear_Drop)
	local retMsg = 
	{
		startTime = startTime,
		endTime = endTime,
		actid = ACT_ID
	}	

	if conf ~= nil then
		retMsg.award = conf.award
		retMsg.icon = conf.icon
	end
	-- print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_INFO_MSG_ID, 0, encode(retMsg))
end

function NewYearDropActivityStatus(player)
	local conf, startTime, endTime = GetOperActivityConfig(G_NewYear_Drop)
	if conf ~= nil then
		return 1, startTime, endTime, 0
	end
	return 0, 0, 0, 0
end