function CreatureNpcFun1107(npc,event,player,funid)	

if funid == 2 and player:get_task_state(72) == 1 then
  player:set_task_state(72,2);
  player:set_task_state(73,1);  
  player:push_task_data(73,1);
  player:add_exp(100000);
  player:add_gamemoney_bind(500000);
  return;
 end
 
 if funid == 2 and player:get_task_state(101) == 2 then
  player:set_task_state(102,1);  
  player:push_task_data(102,1);
  player:add_exp(8000000);
  player:add_gamemoney_bind(1100000);
  player:add_item(10279,1,1,0,0);	
  return;
 end

end