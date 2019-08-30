function mon4121(mon,event,player)
	if player:get_task_state(4) == 160 then
		if player:get_task_param(4,160) >= 0 then
			player:set_task_param(4,160,player:get_task_param(4,160) + 1);
			player:push_task_data(4,1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(4,160).."/50");
		end
		if player:get_task_param(4,160) == 50 then
			player:set_task_state(4,165);
			player:push_task_data(4,1);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon4122(mon,event,player)
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon4123(mon,event,player)
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon4124(mon,event,player)
	if player:get_task_state(4) == 180 then
		if player:get_task_param(4,180) >= 0 then
			player:set_task_param(4,180,player:get_task_param(4,180) + 1);
			player:push_task_data(4,1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(4,180).."/50");
		end
		if player:get_task_param(4,180) == 50 then
			player:set_task_state(4,185);
			player:push_task_data(4,1);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end