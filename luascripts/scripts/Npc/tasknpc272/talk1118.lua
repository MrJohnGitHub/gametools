function CreatureNpcFun1118(npc,event,player,funid)	
	
 if funid == 2 and player:get_task_state(108) == 1 then
      player:set_task_state(108,2);
      player:set_task_state(109,1);  
      player:push_task_data(109,1);
      player:add_exp(100000);
      player:add_gamemoney_bind(100000); 
      local zhuanshen = player:get_param(258);
      if zhuanshen >= 1 then
      player:set_task_state(109,2);
      player:push_task_data(109,1);
      end
      return;
  end


end