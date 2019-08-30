function CreatureNpcFun1113(npc,event,player,funid)	
if funid == 2 and player:get_task_state(80) == 1 then
  player:set_task_state(80,2);
  player:set_task_state(81,1);  
  player:push_task_data(81,1);
  player:add_gamemoney_bind(600000);
  player:add_exp(1000000);
  return;
 end
end