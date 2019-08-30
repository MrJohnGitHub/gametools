function CreatureNpcFun1183(npc,event,player,funid)
  if funid == 2 and player:get_task_state(15) == 2 then
      player:set_task_state(16,1);  
      player:push_task_data(16,1);
      player:add_exp(100000);
      player:add_gamemoney_bind(20000);   
      return;
  end
end