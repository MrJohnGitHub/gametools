function CreatureNpcFun1167(npc,event,player,funid)
if funid == 2 and player:get_task_state(53) == 1 then
      player:set_task_state(53,2);   
      player:set_task_state(54,1);  
      player:push_task_data(54,1);
      player:add_exp(1200000);
      player:add_gamemoney_bind(250000);
      return;
  end
end