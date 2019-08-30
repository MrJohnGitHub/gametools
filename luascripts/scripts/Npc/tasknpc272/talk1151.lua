function CreatureNpcFun1151(npc,event,player,funid)
  if funid == 2 and player:get_task_state(22) == 1 then
      player:set_task_state(22,2);
      player:set_task_state(23,1);  
      player:push_task_data(23,1);
      player:add_exp(400000);
      player:add_gamemoney_bind(45000);
      return;
  end
	
end