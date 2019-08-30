function CreatureNpcFun1138(npc,event,player,funid)	

if funid == 2 and player:get_task_state(67) == 1 then
  player:set_task_state(67,2);
  player:set_task_state(68,1);  
  player:push_task_data(68,1);
  player:add_exp(100000);
  player:add_gamemoney_bind(400000);
  return;
 end

  

end