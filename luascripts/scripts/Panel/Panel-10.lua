function GetChargeMaxDay()
	local temp_day = g_get_day();
	if temp_day > ChargeRewardMaxDays then
		temp_day = ChargeRewardMaxDays;
	end
	if temp_day == 0 then
		temp_day = 1;
	end
	return temp_day
end

function panel_10_0(player)
	local obj = {};
	obj.Money = player:get_param(221);
	obj.type = player:get_param(470);
	local param = player:get_task_param(470,1);
	obj.Mark = player:get_param(471);
	--if obj.type == 2 then
		--if param == 1 then
			--obj.Money = obj.Money - 1000;
		--end
	--end
	local temp_day = GetChargeMaxDay();
	local len = #RechargeReward[temp_day];
	obj.effect = 1;
	local index = 0;
	for i = 1,len do
		if bitget(obj.Mark,i) == 0 and obj.Money >= RechargeGold[i] then
			obj.effect = 2;
		end
		if bitget(obj.Mark,i) == 1 then
			index = index + 1;
		end
	end
	--是否显示
	if index < #RechargeGold then
		obj.Show = 0;
	else
		obj.Show = 1;
	end

	player:SendPacketToSelf(2978,0,encode(obj));
end

function panel_10_1(player)
	local temp_day = GetChargeMaxDay();
	if player:num_bag_black() < #RechargeReward[temp_day][1] + 1 then
		player:alert(10,0,0,"你的背包空位不足,无法领取奖励");
	elseif player:get_param(470) == 1 then
		for i = 1,#RechargeReward[temp_day][1] do
			player:add_item(RechargeReward[temp_day][1][i][1],RechargeReward[temp_day][1][i][2],RechargeReward[temp_day][1][i][3],0,0);
		end
		if player:get_job() == 1 then
			player:add_item(20107,1,0,0,6);
		elseif player:get_job() == 2 then
			player:add_item(20128,1,0,0,6);
		elseif player:get_job() == 3 then
			player:add_item(20149,1,0,0,6);
		end
		g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>首尝充值快感，成功领取首充大礼包，战力急速提升。<u><a href='event:open_window,OPEN_PAY_FIRST'><font color='#00ff00'>我也要领取</font></a></u>");
		--g_broadcast(13,0,0,"<font color='#28ff28'>["..player:GetName().."]</font>获取超高价值的<font color='#EA0000'>["..g_get_item_name(10235).."]</font>,超强群攻英雄免费拥有!");
		player:set_param(470,2);
		player:set_param(471,bitset(player:get_param(471),1));
		panel_10_0(player);
		panel_11_1(player,1);
		player:alert(10,0,0,"成功领取奖励");
	else
		player:alert(10,0,0,"对不起,您未完成充值任务");
	end
	return;
end

function panel_10_2(player,funid)
	local temp_day = GetChargeMaxDay();
	local param221 = player:get_param(221);
	local param470 = player:get_param(470);
	local param = player:get_task_param(470,1);
	local param471 = player:get_param(471);
	--if param == 1 then
		--param221 = param221 - 1000;
	--end
	if player:num_bag_black() < #RechargeReward[temp_day][2] then
		player:alert(10,0,0,"你的背包空位不足,无法领取奖励");
		return;
	end
	if param470 == 2 then
		local newfunid = funid + 1;
		if param221 >= RechargeGold[newfunid] then --第一天判断金额大于1100可以领取奖励
			if bitget(param471,funid+1) == 0 then		
				player:set_param(471,bitset(param471,funid+1));
				for i = 1,#RechargeReward[temp_day][newfunid] do
					player:add_item(RechargeReward[temp_day][newfunid][i][1],RechargeReward[temp_day][newfunid][i][2],RechargeReward[temp_day][newfunid][i][3],0,0);
				end
				panel_10_0(player);
				if newfunid < #RechargeReward[temp_day] then
					panel_11_1(player,newfunid)
				end
				if funid == 1 then
					g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>一掷千金，成功领取价值千金的每日充值礼包。<u><a href='event:open_window,OPEN_PAY_FIRST'><font color='#00ff00'>我也要领取</font></a></u>");
				end
				player:alert(10,0,0,"成功领取奖励");
			else
				player:alert(10,0,0,"对不起,您已经领取过奖励了");
			end
		else
			player:alert(10,0,0,"对不起,您未完成充值任务");
		end
	end
	return;
end