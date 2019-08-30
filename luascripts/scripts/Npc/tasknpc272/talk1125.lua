function CreatureNpcFun1125(npc,event,player,funid)
  
  if funid == 2 and player:get_task_state(97) == 1 then
 	  player:set_task_state(97,2);
      player:set_task_state(98,1);  
      player:push_task_data(98,1);
      player:add_exp(100000);
      player:add_gamemoney_bind(100000);
    local sum = player:Equipment_Num(0,60,0);
    if sum >= 4 then
      player:set_task_state(98,2);
      player:push_task_data(98,1);  
    else
      player:set_task_param(98,1,sum);
      player:push_task_data(98,1);
    end           
      return;
  end 

 if funid == 2 and player:get_task_state(99) == 1 then
	  player:set_task_state(99,2);
      player:set_task_state(100,1);  
      player:push_task_data(100,1);
      player:add_exp(100000);
      player:add_gamemoney_bind(950000);    
      return;
  end
  
end