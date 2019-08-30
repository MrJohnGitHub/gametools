function DialyNPC(npc,event,player,funid,type)
	local tasknum = 10;							--任务还数
	local todalnum = player:get_param(244);
	if todalnum >= tasknum then
		return;
	end
	if type > 3 then
		return;
	end
	local task_states = player:get_task_state(243); 
	if funid == 1 and task_states == 0 then
		player:set_task_state(243,1);
		player:push_task_data(243,2);	
		return;
	end
	if funid == 2 and task_states == 2 then
		local needgold = 0;
		if type == 2 then
			needgold = 1000000;
		elseif type == 3 then
			needgold = 2500000;
		end
		if needgold > 0 then
			if player:get_gamemoney_bind() < needgold then
				player:alert(10,0,0,"绑定金币不足");
				return;
			end
			player:sub_gamemoney_bind(needgold);
		end
		
		local index = player:get_param(243);
		local t = math.floor(index / 100);
		local p = index % 100;
		local taskid = g_daily_tasktb[243][t][1][p];
		player:AddGuildDoneteValue(g_daily_num[taskid][2]*type);
		player:add_exp(g_daily_num[taskid][3]*type);
		player:add_vcoin_bind(g_daily_num[taskid][4]*type);
		AddGuildGiftActivityParamCount(player);
		
		player:set_param(244,todalnum + 1);
		player:set_task_state(243,3);
		player:push_task_data(243,2);		
		player:set_param(243,0);
		player:set_task_param(243,1,0);
		if todalnum + 1 < tasknum then
			player:set_task_state(243,0);	
			player:push_task_data(243,2);
		end	
		return;
	end
end