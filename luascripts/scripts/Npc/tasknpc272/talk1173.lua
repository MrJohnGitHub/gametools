function CreatureNpcFun1173(npc,event,player,funid)
  if funid == 2 and player:get_task_state(58) == 1 then
		player:set_task_state(58,2);    	
		player:set_task_state(59,1);  
		player:push_task_data(59,1);
		player:add_exp(2000000);
		player:add_gamemoney_bind(300000);
		return;
	end


end