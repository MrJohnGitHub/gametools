function map_8(event,gameobject,player)

end

function map_10(event,gameobject,player)
	if gameobject:GetEntry() == 19004 then
		if player:get_task_state(1) == 20 then
			if player:get_task_param(1,20) >= 0 then
				player:set_task_param(1,20,player:get_task_param(1,20)+1);
				player:find_road_goto(10,29,28,1005);
				player:set_task_state(1,25);
				player:push_task_data(1,1);
			end
		end
	end
end

function map_12(event,gameobject,player)

end

function map_19(event,gameobject,player)
	if gameobject:GetEntry() == 19027 then
		if player:get_task_state(2) == 215 then
			if player:get_task_param(2,215) >= 0 then
				player:set_task_param(2,215,player:get_task_param(2,215)+1);
				player:find_road_goto(19,79,56,1902);
				player:set_task_state(2,220);
				player:push_task_data(1,1);
			end
		end
	end
end

function map_29(event,gameobject,player)

end


function map_62(event,gameobject,player)
	-- if gameobject:GetEntry() == 19013 then
	-- 	player:add_gamemoney(100);
	-- 	player:alert(20,0,0,"开启宝箱获得：礼金 + 100");
	-- elseif gameobject:GetEntry() == 19019 then
	-- 	player:add_gamemoney(200);
	-- 	player:alert(20,0,0,"开启宝箱获得：礼金 + 200");
	-- elseif gameobject:GetEntry() == 19020 then
	-- 	player:add_vcoin_bind(100);
	-- 	player:alert(20,0,0,"开启宝箱获得：绑定元宝 + 100");
	-- end
end

function map_65(event,gameobject,player)

end

function map_68(event,gameobject,player)

end