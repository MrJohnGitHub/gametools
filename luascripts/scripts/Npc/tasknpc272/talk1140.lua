function CreatureNpcFun1140(npc,event,player,funid)
  if funid == 2 and player:get_task_state(19) == 1 then
      player:set_task_state(19,2);
      player:set_task_state(20,1);  
      player:push_task_data(20,1);
      player:add_exp(140000);
      player:add_gamemoney_bind(35000);
      return;
  end

end