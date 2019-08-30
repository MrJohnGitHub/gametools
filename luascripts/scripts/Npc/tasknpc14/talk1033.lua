function CreatureNpcFun1033(npc,event,player,funid)
  if funid == 2 and player:get_task_state(33) == 2 then
      player:set_task_state(34,1);  
      player:push_task_data(34,1);
      player:add_exp(1800000);
      player:add_gamemoney_bind(100000);
      return;
  end
  end