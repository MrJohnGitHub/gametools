function CreatureNpcFun1119(npc,event,player,funid)
	if funid == 2 then 
	  	if player:get_task_state(74) == 2 then
	    	player:set_task_state(75,1);  
	      	player:push_task_data(75,1);
	      	player:add_gamemoney_bind(600000);
	      	player:add_exp(5000000);
			player:add_item(12015,1,1,0,0); 
	      	return;
	  	end

	if funid == 2 and player:get_task_state(85) == 1 then
      player:set_task_state(85,2);   
      player:set_task_state(86,1);  
      player:push_task_data(86,1);
      player:add_exp(100000);
      player:add_gamemoney_bind(700000);
      return;
  end	
		
	 	if player:get_task_state(112) == 2 then
	      	player:set_task_state(112,3);  
	     	player:push_task_data(112,1);
		    player:add_exp(100000);
		    player:add_gamemoney_bind(100000);
			player:add_vcoin_bind(2000); 			
		    return;
	  	end
		
	  	if player:get_task_state(113) == 2 then
	  		player:set_task_state(113,3);  
	     	player:push_task_data(113,0);   
			player:add_vcoin_bind(50); 
	     	 	
	     	local fentian = player:get_param(232);
			if fentian >= 1 then
				player:set_task_state(114,2);
			  	player:push_task_data(114,0);
			else
				player:set_task_state(114,1);
			  	player:set_task_param(114,1,fentian);			    
				player:push_task_data(114,0);
			end
	  		return;
	  	end
		
		if player:get_task_state(114) == 2 then
	  		player:set_task_state(114,3);  
	     	player:push_task_data(114,0);
	     	player:add_vcoin_bind(50); 
		    player:set_task_state(115,1);
			player:push_task_data(115,0);	
			player:add_item(10279,2,1,0,0); 	
	  		return;
	  	end
		
		if player:get_task_state(115) == 2 then
	  		player:set_task_state(115,3);  
	     	player:push_task_data(115,0);
	     	player:add_vcoin_bind(50); 
			player:add_item(10279,2,1,0,0); 
		    local fentian = player:get_param(232);
			if fentian >= 2 then
				player:set_task_state(116,2);
			  	player:push_task_data(116,0);
			else
				player:set_task_state(116,1);
			  	player:set_task_param(116,1,fentian);	    
				player:push_task_data(116,0);
			end 
	  		return;
	  	end
		
		if player:get_task_state(116) == 2 then
	  		player:set_task_state(116,3);  
	     	player:push_task_data(116,0);
	     	player:add_vcoin_bind(100);
			local sum = player:Equipment_Num(0,0,4);
			  if sum >= 1 then
			  player:set_task_state(117,2);  
			  player:push_task_data(117,0);
			  else
			  player:set_task_state(117,1);
			  player:set_task_param(117,1,sum); 
			  player:push_task_data(117,0);	
			end   
		  return;
		 end	
			
		
		if player:get_task_state(117) == 2 then
	  		player:set_task_state(117,3);  
	     	player:push_task_data(117,0);		
			player:add_vcoin_bind(200);
			local baoshi = player:GetNalchmyLevelByType(3);
				if baoshi >= 1 then
					player:set_task_state(118,2);
					player:push_task_data(118,0);
				else
					player:set_task_state(118,1);
					player:set_task_param(118,1,baoshi);
					player:push_task_data(118,0);
				end
	  		return;
	  	end
				
		
		if player:get_task_state(118) == 2 then
	  		player:set_task_state(118,3);  
	     	player:push_task_data(118,0);	
			player:add_vcoin_bind(150);
			if player:get_task_param(119,1) == 1 then
				player:set_task_state(119,2);
				player:push_task_data(119,0);
			else
				player:set_task_state(119,1);
				player:push_task_data(119,0);		
			end
	  		return;
	  	end
			
		
		if player:get_task_state(119) == 2 then
	  		player:set_task_state(119,3);  
	     	player:push_task_data(119,0);
			player:add_vcoin_bind(200); 
			local sum = player:Equipment_Num(0,0,5);
			  if sum >= 1 then
			  player:set_task_state(120,2);  
			  player:push_task_data(120,0);
			  else
			  player:set_task_state(120,1);
			  player:set_task_param(120,1,sum); 
			  player:push_task_data(120,0);	
			end   
		  return;
		 end						
		
		if player:get_task_state(120) == 2 then
	  		player:set_task_state(120,3);  
	     	player:push_task_data(120,0);
			player:add_exp(2000000);	
			player:set_task_state(121,1);
			player:push_task_data(121,0);
	  		return;
	  	end					
		
		if player:get_task_state(121) == 2 then
	  		player:set_task_state(121,3);  
	     	player:push_task_data(121,0);
			player:add_gamemoney_bind(10000000);
			local xieyu = player:GetNalchmyLevelByType(1);
				if xieyu >= 3 then
					player:set_task_state(122,2);
					player:push_task_data(122,0);
				else
					player:set_task_state(122,1);
					player:set_task_param(122,1,xieyu);
					player:push_task_data(122,0);
				end
	  		return;
	  	end					

		if player:get_task_state(122) == 2 then
	  		player:set_task_state(122,3);  
	     	player:push_task_data(122,0);	
			player:add_vcoin_bind(100);
			local sum = player:Equipment_Num(0,0,6);
			  if sum >= 1 then
			  player:set_task_state(123,2);  
			  player:push_task_data(123,0);
			  else
			  player:set_task_state(123,1);
			  player:set_task_param(123,1,sum); 
			  player:push_task_data(123,0);	
			end   
		  return;
		 end		
		
		if player:get_task_state(123) == 2 then
	  		player:set_task_state(123,3);  
	     	player:push_task_data(123,0);
			player:add_exp(3000000);
			player:set_task_state(124,1);
			player:push_task_data(124,0);
	  		return;
	  	end			
			
			
		if player:get_task_state(124) == 2 then
	  		player:set_task_state(124,3);  
	     	player:push_task_data(124,0);
			player:add_gamemoney_bind(10000000);
			local sum = player:Equipment_Num(0,0,7);
			  if sum >= 1 then
			  player:set_task_state(125,2);  
			  player:push_task_data(125,0);
			  else
			  player:set_task_state(125,1);
			  player:set_task_param(125,1,sum); 
			  player:push_task_data(125,0);	
			end   
		  return;
		 end						
			
				
		if player:get_task_state(125) == 2 then
	  		player:set_task_state(125,3);  
	     	player:push_task_data(125,0);
			player:add_exp(5000000);
			player:set_task_state(126,1);
			player:push_task_data(126,0);
	  		return;
	  	end				
				
		
		if player:get_task_state(126) == 2 then
	  		player:set_task_state(126,3);  
	     	player:push_task_data(126,0);
			player:add_gamemoney_bind(10000000);	
			local xieyu = player:GetNalchmyLevelByType(1);
				if xieyu >= 4 then
					player:set_task_state(127,2);
					player:push_task_data(127,0);
				else
					player:set_task_state(127,1);
					player:set_task_param(127,1,xieyu);
					player:push_task_data(127,0);
				end
	  		return;
	  	end			
				
		
		if player:get_task_state(127) == 2 then
	  		player:set_task_state(127,3);  
	     	player:push_task_data(127,0);
			player:add_vcoin_bind(100);
			player:set_task_state(128,1);
			player:push_task_data(128,0);
	  		return;
	  	end			
			
		
		if player:get_task_state(128) == 2 then
	  		player:set_task_state(128,3);  
	     	player:push_task_data(128,0);	
			player:add_gamemoney_bind(10000000);
			local fentian = player:get_param(232);
				if fentian >= 3 then
					player:set_task_state(129,2);
					player:push_task_data(129,0);
				else
					player:set_task_state(129,1);
					player:set_task_param(129,1,fentian);
					player:push_task_data(129,0);
				end
	  		return;
	  	end
			

		if player:get_task_state(129) == 2 then
	  		player:set_task_state(129,3);  
	     	player:push_task_data(129,0);
			player:add_vcoin_bind(100);
			local sum = player:Equipment_Num(0,0,8);
			  if sum >= 1 then
			  player:set_task_state(130,2);  
			  player:push_task_data(130,0);
			  else
			  player:set_task_state(130,1);
			  player:set_task_param(130,1,sum); 
			  player:push_task_data(130,0);	
			end   
		  return;
		 end		
		
		if player:get_task_state(130) == 2 then
	  		player:set_task_state(130,3);  
	     	player:push_task_data(130,0);
			player:add_exp(10000000);
			if player:get_task_param(131,1) >= 1 then
				player:set_task_state(131,2);
			else
				player:set_task_state(131,1);		
			end
			player:push_task_data(131,0);
	  		return;
	  	end
		
		if player:get_task_state(131) == 2 then
	  		player:set_task_state(131,3);  
	     	player:push_task_data(131,0);
	     	player:add_vcoin_bind(100);
			local baoshi = player:GetNalchmyLevelByType(3);
				if baoshi >= 2 then
					player:set_task_state(132,2);
					player:push_task_data(132,0);
				else
					player:set_task_state(132,1);
					player:set_task_param(132,1,baoshi);
					player:push_task_data(132,0);
				end
	  		return;
	  	end
			
		if player:get_task_state(132) == 2 then
	  		player:set_task_state(132,3);  
	     	player:push_task_data(132,0);
			player:add_vcoin_bind(100);
				local fentian = player:get_param(232);
				if fentian >= 4 then
					player:set_task_state(133,2);
					player:push_task_data(133,0);
				else
					player:set_task_state(133,1);
					player:set_task_param(133,1,fentian);
					player:push_task_data(133,0);
				end
	  		return;
	  	end
		
		if player:get_task_state(133) == 2 then
	  		player:set_task_state(133,3);  
	     	player:push_task_data(133,0);
			player:add_vcoin_bind(100);
	  		local hunzhu = player:GetNalchmyLevelByType(4);
				if hunzhu >= 1 then
					player:set_task_state(134,2);
					player:push_task_data(134,0);
				else
					player:set_task_state(134,1);
					player:set_task_param(134,1,hunzhu);
					player:push_task_data(134,0);
				end
	  		return;
	  	end
		
		if player:get_task_state(134) == 2 then
	  		player:set_task_state(134,3);  
	     	player:push_task_data(134,0);
			player:add_vcoin_bind(100);
			local xieyu = player:GetNalchmyLevelByType(1);
				if xieyu >= 5 then
					player:set_task_state(135,2);
					player:push_task_data(135,0);
				else
					player:set_task_state(135,1);
					player:set_task_param(135,1,xieyu);
					player:push_task_data(135,0);
				end
	  		return;
	  	end			
		
		if player:get_task_state(135) == 2 then
	  		player:set_task_state(135,3);  
	     	player:push_task_data(135,0);
	     	player:add_vcoin_bind(100);
				local chibang = player:get_param(351);
				if chibang >= 3 then
					player:set_task_state(136,2);
					player:push_task_data(136,0);
				else
					player:set_task_state(136,1);
					player:set_task_param(136,1,chibang);
					player:push_task_data(136,0);
				end
	  		return;
	  	end
		
		if player:get_task_state(136) == 2 then
	  		player:set_task_state(136,3);  
	     	player:push_task_data(136,0);
			player:add_vcoin_bind(100);
				local baoshi = player:GetNalchmyLevelByType(3);
				if baoshi >= 3 then
					player:set_task_state(137,2);
					player:push_task_data(137,0);
				else
					player:set_task_state(137,1);
					player:set_task_param(137,1,baoshi);
					player:push_task_data(137,0);
				end
	  		return;
	  	end
		
		if player:get_task_state(137) == 2 then
	  		player:set_task_state(137,3);  
	     	player:push_task_data(137,0);	
			player:add_vcoin_bind(100);
			if player:get_task_param(138,1) >= 3 then
				player:set_task_state(138,2);
			else
				player:set_task_state(138,1);		
			end
			player:push_task_data(138,0);
	  		return;
	  	end
		
		if player:get_task_state(138) == 2 then
	  		player:set_task_state(138,3);  
	     	player:push_task_data(138,0);
			player:add_vcoin_bind(100);
	  		local hunzhu = player:GetNalchmyLevelByType(4);
				if hunzhu >= 2 then
					player:set_task_state(139,2);
					player:push_task_data(139,0);
				else
					player:set_task_state(139,1);
					player:set_task_param(139,1,hunzhu);
					player:push_task_data(139,0);
				end
	  		return;
	  	end
		
		if player:get_task_state(139) == 2 then
	  		player:set_task_state(139,3);  
	     	player:push_task_data(139,0);
			player:add_vcoin_bind(100);
			local fentian = player:get_param(232);
				if fentian >= 9 then
					player:set_task_state(140,2);
					player:push_task_data(140,0);
				else
					player:set_task_state(140,1);
					player:set_task_param(140,1,fentian);
					player:push_task_data(140,0);
				end
	  		return;
	  	end
		
		if player:get_task_state(140) == 2 then
	  		player:set_task_state(140,3);  
	     	player:push_task_data(140,0);
	     	player:add_vcoin_bind(1000);
				local chibang = player:get_param(351);
				if chibang >= 4 then
					player:set_task_state(141,2);
					player:push_task_data(141,0);
				else
					player:set_task_state(141,1);
					player:set_task_param(141,1,chibang);
					player:push_task_data(141,0);
				end
	  		return;
	  	end
		
		if player:get_task_state(141) == 2 then
	  		player:set_task_state(141,3);  
	     	player:push_task_data(141,0);
			player:add_vcoin_bind(100);
				local baoshi = player:GetNalchmyLevelByType(3);
				if baoshi >= 4 then
					player:set_task_state(142,2);
					player:push_task_data(142,0);
				else
					player:set_task_state(142,1);
					player:set_task_param(142,1,baoshi);
					player:push_task_data(142,0);
				end
	  		return;
	  	end
		
		if player:get_task_state(142) == 2 then
	  		player:set_task_state(142,3);  
	     	player:push_task_data(142,0);
			player:add_vcoin_bind(100);
	  		local hunzhu = player:GetNalchmyLevelByType(4);
				if hunzhu >= 3 then
					player:set_task_state(143,2);
					player:push_task_data(143,0);
				else
					player:set_task_state(143,1);
					player:set_task_param(143,1,hunzhu);
					player:push_task_data(143,0);
				end
	  		return;
	  	end
		
		if player:get_task_state(143) == 2 then
	  		player:set_task_state(143,3);  
	     	player:push_task_data(143,0);	
			player:add_vcoin_bind(100);
	  		return;
	  	end
		
  	end
end