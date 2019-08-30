function mon8727(mon,event,player)
	if player:get_task_state(4) == 5 then
		if player:get_task_param(4,5) >= 0 then
			player:set_task_param(4,5,player:get_task_param(4,5) + 1);
			player:push_task_data(4,1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(4,5).."/50");
		end
		if player:get_task_param(4,5) == 50 then
			player:set_task_state(4,25);
			player:push_task_data(4,1);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
end

function mon5104(mon,event,player)
	if player:get_task_state(4) == 26 then
		if player:get_task_param(4,26) >= 0 then
			player:set_task_param(4,26,player:get_task_param(4,26) + 1);
			player:push_task_data(4,1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(4,26).."/1");
		end
		if player:get_task_param(4,26) == 1 then
			player:set_task_state(4,27);
			player:push_task_data(4,1);
			player:gui_high_focus(1,3,30,35,"点击继续任务");
		end
	end
end