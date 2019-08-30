function panel_11_1(player,funid)
	local obj = {};
	local mar = {};
	obj.list = mar;
	obj.needgold = RechargeGold;
	local temp_day = GetChargeMaxDay();
	obj.level = #RechargeReward[temp_day];
	obj.hasgold = player:get_param(221);
	

	local temp = {};
	if player:get_job() == 1 then
		temp.itemid = 20107;
	elseif player:get_job() == 2 then
		temp.itemid = 20128;
	elseif player:get_job() == 3 then
		temp.itemid = 20149;
	end
	temp.num = 1;
	temp.flag = 1;
	temp.type = 0;
	table.insert(mar,temp);
	for j = 1,obj.level do
		for i = 1,#RechargeReward[temp_day][j] do
			local target = {};
			target.itemid = RechargeReward[temp_day][j][i][1];
			target.num = RechargeReward[temp_day][j][i][2];
			target.flag = RechargeReward[temp_day][j][i][3];
			target.type = j-1;
			table.insert(mar,target);
		end
	end
	player:SendPacketToSelf(2977,0,encode(obj));
	return;
end