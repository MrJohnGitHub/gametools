function CreatureNpcFun1160(npc,event,player,funid)

	if funid == 2 then if player:get_task_state(17) == 2 then	
          player:set_task_state(18,1);  
          player:push_task_data(18,1);
          player:add_exp(100000);
          player:add_gamemoney_bind(25000); 
          local job = player:get_job();
          if job == 1 then 
          player:add_item(20803,1,1,0,0);
          elseif job == 2 then
          player:add_item(20824,1,1,0,0);
          else 
          player:add_item(20845,1,1,0,0);  
          end           
          return;
       end  
    end
  
  if funid == 2 and player:get_task_state(24) == 1 then
  	  player:set_task_state(24,2);
      player:set_task_state(25,1);  
      player:push_task_data(25,1);
      player:add_exp(200000);
      player:add_gamemoney_bind(55000);	
	  player:add_item(10233,50,0,0,0);	
      return;
  end  

  if funid == 2 and player:get_task_state(42) == 2 then	
      player:set_task_state(43,1);  
      player:push_task_data(43,1);
      player:add_exp(1100000);
      player:add_gamemoney_bind(150000);
      return;
  end  

 if funid == 2 and player:get_task_state(57) == 1 then
     player:set_task_state(57,2);  
     player:set_task_state(58,1);  
     player:push_task_data(58,1);
     player:add_exp(3000000);
     player:add_gamemoney_bind(300000);
     return;
 end

if funid == 2 and player:get_task_state(81) == 1 then
  player:set_task_state(81,2);
  player:set_task_state(82,1);  
  player:push_task_data(82,1);
  player:add_exp(100000);
  player:add_gamemoney_bind(650000);
      local sum = player:Equipment_Num(0,0,4);
      if sum >= 1 then
      player:set_task_state(82,2);  
      else
      player:set_task_param(82,1,sum);
      end  
      player:push_task_data(82,1);     
  return;
 end


end