function CreatureNpcFun1117(npc,event,player,funid)	
if funid == 2 and player:get_task_state(71) == 1 then
  player:set_task_state(71,2);	
  player:set_task_state(72,1);  
  player:push_task_data(72,1);
  player:add_gamemoney_bind(500000);
  player:add_item(10290,1,1,0,0);
  player:add_item(40301,1,1,0,0);
  return;
 end

 if funid == 2 and player:get_task_state(102) == 1 then
	  player:set_task_state(102,2);	
      player:set_task_state(103,1);  
      player:push_task_data(103,1);
      player:add_exp(100000);
      player:add_gamemoney_bind(1000000);          
      return;
  end

end