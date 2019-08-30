function CreatureNpcFun1201(npc,event,player,funid)
if funid == 2 and player:get_task_state(39) == 1 then
      player:set_task_state(39,2);  
      player:set_task_state(40,1);  
      player:push_task_data(40,1);
      player:add_exp(750000);
      player:add_gamemoney_bind(150000);
      return;
  end
end