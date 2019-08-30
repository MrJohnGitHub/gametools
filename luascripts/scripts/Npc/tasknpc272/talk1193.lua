  function CreatureNpcFun1193(npc,event,player,funid)
	if funid == 2 and player:get_task_state(18) == 2 then
      player:set_task_state(19,1);  
      player:push_task_data(19,1);
      player:add_exp(120000);
      player:add_gamemoney_bind(30000);
      return;
  end
end