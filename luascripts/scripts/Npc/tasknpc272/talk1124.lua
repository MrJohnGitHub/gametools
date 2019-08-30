function CreatureNpcFun1124(npc,event,player,funid)

if funid == 2 and player:get_task_state(86) == 1 then
	  player:set_task_state(86,2);
      player:set_task_state(87,1);  
      local yb = player:get_vcoin_bind() - player:get_vcoin();
      if yb < 600 then
      	player:set_task_param(87,1,yb);
      	player:push_task_data(87,1);
      else
      	player:set_task_state(87,2);
        player:push_task_data(87,1);
      end     
      player:add_exp(100000);
      player:add_gamemoney_bind(700000);
	  player:add_vcoin_bind(450);
	  
      return;
  end

if funid == 2 and player:get_task_state(89) == 1 then
  player:set_task_state(89,2);
  player:set_task_state(90,1);  
  player:push_task_data(90,1);
  player:add_exp(100000);
  player:add_gamemoney_bind(100000);
  return;
 end

end