function CreatureNpcFun1153(npc,event,player,funid)
  
 if funid == 2 and player:get_task_state(16) == 2 then
      player:set_task_state(17,1);  
      player:push_task_data(17,1);
      player:add_exp(500000);
      player:add_gamemoney_bind(25000);
      local job = player:get_job();
      if job == 1 then 
         player:add_item(20703,1,1,0,0);
      elseif job == 2 then
         player:add_item(20724,1,1,0,0);
      else 
         player:add_item(20745,1,1,0,0);  
      end   	
      return;
  end  

end