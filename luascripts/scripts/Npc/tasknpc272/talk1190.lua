function CreatureNpcFun1190(npc,event,player,funid)	

  if funid == 2 and player:get_task_state(35) == 1 then
      player:set_task_state(35,2);
      player:set_task_state(36,1);  
      player:push_task_data(36,1);
      player:add_exp(900000);
      player:add_gamemoney_bind(100000);
      return;
  end	

if funid == 2 and player:get_task_state(95) == 2 then
  player:set_task_state(96,1);  
  player:push_task_data(96,1);
  player:add_exp(7000000);
  player:add_gamemoney_bind(100000);
  player:add_item(10279,1,1,0,0);	
  return;
 end

if funid == 2 and player:get_task_state(104) == 2 then
  player:set_task_state(105,1);  
  player:push_task_data(105,1);
  player:add_exp(12000000);
  player:add_gamemoney_bind(1000000);
  return;
 end 

end