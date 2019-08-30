function mon5022(mon,event,player)
	if player:get_task_state(3) == 20 then
		if player:get_task_param(3,20) >= 0 then
			player:set_task_param(3,20,player:get_task_param(3,20) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(3,20).."/12");
			player:push_task_data(1,1);
		end
		if player:get_task_param(3,20) == 12 then
			player:find_road_goto(28,74,141,2801);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
			player:set_task_state(3,25);
			player:push_task_data(1,1);
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon5023(mon,event,player)
	if player:get_task_state(3) == 30 then
		if player:get_task_param(3,30) >= 0 then
			player:set_task_param(3,30,player:get_task_param(3,30) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(3,30).."/12");
			player:push_task_data(1,1);
		end
		if player:get_task_param(3,30) == 12 then
			player:find_road_goto(28,51,100,2802);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
			player:set_task_state(3,35);
			player:push_task_data(1,1);
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon5025(mon,event,player)
	if player:get_task_state(3) == 40 then
		if player:get_task_param(3,40) >= 0 then
			player:set_task_param(3,40,player:get_task_param(3,40) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(3,40).."/12");
			player:push_task_data(1,1);
		end
		if player:get_task_param(3,40) == 12 then
			player:set_task_state(3,45);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(28,19,110,2803);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon5026(mon,event,player)
	if player:get_task_state(3) == 50 then
		if player:get_task_param(3,50) >= 0 then
			player:set_task_param(3,50,player:get_task_param(3,50) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(3,50).."/12");
			player:push_task_data(1,1);
		end
		if player:get_task_param(3,50) == 12 then
			player:set_task_state(3,55);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(28,59,58,2804);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon5027(mon,event,player)
	if player:get_task_state(3) == 60 then
		if player:get_task_param(3,60) >= 0 then
			player:set_task_param(3,60,player:get_task_param(3,60) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(3,60).."/12");
			player:push_task_data(1,1);
		end
		if player:get_task_param(3,60) == 12 then
			player:set_task_state(3,65);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(28,33,85,2805);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon5029(mon,event,player)
	if player:get_task_state(3) == 70 then
		if player:get_task_param(3,70) >= 0 then
			player:set_task_param(3,70,player:get_task_param(3,70) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(3,70).."/1");
			player:push_task_data(1,1);
		end
		if player:get_task_param(3,70) == 1 then
			player:set_task_state(3,75);
			player:push_task_data(1,1);
			-- player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local map = player:GetMapId();
	if map == 137 or map == 138 or map == 139 or map == 140 or map == 111 or map == 114 then
		if player:get_param(286) == 0 then
			player:set_param(286,player:get_param(286) + 1);
			local obj = {};
			obj.bosscount5 = player:get_param(286);
			player:SendPacketToSelf(1816,0,encode(obj));
		end
		if player:num_monster(map) == 0 then
			player:gui_high_focus(8,3,30,250,"点击按钮领取奖励!");
			player:autofightstart(0,0,0);
		end
	end
end

function mon5078(mon,event,player)
	if player:get_param(285) == 0 then
		player:set_param(285,player:get_param(285) + 1);
		local obj = {};
		obj.bosscount3 = player:get_param(285);
		player:SendPacketToSelf(1816,0,encode(obj));
	end
	local map = player:GetMapId();
	if map == 137 or map == 138 or map == 139 or map == 140 or map == 111 or map == 114 then
		if player:num_monster(map) == 0 then
			player:gui_high_focus(8,3,30,250,"点击按钮领取奖励!");
			player:autofightstart(0,0,0);
		end
	end
end

