--==========================================================
--		 【运营】元宝转盘
--===========================================================

local operate_ybzp = {		--返利比例配置
	money = 100,		--转动一次消耗元宝
	[0] = {				--[当前的比例]={{权重(累增，总和为10000),更高的比例}}
		{1429,20},
		{4286,30},
		{7857,50},
		{10000,60}
	},
	[20] = {
		{714,20},
		{3571,30},
		{7857,50},
		{10000,60}
	},
	[30] = {
		{667,20},
		{2000,30},
		{5333,50},
		{8000,60},
		{10000,70}
	},
	[50] = {
		{417,30},
		{1667,50},
		{5833,60},
		{8333,70},
		{10000,80}
	},
	[60] = {
		{385,50},
		{2308,60},
		{6154,70},
		{8462,80},
		{10000,90}
	},
	[70] = {
		{400,60},
		{2800,70},
		{6800,80},
		{8800,90},
		{10000,100}
	},
	[80] = {
		{625,60},
		{1875,70},
		{3750,80},
		{7500,90},
		{10000,100}
	},
	[90] = {
		{909,70},
		{2727,80},
		{6364,90},
		{10000,100}
	},
	[100] = {
		{10000,100}
	},	
};

g_operate_ybzp = {		--活动时间配置
	start_time = {year = 2016, month = 11, day = 7, hour = 0, min = 0, sec = 0},
	end_time = {year = 2016, month = 12, day = 28, hour = 0, min = 0, sec = 0},
	open_ser_tm = {
		start_day = 11,
		end_day = 14,
	},
	use_open = false
}

function CheckOperateYBZPReward(player)
	local flag = player:get_task_state(209);
	local state = player:get_param(209);
	local money = player:get_task_param(209,0);
	
	if flag == 0 and state > 0 and money > 0 then
		return 1;
	end
	return 0;
end

function OnOperateYBZP(player,type)
	local isopen = CheckOperateYBZP(player);
	if isopen == false then
		player:alert(10,0,0,"不在活动时间");
		return;
	end
	local param = player:get_param(209);
	if type == 1 then
		if param >= 100 then
			player:alert(10,0,0,"已是最高返利比例");
			return;
		end
		local conf = operate_ybzp[param];
		if conf == nil then
			player:alert(10,0,0,"错误的返利比例配置");
			return;
		end
		if param > 0 then
			local now_money = player:get_vcoin();
			if now_money < operate_ybzp["money"] then
				player:alert(10,0,0,"元宝不足");
				return;			
			end
			player:sub_vcoin(operate_ybzp["money"]);
		end
		local rand = math.random(1,10000);
		for i=1,#conf do
			if rand <= conf[i][1] then
				param = conf[i][2];
				break;
			end
		end
		player:set_param(209,param);
	end
end

function CheckOperateShopIsOpen(player)
	local start, over = GetActivityStartAndOverTimeStamp(g_operate_shop)
	local cur = os.time()
	local ret = true;
	local status = 0;
	if cur < start or cur >= over then
		ret = false
	end
	return ret, status, start, over
end

CheckIconShowList = 
{
	[1] = CheckOperateShopIsOpen,
}

function CheckOneActivityIsOpen(player,actid)
	local ret = 0;
	if CheckIconShowList[actid](player) == true then
		ret = 1;
	end
	return ret;
end