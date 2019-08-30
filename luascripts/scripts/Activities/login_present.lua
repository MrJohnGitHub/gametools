--登录有礼的配置
--奖励配置,类型（0物品1金币2绑金3经验29boss积分100绑元101元宝，奖励id，数量，绑定（1绑定0非绑）
G_Login_Present_Config = {	
	start_time = {year = 2016, month = 11, day = 10, hour = 0, min = 0, sec = 0},
	end_time = {year = 2016, month = 11, day = 27, hour = 23, min = 59, sec = 59},
	open_ser_tm = {
		start_day = 8,
		end_day = 14,
	},
	use_open = false, --ture就用开服时间， false就用自然时间
	itemCount = {6,5,5,5,5,5,5},
	reward = {
			{{0,10411,2,1},{0,10295,3,1},{0,10279,1,1},{0,40901,1,1},{0,12014,5,1}},
			{{0,40101,100,1},{0,10295,3,1},{0,10279,1,1},{0,40901,2,1},{0,12014,5,1}},
			{{0,12022,2,1},{0,10295,3,1},{0,10279,2,1},{0,40901,3,1},{0,12014,5,1}},
			{{0,10409,20,1},{0,10295,3,1},{0,10279,2,1},{0,40901,4,1},{0,12014,5,1}},
			{{0,10407,20,1},{0,10295,3,1},{0,10279,3,1},{0,40901,5,1},{0,12014,10,1}},
			{{0,10413,2,1},{0,10295,3,1},{0,10279,3,1},{0,40901,6,1},{0,12014,10,1}},
			{{0,10165,2,1},{0,10295,3,1},{0,10279,5,1},{0,40901,7,1},{0,12014,10,1}}

		}
};


function CheckLoginPresentIcon(player)
	local start, over = GetActivityStartAndOverTimeStamp(G_Login_Present_Config)
	local cur = os.time()
	if cur < start or cur >= over then
		return false
	end
	
	local days = player:get_param(694);
	local reward_flags = player:get_param(695);
	local status = 0;
	for i = 1,days do
		if bitget(reward_flags,i) == 0 then
			status = 1;
			break
		end
	end
	return true, status, start, over
end

function OnLoginPresentInfo(player,id)
	local start, over = GetActivityStartAndOverTimeStamp(G_Login_Present_Config);
	local obj = {};
	obj.start_time = start;
	obj.end_time   = over;
	local days = player:get_param(694);
	obj.days = days;
	local reward_flags = player:get_param(695);
	obj.award_flag = reward_flags;
	player:SendPacketToSelf(4661,0,encode(obj));
end

function OnLoginPresentReward(player,type, id)
	local start, over = GetActivityStartAndOverTimeStamp(G_Login_Present_Config);
	local cur = os.time()
	if start > cur or cur >= over then
		player:alert(10,0,0,"活动已经过期了");
		return
	end
	local days = player:get_param(694);	
	local congig = G_Login_Present_Config.reward;
	if type > #congig or type > days then
		return;
	end 
	local reward_flags = player:get_param(695);
	if bitget(reward_flags,type) == 1 then
		player:alert(10,0,0,"您已经领取过了");
		return
	end
	local len = #congig[type];
	local bag_num = 0;
	for i = 1,len do
		if congig[type][i][1] == 0 then
			bag_num = bag_num + 1;
		end
	end
	if player:num_bag_black() < G_Login_Present_Config.itemCount[type] then
		player:alert(10,0,0,"背包空间不足，请及时处理");
		return;
	end
	reward_flags = bitset(reward_flags,type);
	for i = 1,len do
		new_add_item(player,congig[type][i][1],congig[type][i][2],congig[type][i][3],congig[type][i][4], 0);
	end
	player:set_param(695,reward_flags);
	OnLoginPresentInfo(player);
	HandleReqPayActivityIconStatus(player);
end