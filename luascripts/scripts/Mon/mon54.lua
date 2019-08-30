function mon4112(mon,event,player)
	if player:get_task_state(4) == 120 then
		if player:get_task_param(4,120) >= 0 then
			player:set_task_param(4,120,player:get_task_param(4,120) + 1);
			player:push_task_data(4,1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(4,120).."/50");
		end
		if player:get_task_param(4,120) == 50 then
			player:set_task_state(4,125);
			player:push_task_data(4,1);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon4111(mon,event,player)
	if player:get_task_state(4) == 140 then
		if player:get_task_param(4,140) >= 0 then
			player:set_task_param(4,140,player:get_task_param(4,140) + 1);
			player:push_task_data(4,1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(4,140).."/50");
		end
		if player:get_task_param(4,140) == 50 then
			player:set_task_state(4,145);
			player:push_task_data(4,1);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon4113(mon,event,player)
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon4114(mon,event,player)
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end