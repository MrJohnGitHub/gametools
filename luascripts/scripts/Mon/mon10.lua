function mon2001(mon,event,player)

end

function mon2002(mon,event,player)

end

function mon5045(mon,event,player)
	if player:get_task_state(1) == 6 then
		if player:get_task_param(1,6) >= 0 then
			player:set_task_param(1,6,player:get_task_param(1,6) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(1,6).."/2");
			player:push_task_data(1,1);
		end
		if player:get_task_param(1,6) == 2 then
			player:set_task_state(1,7);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(10,63,30,1013);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
end

function mon5001(mon,event,player)
	if player:get_task_state(1) == 10 then
		if player:get_task_param(1,10) >= 0 then
			player:set_task_param(1,10,player:get_task_param(1,10) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(1,10).."/2");
			player:push_task_data(1,1);
		end
		if player:get_task_param(1,10) == 2 then
			player:set_task_state(1,15);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(10,39,26,1004);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
end

function mon5002(mon,event,player)
	if player:get_task_state(1) == 30 then
		if player:get_task_param(1,30) >= 0 then
			player:set_task_param(1,30,player:get_task_param(1,30) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(1,30).."/3");
			player:push_task_data(1,1);
		end
		if player:get_task_param(1,30) == 3 then
			player:set_task_state(1,35);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(10,21,78,1006);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
end

function mon5003(mon,event,player)
	if player:get_task_state(1) == 40 then
		if player:get_task_param(1,40) >= 0 then
			player:set_task_param(1,40,player:get_task_param(1,40) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(1,40).."/3");
			player:push_task_data(1,1);
		end
		if player:get_task_param(1,40) == 3 then
			player:set_task_state(1,45);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(10,35,93,1007);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
end

function mon5004(mon,event,player)
	if player:get_task_state(1) == 60 then
		if player:get_task_param(1,60) >= 0 then
			player:set_task_param(1,60,player:get_task_param(1,60) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(1,60).."/3");
			player:push_task_data(1,1);
		end
		if player:get_task_param(1,60) == 3 then
			player:set_task_state(1,65);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(10,83,114,1008);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
end

function mon5005(mon,event,player)
	if player:get_task_state(1) == 70 then
		if player:get_task_param(1,70) >= 0 then
			player:set_task_param(1,70,player:get_task_param(1,70) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(1,70).."/5");
			player:push_task_data(1,1);
		end
		if player:get_task_param(1,70) == 5 then
			player:set_task_state(1,75);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(10,67,130,1009);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
end


function mon5041(mon,event,player)
	if player:get_task_state(1) == 80 then
		if player:get_task_param(1,80) >= 0 then
			player:set_task_param(1,80,player:get_task_param(1,80) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(1,80).."/5");
			player:push_task_data(1,1);
		end
		if player:get_task_param(1,80) == 5 then
			player:set_task_state(1,85);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(10,49,130,1010);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
end