function CreatureNpcFun1180(npc,event,player,funid)	
 if funid == 2 and player:get_task_state(100) == 1 then
      player:set_task_state(100,2);
      player:set_task_state(101,1);  
      player:push_task_data(101,1);
      player:add_exp(100000);
      player:add_gamemoney_bind(100000);
      local yb = player:get_vcoin_bind() - player:get_vcoin();
      if yb < 800 then
        player:set_task_param(101,1,yb);
        player:push_task_data(101,1);
      else
        player:set_task_state(101,2);
        player:push_task_data(101,1);
      end 
      return;
  end
  
   if funid == 2 and player:get_task_state(78) == 2 then
  player:set_task_state(79,1);  
  player:push_task_data(79,1);
  player:add_exp(100000);
  player:add_gamemoney_bind(600000);
  local sum = player:Equipment_Num(0,60,0);
  if sum >= 1 then
	 player:set_task_state(79,2);	
  else
	 player:set_task_param(79,1,sum);
  end  
  player:push_task_data(79,1);
  return;
end
 
end