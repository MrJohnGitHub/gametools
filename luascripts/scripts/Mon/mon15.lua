function mon2045(mon,event,player)
 
	
		 if player:get_task_state(48) == 1 then
			if player:get_task_param(48,1) < 1 then
	    		player:set_task_param(48,1,player:get_task_param(48,1) + 1);
				  --       player:alert(111,0,0,"击杀目标数量："..player:get_task_param(15,1).."/1");
			end
			if player:get_task_param(48,1) == 1 then
			   player:set_task_state(48,2);
			end
			   player:push_task_data(48,1);     
		 end	


end
