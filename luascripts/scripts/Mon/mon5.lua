function mon2005(mon,event,player)
			
    if player:get_task_state(3) == 1 then
        if player:get_task_param(3,1) < 1 then		
            player:set_task_param(3,1,player:get_task_param(3,1) + 1);
            --player:alert(2,0,0,"击杀目标数量："..player:get_task_param(1,1).."/1");
        end
        if player:get_task_param(3,1) == 1 then
            player:set_task_state(3,2);
        end
        player:push_task_data(3,1);
        return;
    end
    
end

function mon2006(mon,event,player)
    if player:get_task_state(18) == 1 then
        if player:get_task_param(18,1) < 5 then
            player:set_task_param(18,1,player:get_task_param(18,1) + 1);
            --      player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,1).."/2");
        end
        if player:get_task_param(18,1) == 5 then
            player:set_task_state(18,2);
        end
        player:push_task_data(18,1);
        return;
    end
    

end


function mon2020(mon,event,player)   
    if player:get_task_state(55) == 2 then
        return;
    end
    if player:get_task_state(55) == 1 then
        if player:get_task_param(55,1) < 20 then
            player:set_task_param(55,1,player:get_task_param(55,1) + 1);
            --      player:alert(111,0,0,"击杀目标数量："..player:get_task_param(3,1).."/3");
        end
        if player:get_task_param(55,1) == 20 then
            player:set_task_state(55,2);
        end
        player:push_task_data(55,1);
        return;
    end
    


end

function mon2021(mon,event,player)
	  if player:get_task_state(17) == 1 then
        if player:get_task_param(17,1) < 5 then
            player:set_task_param(17,1,player:get_task_param(17,1) + 1);
            --      player:alert(111,0,0,"击杀目标数量："..player:get_task_param(5,1).."/3");
        end
        if player:get_task_param(17,1) == 5 then
            player:set_task_state(17,2);
        end
        player:push_task_data(17,1);
    end  
   
	 
end


function mon2022(mon,event,player)
    
    if player:get_task_state(10) == 1 then
        if player:get_task_param(10,1) < 3 then
            player:set_task_param(10,1,player:get_task_param(10,1) + 1);
            --      player:alert(111,0,0,"击杀目标数量："..player:get_task_param(5,1).."/3");
        end
        if player:get_task_param(10,1) == 3 then
            player:set_task_state(10,2);
        end
        player:push_task_data(10,1);
    end    
end


function mon2023(mon,event,player)

    
    if player:get_task_state(12) == 1 then
        if player:get_task_param(12,1) < 5 then
            player:set_task_param(12,1,player:get_task_param(12,1) + 1);
            --       player:alert(111,0,0,"击杀目标数量："..player:get_task_param(6,1).."/3");
        end
        if player:get_task_param(12,1) == 5 then
            player:set_task_state(12,2);
        end
        player:push_task_data(12,1);
    end   
end


function mon2024(mon,event,player)

    
    if player:get_task_state(13) == 1 then
        if player:get_task_param(13,1) < 5 then
            player:set_task_param(13,1,player:get_task_param(13,1) + 1);
            --       player:alert(111,0,0,"击杀目标数量："..player:get_task_param(7,1).."/3");
        end
        if player:get_task_param(13,1) == 5 then
            player:set_task_state(13,2);
        end
        player:push_task_data(13,1);
    end    
end

function mon2025(mon,event,player)
    
   
    if player:get_task_state(10) == 1 then
        if player:get_task_param(10,1) < 5 then
            player:set_task_param(10,1,player:get_task_param(10,1) + 1);
            --        player:alert(111,0,0,"击杀目标数量："..player:get_task_param(8,1).."/3");
        end
        if player:get_task_param(10,1) == 5 then
            player:set_task_state(10,2);
        end
        player:push_task_data(10,1);
    end   
end

function mon2026(mon,event,player)
 
end

function mon2027(mon,event,player)
    
    if player:get_task_state(4) == 1 then
        if player:get_task_param(4,1) < 2 then
            player:set_task_param(4,1,player:get_task_param(4,1) + 1);
            --       player:alert(111,0,0,"击杀目标数量："..player:get_task_param(10,1).."/5");
        end
        if player:get_task_param(4,1) == 2 then
            player:set_task_state(4,2);
        end
        player:push_task_data(4,1);
    end 
end

function mon2028(mon,event,player)
    
    if player:get_task_state(42) == 1 then
        if player:get_task_param(42,1) < 15 then
            player:set_task_param(42,1,player:get_task_param(42,1) + 1);
            --     player:alert(111,0,0,"击杀目标数量："..player:get_task_param(37,1).."/1");
        end
        
        if player:get_task_param(42,1) == 15 then
            player:set_task_state(42,2);
        end
        player:push_task_data(42,1);
    end
    

end

function mon2029(mon,event,player)
if player:get_task_state(11) == 1 then
		if player:get_task_param(11,1) < 3 then
		   player:set_task_param(11,1,player:get_task_param(11,1) + 1);
  --       player:alert(111,0,0,"击杀目标数量："..player:get_task_param(14,1).."/5");
		end
		if player:get_task_param(11,1) == 3 then
		   player:set_task_state(11,2);
		end
		   player:push_task_data(11,1);
	end   
end

function mon2030(mon,event,player)
	if player:get_task_state(45) == 1 then
		if player:get_task_param(45,1) < 15 then
		   player:set_task_param(45,1,player:get_task_param(45,1) + 1);
  --       player:alert(111,0,0,"击杀目标数量："..player:get_task_param(14,1).."/5");
		end
		if player:get_task_param(45,1) == 15 then
		   player:set_task_state(45,2);
		end
		   player:push_task_data(45,1);
	end   

end

function mon2046(mon,event,player)
   if player:get_task_state(34) == 1 then
        if player:get_task_param(34,1) < 1 then
            player:set_task_param(34,1,player:get_task_param(34,1) + 1);
--            --       player:alert(111,0,0,"击杀目标数量："..player:get_task_param(15,1).."/1");
        end
        if player:get_task_param(34,1) == 1 then
            player:set_task_state(34,2);

        end
			player:push_task_data(34,1);
    end
    
end

function mon2032(mon,event,player)
   if player:get_task_state(15) == 1 then
        if player:get_task_param(15,1) < 1 then
            player:set_task_param(15,1,player:get_task_param(15,1) + 1);
--            --       player:alert(111,0,0,"击杀目标数量："..player:get_task_param(15,1).."/1");
        end
        if player:get_task_param(15,1) == 1 then
            player:set_task_state(15,2);

        end
			player:push_task_data(15,1);
    end
    
end

function mon2289(mon,event,player)

    if player:get_task_state(32) == 1 then
        if player:get_task_param(32,1) < 15 then
            player:set_task_param(32,1,player:get_task_param(32,1) + 1);
            --       player:alert(111,0,0,"击杀目标数量："..player:get_task_param(14,1).."/5");
        end
        if player:get_task_param(32,1) == 15 then
            player:set_task_state(32,2);
        end
        player:push_task_data(32,1);
    end   
end

function mon2290(mon,event,player)

    if player:get_task_state(33) == 1 then
        if player:get_task_param(33,1) < 15 then
            player:set_task_param(33,1,player:get_task_param(33,1) + 1);
            --       player:alert(111,0,0,"击杀目标数量："..player:get_task_param(14,1).."/5");
        end
        if player:get_task_param(33,1) == 15 then
            player:set_task_state(33,2);
        end
        player:push_task_data(33,1);
    end   
end

function mon2031(mon,event,player)
  if player:get_task_state(16) == 1 then
        if player:get_task_param(16,1) < 5 then
            player:set_task_param(16,1,player:get_task_param(16,1) + 1);
            --      player:alert(111,0,0,"击杀目标数量："..player:get_task_param(5,1).."/3");
        end
        if player:get_task_param(16,1) == 5 then
            player:set_task_state(16,2);
        end
        player:push_task_data(16,1);
    end    
end

function mon2291(mon,event,player)
   if player:get_task_state(5) == 1 then
        if player:get_task_param(5,1) < 2 then
            player:set_task_param(5,1,player:get_task_param(5,1) + 1);
            --player:alert(2,0,0,"击杀目标数量："..player:get_task_param(1,1).."/1");
        end
        if player:get_task_param(5,1) == 2 then
            player:set_task_state(5,2);
        end
        player:push_task_data(5,1);
        return;
    end
  end  

  function mon2292(mon,event,player)
   if player:get_task_state(20) == 1 then
        if player:get_task_param(20,1) < 10 then
            player:set_task_param(20,1,player:get_task_param(20,1) + 1);
            --player:alert(2,0,0,"击杀目标数量："..player:get_task_param(1,1).."/1");
        end
        if player:get_task_param(20,1) == 10 then
            player:set_task_state(20,2);
        end
        player:push_task_data(20,1);
        return;
    end
  end
  
function mon2317(mon,event,player)
	local tasktb = {{121,30},{124,30},{126,30},{128,30}};	--支线任务
	
	local nowtask = player:get_param(207);
	for i=1,#tasktb do
		if nowtask == tasktb[i][1] and player:get_task_state(tasktb[i][1]) == 1 then
			local nownum = player:get_task_param(tasktb[i][1],1) + 1;
	        if nownum < tasktb[i][2] then
	            player:set_task_param(tasktb[i][1],1,nownum);
	        else
	        	player:set_task_state(tasktb[i][1],2);
	        end
	
	        SendUpdateTrackPanel_1(player,tasktb[i][1]);
	        break;   
	    end
    end
    
    DialyKillTask(player,2317,243);	--公会日常任务
end

function mon3011(mon,event,player) 
    DialyKillTask(player,3011,243);
end