
--[[
	封测期间充值返利

--]]

local rebateConfig = {
	isCloseBeta = 1, --1是表示在封测  0表示不是封测是正式服了
	rebateLimitNum = 4000, --返还的最高额度上限, 超过4000元以上的额度是不会有返利的
	ration = 1.5, --返还的比例是1.5倍
}

local S2C_GET_REBATE_INFO = 4432

local function GetShouldReturnGold(payNum)
	local rebateLimitNum = rebateConfig.rebateLimitNum
	local ration = rebateConfig.ration
	local retGold = 0
	if payNum > rebateLimitNum then
		retGold = math.floor(rebateLimitNum * 100 * ration  + (payNum - rebateLimitNum) * 100)
	else
		retGold = math.floor(payNum * 100 * ration)
	end

	return retGold
end

--返利
function RebateGold(player, payNum)
	if payNum <= 0 or rebateConfig.isCloseBeta == 1 then
		return 
	end
	local retGold = GetShouldReturnGold(payNum)
	local optType = 244
	player:NewAddItem(101, retGold, 0, optType, 0, 0)
	player:SendVcoinFly(retGold, 10,0)
	local retMsg = {flag = 1}
	player:SendPacketToSelf(4433, 0, encode(retMsg))
end

function AddRebatePayRecord(player, payNum)
	if rebateConfig.isCloseBeta == 1 then
		--封测期间充值的钱数才会加入返还的列表中
		if payNum > 0 then
			payNum = math.floor(payNum / 100)
			g_AddRebatePayRecord(player, payNum)
		end
	end
end


function CheckIsCloseBeta()
	return rebateConfig.isCloseBeta
end

function HandlerRequestRebateInfo(player, payNum, isValidServ)
	if rebateConfig.isCloseBeta == 0 then
		--不在封测活动期间
		--把可以返利的信息下发给前端
		local retGold = GetShouldReturnGold(payNum)
		local retMsg = {
			isValidServ = isValidServ,
			payNum = payNum * 100,
			retGold = retGold,
		}
		-- print_r(retMsg)
		player:SendPacketToSelf(S2C_GET_REBATE_INFO, 0, encode(retMsg))
	end
end


