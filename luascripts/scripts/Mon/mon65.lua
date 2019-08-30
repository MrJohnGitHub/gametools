function mon6500(mon,event,player)
	if player:get_task_state(102) == 1 then
		if player:get_param(298) == 1 then
			player:set_param(297,player:get_param(297) + 1);
			player:push_task_data(1,1);
			player:alert(111,0,0,"击杀恶僧"..player:get_param(297).."/"..player:get_param(306));
			if player:get_param(297) >= player:get_param(306) then
				player:set_task_state(102,2);
				player:push_task_data(1,1);
				player:alert(19,0,0,"您已经完成了任务");
			end
		end
	end
end

function mon6501(mon,event,player)
	if player:get_task_state(102) == 1 then
		if player:get_param(298) == 2 then
			player:set_param(297,player:get_param(297) + 1);
			player:push_task_data(1,1);
			player:alert(111,0,0,"击杀独行大盗"..player:get_param(297).."/"..player:get_param(306));
			if player:get_param(297) >= player:get_param(306) then
				player:set_task_state(102,2);
				player:push_task_data(1,1);
				player:alert(19,0,0,"您已经完成了任务");
			end
		end
	end
end

function mon6502(mon,event,player)
	if player:get_task_state(102) == 1 then
		if player:get_param(298) == 3 then
			player:set_param(297,player:get_param(297) + 1);
			player:push_task_data(1,1);
			player:alert(111,0,0,"击杀深渊恶魔"..player:get_param(297).."/"..player:get_param(306));
			if player:get_param(297) >= player:get_param(306) then
				player:set_task_state(102,2);
				player:push_task_data(1,1);
				player:alert(19,0,0,"您已经完成了任务");
			end
		end
	end
end

function mon6503(mon,event,player)
	if player:get_task_state(102) == 1 then
		if player:get_param(298) == 4 then
			player:set_param(297,player:get_param(297) + 1);
			player:push_task_data(1,1);
			player:alert(111,0,0,"击杀野猪妖"..player:get_param(297).."/"..player:get_param(306));
			if player:get_param(297) >= player:get_param(306) then
				player:set_task_state(102,2);
				player:push_task_data(1,1);
				player:alert(19,0,0,"您已经完成了任务");
			end
		end
	end
end

function mon6504(mon,event,player)
	if player:get_task_state(102) == 1 then
		if player:get_param(298) == 5 then
			player:set_param(297,player:get_param(297) + 1);
			player:push_task_data(1,1);
			player:alert(111,0,0,"击杀狂僧"..player:get_param(297).."/"..player:get_param(306));
			if player:get_param(297) >= player:get_param(306) then
				player:set_task_state(102,2);
				player:push_task_data(1,1);
				player:alert(19,0,0,"您已经完成了任务");
			end
		end
	end
end
