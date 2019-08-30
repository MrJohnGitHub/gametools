function mon8723(mon,player,damhp,lefhp)
	player:add_exp(damhp * 5);
	player:add_gamemoney_bind(damhp);
end


function onRelive12(inid,mon)
	-- local nMOn = mon:GetEntry();
	-- if nMOn == 6612 then
	-- 	mon:autofightstart(12,139,152);
	-- end
end
