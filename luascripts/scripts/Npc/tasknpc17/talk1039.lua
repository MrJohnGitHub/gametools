function CreatureNpcFun1039(npc,event,player,funid)
  if funid == 2 and player:get_task_state(47) == 1 then
      player:set_task_state(47,2);
      player:set_task_state(48,1);  
      player:push_task_data(48,1);
      player:add_exp(1500000);
      player:add_gamemoney_bind(200000);
      return;
  end
end



