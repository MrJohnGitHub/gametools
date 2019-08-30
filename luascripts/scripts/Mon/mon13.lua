function mon2033(mon,event,player)
 
	 if player:get_task_state(27) == 1 then
        if player:get_task_param(27,1) < 10 then
            player:set_task_param(27,1,player:get_task_param(27,1) + 1);
         --   player:alert(111,0,0,"击杀目标数量："..player:get_task_param(30,1).."/5");
        end
        
        if player:get_task_param(27,1) == 10 then
            player:set_task_state(27,2);
        end
        player:push_task_data(27,1);
    end
end

function mon2034(mon,event,player)

end


function mon2035(mon,event,player)
 
	if player:get_task_state(28) == 1 then
        if player:get_task_param(28,1) < 15 then
            player:set_task_param(28,1,player:get_task_param(28,1) + 1);
       --     player:alert(111,0,0,"击杀目标数量："..player:get_task_param(32,1).."/5");
        end
        
        if player:get_task_param(28,1) == 15 then
            player:set_task_state(28,2);
        end
        player:push_task_data(28,1);
    end
	
end
