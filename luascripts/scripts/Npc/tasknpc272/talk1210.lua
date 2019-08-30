function CreatureNpcFun1210(npc,event,player,funid)	
	if funid == 2 and player:get_task_state(75) == 1 then
	  	player:set_task_state(75,2);	
	  	player:set_task_state(76,1); 
	  	player:add_gamemoney_bind(550000);
	  	player:add_exp(100000);
		local yb = player:get_vcoin_bind() - player:get_vcoin();
		if yb < 500 then
			player:set_task_param(76,1,yb);
			player:push_task_data(76,1);
		else
			player:set_task_state(76,2);
			player:push_task_data(76,1);
		end     
	    return;
  	end

	if funid == 2 and player:get_task_state(61) == 2 then
 		player:add_exp(100000);
  		player:add_gamemoney_bind(350000);
 
		local sum = player:get_task_param(62,1);
  		if sum >= 1 then
  			player:set_task_state(62,2);  
  		else
 	 		player:set_task_state(62,1);
 		end  
 		player:push_task_data(62,1);    
  		return;
  	end
end