function CreatureNpcFun1170(npc,event,player,funid)

if funid == 2 and player:get_task_state(56) == 1 then
      player:set_task_state(56,2);  	
      player:set_task_state(57,1);  
      player:push_task_data(57,1);
      player:add_exp(2500000);
      player:add_gamemoney_bind(300000);
      return;
  end
end