function CreatureNpcFun1126(npc,event,player,funid)	
--[[
  if funid == 2 and player:get_task_state(62) == 2 then
      player:set_task_state(63,1);  
      player:push_task_data(63,1);
    player:add_gamemoney_bind(350000);
    player:add_exp(2000000);
    local fentian = player:get_param(232);
    if fentian >= 1 then
      player:set_task_state(63,2);
      player:push_task_data(63,1);
    else
      player:set_task_param(63,1,fentian);
        player:push_task_data(63,1);
    end
 
      return;
  end
]]

  if funid == 2 and player:get_task_state(77) == 1 then
  player:set_task_state(77,2);
  player:set_task_state(78,1);  
  player:push_task_data(78,1);
  player:add_exp(100000);
  player:add_gamemoney_bind(550000);
      local sum = player:Equipment_Num(0,0,3);
      if sum >= 1 then
      player:set_task_state(78,2);  
      else
      player:set_task_param(78,1,sum);
      end  
      player:push_task_data(78,1);      
  return;
 end	

if funid == 2 and player:get_task_state(94) == 1 then
	  player:set_task_state(94,2);
      player:set_task_state(95,1);  
      local yb = player:get_vcoin_bind() - player:get_vcoin();
      if yb < 700 then
      	player:set_task_param(95,1,yb);
      	player:push_task_data(95,1);
      else
      	player:set_task_state(95,2);
        player:push_task_data(95,1);
      end     
      player:add_exp(100000);
      player:add_gamemoney_bind(100000);
      return;
  end

 if funid == 2 and player:get_task_state(103) == 1 then
      player:set_task_state(103,2);
      player:set_task_state(104,1);  
      player:push_task_data(104,1);
      player:add_exp(100000);
      player:add_gamemoney_bind(100000);          
      local sum = player:Equipment_Num(0,60,0);
      if sum >= 6 then
      player:set_task_state(104,2);  
      else
      player:set_task_param(104,1,sum);
      end  
      player:push_task_data(104,1);   
  return;
 end
  
  if funid == 2 and player:get_task_state(69) == 1 then
  player:set_task_state(69,2);
  player:set_task_state(70,1);  
  player:push_task_data(70,1);
  player:add_exp(100000);
  player:add_gamemoney_bind(450000);
      local sum = player:Equipment_Num(0,50,0);
      if sum >= 3 then
      player:set_task_state(70,2);  
      else
      player:set_task_param(70,1,sum);
      end  
      player:push_task_data(70,1);   
  return;
 end

end