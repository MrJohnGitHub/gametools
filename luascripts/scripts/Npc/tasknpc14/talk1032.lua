function CreatureNpcFun1032(npc,event,player,funid)
  if funid == 2 and player:get_task_state(32) == 2 then  
      player:set_task_state(33,1);  
      player:push_task_data(33,1);
      player:add_exp(750000);
      player:add_gamemoney_bind(100000);	
      return;
  end
end  