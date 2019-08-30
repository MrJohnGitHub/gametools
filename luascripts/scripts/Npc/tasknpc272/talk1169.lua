function CreatureNpcFun1169(npc,event,player,funid)
	if funid == 2 then
			if player:get_task_state(55) == 2 then		
			   player:set_task_state(56,1);  
			   player:push_task_data(56,1);
			   player:add_exp(2500000);
			   player:add_gamemoney_bind(300000);  
			return;
	        end  
	end
end