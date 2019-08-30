function CreatureNpcFun1115(npc,event,player,funid)	
if funid == 2 and player:get_task_state(83) == 2 then
  player:set_task_state(84,1);  
  player:push_task_data(84,1);
  player:add_exp(6000000);
  player:add_gamemoney_bind(650000);
  return;
 end
 
if funid == 2 and player:get_task_state(92) == 1 then
  player:set_task_state(92,2);
  player:set_task_state(93,1);  
  player:push_task_data(93,1);
  player:add_exp(100000);
  player:add_gamemoney_bind(100000);
  return;
 end 

 if funid == 2 and player:get_task_state(109) == 2 then
      player:set_task_state(110,1);  
      player:push_task_data(110,1);
      player:add_vcoin_bind(100);  
      player:add_exp(100000);
      player:add_gamemoney_bind(100000); 
      return;
  end


end