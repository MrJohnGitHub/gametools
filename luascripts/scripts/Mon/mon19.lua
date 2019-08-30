function mon5017(mon,event,player)
	if player:get_task_state(2) == 185 then
		if player:get_task_param(2,185) >= 0 then
			player:set_task_param(2,185,player:get_task_param(2,185) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,185).."/8");
			player:push_task_data(1,1);
		end
		if player:get_task_param(2,185) == 8 then
			player:set_task_state(2,190);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(19,73,142,1903);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
end

function mon5018(mon,event,player)
	if player:get_task_state(2) == 195 then
		if player:get_task_param(2,195) >= 0 then
			player:set_task_param(2,195,player:get_task_param(2,195) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,195).."/10");
			player:push_task_data(1,1);
		end
		if player:get_task_param(2,195) == 10 then
			player:set_task_state(2,200);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(19,68,102,1901);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
end


function mon5020(mon,event,player)
	if player:get_task_state(2) == 205 then
		if player:get_task_param(2,205) >= 0 then
			player:set_task_param(2,205,player:get_task_param(2,205) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,205).."/10");
			player:push_task_data(1,1);
		end
		if player:get_task_param(2,205) == 10 then
			player:find_road_goto(19,79,56,1902);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
			player:set_task_state(2,210);
			player:push_task_data(1,1);
		end
	end
end

function mon5021(mon,event,player)
	if player:get_task_state(2) == 225 then
		if player:get_task_param(2,225) >= 0 then
			player:set_task_param(2,225,player:get_task_param(2,225) + 1);
	--		player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,225).."/10");
			player:push_task_data(1,1);
		end
		if player:get_task_param(2,225) == 10 then
			player:find_road_goto(19,46,43,1904);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
			player:set_task_state(2,230);
			player:push_task_data(1,1);
		end
	end
end

function mon5024(mon,event,player)
	if player:get_task_state(2) == 235 then
		if player:get_task_param(2,235) >= 0 then
			player:set_task_param(2,235,player:get_task_param(2,235) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,235).."/1");
			player:push_task_data(1,1);
		end
		if player:get_task_param(2,235) == 1 then
			player:set_task_state(2,240);
			player:set_task_state(3,1);
			player:push_task_data(1,1);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
end