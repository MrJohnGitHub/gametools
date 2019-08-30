function CreatureNpcFun1207(npc,event,player,funid)	
	if funid == 2 and player:get_task_state(82) == 2 then
		player:set_task_state(83,1);  
		player:push_task_data(83,1);
		player:add_exp(100000);
		player:add_gamemoney_bind(650000);
		player:add_vcoin_bind(500);
		local sum = player:Equipment_Num(0,60,0);
		if sum >= 2 then
			player:set_task_state(83,2);	
		else
		  	player:set_task_param(83,1,sum);
		end  
		player:push_task_data(83,1);
		return;
	end
end