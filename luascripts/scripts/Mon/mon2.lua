function mon5011(mon,event,player)
	if player:get_task_state(2) == 110 then
		if player:get_task_param(2,110) >= 0 then
			player:set_task_param(2,110,player:get_task_param(2,110) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,110).."/5");
			player:push_task_data(1,1);
		end
		if player:get_task_param(2,110) == 5 then
			player:set_task_state(2,115);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(2,69,109,201);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon5012(mon,event,player)
	if player:get_task_state(2) == 120 then
		if player:get_task_param(2,120) >= 0 then
			player:set_task_param(2,120,player:get_task_param(2,120) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,120).."/8");
			player:push_task_data(1,1);
		end
		if player:get_task_param(2,120) == 8 then
			player:set_task_state(2,125);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(2,98,86,202);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon5013(mon,event,player)
	if player:get_task_state(2) == 130 then
		if player:get_task_param(2,130) >= 0 then
			player:set_task_param(2,130,player:get_task_param(2,130) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,130).."/8");
			player:push_task_data(1,1);
		end
		if player:get_task_param(2,130) == 8 then
			player:set_task_state(2,135);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(2,69,57,203);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end


function mon5015(mon,event,player)
	if player:get_task_state(2) == 140 then
		if player:get_task_param(2,140) >= 0 then
			player:set_task_param(2,140,player:get_task_param(2,140) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,140).."/8");
			player:push_task_data(1,1);
		end
		if player:get_task_param(2,140) == 8 then
			player:set_task_state(2,145);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(2,44,58,204);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon5016(mon,event,player)
	if player:get_task_state(2) == 150 then
		if player:get_task_param(2,150) >= 0 then
			player:set_task_param(2,150,player:get_task_param(2,150) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,150).."/10");
			player:push_task_data(1,1);
		end
		if player:get_task_param(2,150) == 10 then
			player:set_task_state(2,155);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(2,44,58,204);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end


function mon5019(mon,event,player)
	if player:get_task_state(2) == 160 then
		if player:get_task_param(2,160) >= 0 then
			player:set_task_param(2,160,player:get_task_param(2,160) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,160).."/1");
			player:push_task_data(1,1);
		end
		if player:get_task_param(2,160) == 1 then
			player:set_task_state(2,165);
			player:push_task_data(1,1);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end