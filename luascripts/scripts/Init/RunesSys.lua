

local g_config = {
	
	[1] = 60,
	[2] = 60,
	[3] = 60,
	[4] = 60,
	[5] = 60,
	[6] = 60,    

}




function GetOpenRunesHole(player)
	local iTotal = 0
	local level = player:get_level()
	for k, v in ipairs(g_config) do
		if level >= v then
			iTotal = k
		end
	end

	return iTotal
end