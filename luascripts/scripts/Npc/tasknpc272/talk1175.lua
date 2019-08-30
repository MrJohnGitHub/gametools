function CreatureNpcFun1175(npc,event,player,funid)

 if funid == 2 and player:get_task_state(37) == 1 then
     player:set_task_state(37,2);  
     player:set_task_state(38,1);  
     player:push_task_data(38,1);
     player:add_exp(500000);
     player:add_gamemoney_bind(100000);
     return;
 end
 
  if funid == 2 and player:get_task_state(63) == 1 then 	
	  player:set_task_state(63,2);
      player:set_task_state(64,1);  
      player:push_task_data(64,1);
	  player:add_gamemoney_bind(350000);
	  player:add_exp(100000);
      return;
  end
	
end