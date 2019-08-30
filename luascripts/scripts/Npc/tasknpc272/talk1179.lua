function CreatureNpcFun1179(npc,event,player,funid)	
  if funid == 2 and player:get_task_state(66) == 2 then	
      player:set_task_state(67,1);  
      player:push_task_data(67,1);
	  player:add_gamemoney_bind(500000);
      player:add_exp(3000000);    
      return;
  end

  if funid == 2 and player:get_task_state(87) == 2 then
      player:set_task_state(88,1);  
      player:push_task_data(88,1);
      player:add_exp(6000000);
      player:add_gamemoney_bind(750000);  
      return;
  end



 if funid == 2 and player:get_task_state(98) == 2 then
      player:set_task_state(99,1);  
      player:push_task_data(99,1);
      player:add_exp(8000000);
      player:add_gamemoney_bind(1000000);      
      return;
  end

 if funid == 2 and player:get_task_state(106) == 2 then
      player:set_task_state(107,1);  
      player:push_task_data(107,1);
      player:add_exp(100000);
      player:add_gamemoney_bind(10000000);    
      return;
  end

 if funid == 2 and player:get_task_state(111) == 1 then
 	  player:set_task_state(111,2);
      player:add_exp(100000);
      player:add_gamemoney_bind(100000); 
	  local zhuanshen = player:get_param(258);
      if zhuanshen >= 3 then
      	  player:set_task_state(112,2);
      	  player:push_task_data(112,1);
      else	      
	      player:set_task_state(112,1);
	      player:set_task_param(112,1,zhuanshen); 
	      player:push_task_data(112,1);
      end
      return;
  end
end