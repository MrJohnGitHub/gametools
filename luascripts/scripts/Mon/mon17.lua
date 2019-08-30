function mon2043(mon,event,player)

end

function mon2044(mon,event,player)

	 if player:get_task_state(41) == 1 then
        if player:get_task_param(41,1) < 15 then
            player:set_task_param(41,1,player:get_task_param(41,1) + 1);
      --      player:alert(111,0,0,"击杀目标数量："..player:get_task_param(46,1).."/15");
        end
        if player:get_task_param(41,1) == 15 then
            player:set_task_state(41,2);
        end
        player:push_task_data(41,1);
    end
	
end

function mon5047(mon,event,player)
	if player:get_task_state(3) == 95 then
		if player:get_task_param(3,95) >= 0 then
			player:set_task_param(3,95,player:get_task_param(3,95) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(3,95).."/5");
			player:push_task_data(1,1);
		end
		if player:get_task_param(3,95) == 5 then
			player:set_task_state(3,96);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:autofightstart(112,28,39);
		end
	end
end


function mon5037(mon,event,player)
	-- if player:get_task_state(3) == 205 then
	-- 	if player:get_task_param(3,205) >= 0 then
	-- 		player:set_task_param(3,205,player:get_task_param(3,205) + 1);
	-- 		player:push_task_data(1,1);
	-- 	end
	-- 	if player:get_task_param(3,205) == 4 then
	-- 		player:set_task_state(3,210);
	-- 		player:push_task_data(1,1);
	-- 		player:autofightstart(0,0,0);
	-- 		player:find_road_goto(112,86,91,11201);
	-- 		player:gui_high_focus(1,3,30,35,"点击npc寻路");
	-- 	end
	-- end
end

function mon5038(mon,event,player)
	-- if player:get_task_state(3) == 205 then
	-- 	if player:get_task_param(3,205) >= 0 then
	-- 		player:set_task_param(3,205,player:get_task_param(3,205) + 1);
	-- 		player:push_task_data(1,1);
	-- 	end
	-- 	if player:get_task_param(3,205) == 4 then
	-- 		player:set_task_state(3,210);
	-- 		player:push_task_data(1,1);
	-- 		player:autofightstart(0,0,0);
	-- 		player:find_road_goto(112,86,91,11201);
	-- 		player:gui_high_focus(1,3,30,35,"点击npc寻路");
	-- 	end
	-- end
end

function mon5039(mon,event,player)
	-- if player:get_task_state(3) == 205 then
	-- 	if player:get_task_param(3,205) >= 0 then
	-- 		player:set_task_param(3,205,player:get_task_param(3,205) + 1);
	-- 		player:push_task_data(1,1);
	-- 	end
	-- 	if player:get_task_param(3,205) == 4 then
	-- 		player:set_task_state(3,210);
	-- 		player:push_task_data(1,1);
	-- 		player:autofightstart(0,0,0);
	-- 		player:find_road_goto(112,86,91,11201);
	-- 		player:gui_high_focus(1,3,30,35,"点击npc寻路");
	-- 	end
	-- end
end

function mon5040(mon,event,player)
	if player:get_task_state(3) == 96 then
		if player:get_task_param(3,96) >= 0 then
			player:set_task_param(3,96,player:get_task_param(3,96) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(3,96).."/1");
			player:push_task_data(1,1);
		end
		if player:get_task_param(3,96) == 1 then
			player:set_task_state(3,100);
			player:push_task_data(1,1);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
end