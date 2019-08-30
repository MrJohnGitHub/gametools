function mon8501(mon,event,player)
	if player:get_param(295) >= 1 then
		player:set_param(295,player:get_param(295) - 1);
		local obj = {};
		obj.bosscount1 = player:get_param(295);
		player:SendPacketToSelf(1816,0,encode(obj));
		if player:get_param(295) == 0 and player:get_param(270) == 0 then
			player:set_param(270,1);
			obj = {};
			obj.bosstype = player:get_param(270);
			player:SendPacketToSelf(1816,0,encode(obj));
			player:gui_high_focus(13,3,20,253,"点击领取奖励");
			player:autofightstart(0,0,0);
		end
	end
end
