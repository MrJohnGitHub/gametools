
local ReqActInfoHandleEnum = 
{
	[1] = HandleReqConsumeRetInfo,
	[2] = HandleReqTreasureRetInfo,
	[3] = HandleReqGoldRetInfo,
}


function ReqActivityInfo(player, actType)
	local func = ReqActInfoHandleEnum[actType]
	if func then
		func(player)
	else
		print("ReqActivityInfo func is nil by actType:",actType)
	end
end




local ReqGetActAwardHandleEnum = 
{

	[1] = HandleReqGetConsumeRetAward,
	[2] = HandleReqGetTreasureRetAward,
	[3] = HandleReqGetGoldRetAward,
}


function ReqGetActivityAward(player, actType, index)
	local func = ReqGetActAwardHandleEnum[actType]
	if func then
		local ret = func(player, index)
		if ret == true then
			HandlerGetFanTianGifState(player)
		end
	end
end

