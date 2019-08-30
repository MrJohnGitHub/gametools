function CreaturePanelFun(event,player,panelid,funid,player_type)
	 -- player:alert(2,0,0,"1触发"..panelid)
	 -- player:alert(2,0,0,"2触发"..funid)
	if panelid == 4 then
		if player:get_param(381) == 0 then
			player:alert(10,0,0,"你已领取过奖励，不要太贪心哦！");
			return;
		end
		local param384 = player:get_param(384);
		if param384 == 0 then
			local index = player:get_maze_rank();
			if index == 0 then
				index = 5;
			elseif index > 3 then
				index = 4;
			end
			local reward = g_mazereward[index];
			if reward ~= nil then
				local bag_num = 0;
				local itemcount = #reward["item"];
				if itemcount > 0 then
					for i=1,itemcount do
						if reward["item"][i][3] == 0 then
							bag_num = bag_num + reward["item"][i][2];
						else
							bag_num = bag_num + 1;
						end
					end				
					if player:num_bag_black() < bag_num then
						player:alert(21,0,0,"背包空间不足，请及时清理");
						return;
					end					
					for i=1,itemcount do
						player:add_item(reward["item"][i][1],reward["item"][i][2],1,0,0);
					end
				end
				if reward["jifen"] > 0 then
					player:set_param(510,player:get_param(510) + reward["jifen"],"活动奖励");
				end
				if reward["exp"] > 0 then
					player:add_exp(reward["exp"]);
				end
				if reward["bangjin"] > 0 then
					player:add_gamemoney_bind(reward["bangjin"]);
				end
				if reward["bangyuan"] > 0 then
					player:add_vcoin_bind(reward["bangyuan"]);
				end
				
				player:set_param(384,1);
				local obj = {};
				obj.ret = 1;
				player:SendPacketToSelf(2913,0,encode(obj));
				
				if index == 1 then
					g_broadcast(13,0,0,"玩家<font color='#00ccff'>"..player:GetName().."</font>傲视群雄，领取了极限挑战<font color='#0be140'>冠军奖励</font>，真是羡煞旁人！");
				elseif index == 2 then
					g_broadcast(13,0,0,"玩家<font color='#00ccff'>"..player:GetName().."</font>风驰电掣，领取了极限挑战<font color='#0be140'>亚军奖励</font>，真是羡煞旁人！");
				elseif index == 3 then		
					g_broadcast(13,0,0,"玩家<font color='#00ccff'>"..player:GetName().."</font>当仁不让，领取了极限挑战<font color='#0be140'>季军奖励</font>，真是羡煞旁人！");
				end
			end
		else
			player:alert(10,0,0,"你已领取过奖励，不要太贪心哦！");
		end
		return;
	end
	if panelid == 5 then
		if player:get_param(226) == 1 then
			player:alert(10,0,0,"你已领取过奖励，不要太贪心哦！");
			return;
		end
		local reward = g_mazereward["floor5"];
		if reward ~= nil then
			local bag_num = 0;
			local itemcount = #reward["item"];
			if itemcount > 0 then
				for i=1,itemcount do
					if reward["item"][i][3] == 0 then
						bag_num = bag_num + reward["item"][i][2];
					else
						bag_num = bag_num + 1;
					end
				end				
				if player:num_bag_black() < bag_num then
					player:alert(21,0,0,"背包空间不足，请及时清理");
					return;
				end					
				for i=1,itemcount do
					player:add_item(reward["item"][i][1],reward["item"][i][2],1,0,0);
				end
			end
			if reward["jifen"] > 0 then
				player:set_param(510,player:get_param(510) + reward["jifen"],"活动奖励");
			end
			if reward["exp"] > 0 then
				player:add_exp(reward["exp"]);
			end
			if reward["bangjin"] > 0 then
				player:add_gamemoney_bind(reward["bangjin"]);
			end
			if reward["bangyuan"] > 0 then
				player:add_vcoin_bind(reward["bangyuan"]);
			end			
			player:set_param(226,1);
			player:alert(10,0,0,"成功领取奖励！");
		end
		return;
	end
	if panelid == 6 then
		if player:get_param(227) == 1 then
			player:alert(10,0,0,"你已领取过奖励，不要太贪心哦！");
			return;
		end
		local reward = g_mazereward["floor10"];
		if reward ~= nil then
			local bag_num = 0;
			local itemcount = #reward["item"];
			if itemcount > 0 then
				for i=1,itemcount do
					if reward["item"][i][3] == 0 then
						bag_num = bag_num + reward["item"][i][2];
					else
						bag_num = bag_num + 1;
					end
				end				
				if player:num_bag_black() < bag_num then
					player:alert(21,0,0,"背包空间不足，请及时清理");
					return;
				end					
				for i=1,itemcount do
					player:add_item(reward["item"][i][1],reward["item"][i][2],1,0,0);
				end
			end
			if reward["jifen"] > 0 then
				player:set_param(510,player:get_param(510) + reward["jifen"],"活动奖励");
			end
			if reward["exp"] > 0 then
				player:add_exp(reward["exp"]);
			end
			if reward["bangjin"] > 0 then
				player:add_gamemoney_bind(reward["bangjin"]);
			end
			if reward["bangyuan"] > 0 then
				player:add_vcoin_bind(reward["bangyuan"]);
			end			
			player:set_param(227,1);
			player:alert(10,0,0,"成功领取奖励！");
		end
		return;
	end
	if panelid == 8 then
		if funid == 0 then
			ontalkvip100_0(player);
		end
		return;
	end
	if panelid == 9 then
		ontalkvip100_2(player,funid);
		return;
	end
	if panelid == 10 then --每日充值
		local temp_day = GetChargeMaxDay();
		if funid == 0 then
			panel_10_1(player);
		end
	
		if funid >= 1 and funid < #RechargeReward[temp_day] then
			panel_10_2(player,funid);
		end
		return;
	end
	if panelid == 11 then --打开首冲面板
		local temp_day = GetChargeMaxDay();
		if funid >= 0 and funid < #RechargeReward[temp_day] then
			panel_11_1(player,funid);
		end
		return;
	end
	if panelid == 18 then
		if funid == 1 then
			local ret = panel_18_1(player);
			return ret;
		end
		if funid == 2 then
			local ret = panel_18_2(player);
			return ret;
		end
		return;
	end
	if panelid == 35 then --副本鼓舞
		if funid == 0 then
			panel_35_0(player);
		end
		if funid == 1 then
			panel_35_1(player);
		end
		return;
	end
	if panelid == 100 then --VIP
		if funid == 1 then
			ontalkvip100_1(player);		
		end
		return;
	end

	if panelid == 109 then --膜拜城主
		local nlevel = player:get_level();
		if funid == 1 then
			local t = tonumber(os.date("%H%M",os.time()));
			for i = 1,#activity_mobaichengzhu do
				if t >= activity_mobaichengzhu[i][1] and t <= activity_mobaichengzhu[i][2] then			
					if nlevel >= 60 then
						if player:get_param(423) == 0 then
							player:set_status(1106,0,100,4);						
							player:set_param(423,1);
							player:set_param(222,0);
							player:set_timer(4,5,-1)
							player:alert(10,0,0,"正在膜拜，获得大量经验中");
							player:FinishFeats(11, 1);
							
						    local time = os.date("*t",os.time());
						    local from = os.time({year = time.year, month = time.month, day = time.day, hour = time.hour, min = time.min, sec = time.sec});
						    local to = os.time({year = time.year, month = time.month, day = time.day, hour = string.sub(activity_mobaichengzhu[i][2],1,2), min = string.sub(activity_mobaichengzhu[i][2],-2), sec = 59});
							local obj = {};
							obj.exp = 0;
							obj.remaining = to - from;
							player:SendPacketToSelf(2915,0,encode(obj));
							return;
						else
							player:alert(10,0,0,"正在膜拜，获得大量经验中");
							return;
						end
					else
						player:alert(21,0,0,"60级开启膜拜城主");
						return;
					end				
				end
			end
			player:alert(21,0,0,"12:00和18:00开启膜拜城主");
		end
		return;
	end
end