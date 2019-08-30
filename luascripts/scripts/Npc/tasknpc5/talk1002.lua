
function CreatureNpcFun1002(npc,event,player,funid)
	  if funid == 2 and player:get_task_state(2) == 1 then
		  player:set_task_state(2,2); 		
		  player:set_task_state(3,1);  
		  player:push_task_data(3,1);
		  player:add_exp(1500);
		  player:add_gamemoney_bind(1000);
	      local job = player:get_job();
	      local sex = player:GetGender();	
		  if job == 1 and sex ==1 then
			player:add_item(20301,1,1,0,0);
		  elseif job ==1 and sex ==2 then
			player:add_item(20364,1,1,0,0);
		  elseif job ==2 and sex ==1 then 
			player:add_item(20322,1,1,0,0);
		  elseif job ==2 and sex ==2 then
			player:add_item(20385,1,1,0,0);
		  elseif job == 3 and sex == 1 then 
			player:add_item(20343,1,1,0,0);
	  	  else
			player:add_item(22207,1,1,0,0);
		  end			  

		  return;
	  end
end
	