function CreatureNpcFun1166(npc,event,player,funid)
  if funid == 2 and player:get_task_state(21) == 1 then
      player:set_task_state(21,2);   
      player:set_task_state(22,1);  
      player:push_task_data(22,1);
      player:add_exp(100000);
      player:add_gamemoney_bind(40000);
      return;
  end
end