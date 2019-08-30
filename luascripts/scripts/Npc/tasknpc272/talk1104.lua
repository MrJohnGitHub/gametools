function CreatureNpcFun1104(npc,event,player,funid)
  if funid == 2 and player:get_task_state(88) == 1 then
  	  player:set_task_state(88,2);
      player:set_task_state(89,1);  
      player:push_task_data(89,1);
      player:add_exp(100000); 
      player:add_gamemoney_bind(100000);           
      return;
  end

end