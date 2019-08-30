function mon2039(mon,event,player)

	if player:get_task_state(44) == 1 then
		if player:get_task_param(44,1) < 15 then
			player:set_task_param(44,1,player:get_task_param(44,1) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(39,1).."/10");
		end
		if player:get_task_param(44,1) == 15 then
			player:set_task_state(44,2);
		end
		player:push_task_data(44,1);
	end
	
end

function mon2040(mon,event,player)

	if player:get_task_state(43) == 1 then
        if player:get_task_param(43,1) < 15 then
            player:set_task_param(43,1,player:get_task_param(43,1) + 1);
        --    player:alert(111,0,0,"击杀目标数量："..player:get_task_param(40,1).."/10");
        end
        if player:get_task_param(43,1) == 15 then
            player:set_task_state(43,2);
        end
        player:push_task_data(43,1);
    end
	
end


function mon2041(mon,event,player)
    if player:get_task_state(29) == 1 then
        if player:get_task_param(29,1) < 15 then
            player:set_task_param(29,1,player:get_task_param(29,1) + 1);
       --     player:alert(111,0,0,"击杀目标数量："..player:get_task_param(41,1).."/10");
        end
        if player:get_task_param(29,1) == 15 then
            player:set_task_state(29,2);
        end
        player:push_task_data(29,1);
    end
	

end

function mon2042(mon,event,player)
    if player:get_task_state(31) == 1 then
        if player:get_task_param(31,1) < 15 then
            player:set_task_param(31,1,player:get_task_param(31,1) + 1);
      --      player:alert(111,0,0,"击杀目标数量："..player:get_task_param(42,1).."/10");
        end
        if player:get_task_param(31,1) == 15 then
            player:set_task_state(31,2);
        end
        player:push_task_data(31,1);
    end
	

end