function CreatureNpcFun1187(npc,event,player,funid)
  if funid == 2 and player:get_task_state(50) == 1 then
      player:set_task_state(50,2);
      player:set_task_state(51,1);  
      player:push_task_data(51,1);
      player:add_exp(1200000);
      player:add_gamemoney_bind(250000);
      player:add_item(40101,5,1,0,0);
      player:add_vcoin_bind(30);
      return;
  end

  





end