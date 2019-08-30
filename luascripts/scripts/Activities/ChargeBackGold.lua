--充值返利的时间
g_ChargeBackGold_Time = {	
		0,3
		};
--充值返利日志最大条数
g_ChargeBackGold_LogMaxNum = 50;
--充值返利的档次
g_ChargeBackGold_Gold = {1000,2000,4000,9000,15000}
--充值返利转盘配置总权重
g_ChargeBackGold_Weight = 10000;
--充值返利转盘配置
g_ChargeBackGold_Config = { 
[1] = {
		[1] = {11500,1210},
		[2] = {100000,81},
		[3] = {12000,2419},
		[4] = {13500,1613},
		[5] = {20000,645},
		[6] = {12500,2419},
		[7] = {30000,403},
		[8] = {15000,1210}						
	},
[2] = {
		[1] = {11500,1923},
		[2] = {100000,48},
		[3] = {12000,2885},
		[4] = {13500,1923},
		[5] = {20000,240},
		[6] = {12500,1923},
		[7] = {30000,96},
		[8] = {15000,962}
	},
[3] = {
		[1] = {11500,2463},
		[2] = {100000,0},
		[3] = {12000,2956},
		[4] = {13500,1478},
		[5] = {20000,99},
		[6] = {12500,1970},
		[7] = {30000,49},
		[8] = {15000,985}
		
	},
[4] = {
		[1] = {11500,2263},
		[2] = {100000,0},
		[3] = {12000,2413},
		[4] = {13500,2112},
		[5] = {20000,30},
		[6] = {12500,2413},
		[7] = {30000,15},
		[8] = {15000,754}
		
	},
[5] = {
		[1] = {11500,2028},
		[2] = {100000,0},
		[3] = {12000,2704},
		[4] = {13500,2028},
		[5] = {20000,28},
		[6] = {12500,2366},
		[7] = {30000,0},
		[8] = {15000,845}
		
	}

}

function CheckChargeBackGoldTime()
	local initTimeDate = os.date("*t", g_get_init_time())
	initTimeDate.hour = 0
	initTimeDate.min = 0
	initTimeDate.sec = 0
	local initTime = os.time(initTimeDate)
	local startTimeStamp = initTime + g_ChargeBackGold_Time[1] * 86400;
	local endTimeStamp = initTime + g_ChargeBackGold_Time[2] * 86400 - 1;
	local curTimeStamp = os.time()
	if curTimeStamp < startTimeStamp or curTimeStamp > endTimeStamp then
		return false,startTimeStamp,endTimeStamp;
	else
		return true,startTimeStamp,endTimeStamp;
	end
end

function GetChargeBackGoldTimes(player,charge_num)
	
	local len = #g_ChargeBackGold_Gold;
	local times = 0;
	for i = 1,len do
		if charge_num < g_ChargeBackGold_Gold[i] then
			times = i - 1;
			break;
		end
	end
	if charge_num >= g_ChargeBackGold_Gold[len] then
		times = len;
	end
	return times
end


--充值返利转盘
function OnChargeBackGoldInfo(player,type,thread)
	--判断时间
	local ret,startTimeStamp,endTimeStamp = CheckChargeBackGoldTime();
	local param_444 = player:get_param(444);
	local charge_num = player:GetGreaterParam(startTimeStamp - 3600,endTimeStamp);
	local times = GetChargeBackGoldTimes(player,charge_num);
	local now_time = os.time();
	if type == 0 then
		local obj = {};
		obj.time = endTimeStamp;
		obj.has_times = times;
		obj.use_times = param_444;
		obj.charge_num = charge_num;
		player:SendPacketToSelf(4090,0,encode(obj));
		HandlerGetFanTianGifState(player);
	elseif type == 2 then
		if now_time > endTimeStamp then
			return;
		end
		if param_444 >= times then
			player:alert(10,0,0,"你的次数不足");
			return;
		end
		OnChargeBackGoldStart(player,param_444);
	elseif type == 1 then
		OnChargeBackGold(player,param_444);
		HandlerGetFanTianGifState(player);
	end
end

local function RundomChargeBackGold(randomNum,times)
	local nCount = 0;
	for i = 1, #g_ChargeBackGold_Config[times] do 
		nCount = nCount + g_ChargeBackGold_Config[times][i][2];
		if randomNum <= nCount then
			return i;
		end
	end
end

function OnChargeBackGoldStart(player,times)
	local ret,startTimeStamp,endTimeStamp = CheckChargeBackGoldTime();
	if ret == false then
		return 
	end

	if player:get_vcoin() < g_ChargeBackGold_Gold[times+1] then
		player:alert(10,0,0,"元宝不足");
		return;
	end  
	local randomNum = math.random(1, g_ChargeBackGold_Weight);
	local ret = RundomChargeBackGold(randomNum,times+1);
	player:set_param(445,ret);	
	local obj = {};
	obj.ret = ret;
	player:SendPacketToSelf(4094,0,encode(obj));
end

function OnChargeBackGold(player,times)
	local ret = player:get_param(445);
	if ret == 0 then
		return;
	end	
	local retconfig = g_ChargeBackGold_Config[times+1][ret];
	local gold_num = g_ChargeBackGold_Gold[times+1] * retconfig[1]/10000;
	local add_gold = gold_num - g_ChargeBackGold_Gold[times+1];
	player:sub_vcoin(g_ChargeBackGold_Gold[times+1], false);
	player:add_vcoin(gold_num);
	player:SendVcoinFly(gold_num, 10, 0);
	g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>投注<font color='#00ccff'>" .. g_ChargeBackGold_Gold[times+1] .. "</font>元宝转动幸运转盘，获得".. "<font color='#00ccff'>"..gold_num.."</font>元宝<a href='event:Open_ChargeRebate'><u><font color='#0be140'>我也转一转，一万变十万</font></u></a>");
	player:set_param(444,times+1);	
	player:set_param(445,0);	
	--插入记录
	local logSize = GetChargeBackGoldLogSize();
	if logSize >= g_ChargeBackGold_LogMaxNum then
		local delCount = logSize - g_ChargeBackGold_LogMaxNum + 1
		for i = delCount, 1, -1 do
			DelChargeBackGoldLog()	
		end		
	end
	AddChargeBackGoldLog(player,retconfig[1] , gold_num,times+1)
	local obj = {};
	obj.use_times = times + 1;
	player:SendPacketToSelf(4090,0,encode(obj));
	obj = {};
	local curTimeStamp = os.time();
	obj.name = player:GetName();
	obj.rate = retconfig[1];
	obj.gold_num = gold_num;
	obj.time = curTimeStamp;
	player:SendPacketToSelf(4093,0,encode(obj));
end


function OnGetTenRaceEquipInfo(player,thread)
	local param_473 = player:get_param(473);
	if param_473 >= #g_ten_race_equip_config then
		return;
	end
	local nowtaskid = player:get_task_state(0);
	for i = 1,#g_ten_race_equip_task_config do
		if g_ten_race_equip_task_config[i] == nowtaskid then
			local taskid = player:get_task_state(nowtaskid);
			if taskid == 1 then
				local obj = {};
				obj.ret = 0;
				player:SendPacketToSelf(4540,0,encode(obj));
				return;
			end
		end		
	end
end

function OnBuyTenRaceEquip(player,thread)
	if player:num_bag_black(0) < 1 then
		player:alert(10,0,0,"您的背包空间不足1格");
		return;
	end
	local param_473 = player:get_param(473);
	if param_473 >= #g_ten_race_equip_config then
		return;
	end
	param_473 = param_473 + 1;
	local my_money = player:get_vcoin_bind();
	local flag = false;
	if my_money < g_ten_race_equip_config[param_473][6] then
		player:alert(10,0,0,"绑元不足，完成成就、回收装备可获得大量绑元！");
		return;
	end
	player:set_param(473,param_473);
	player:sub_vcoin_bind(g_ten_race_equip_config[param_473][6]);
	local njob = player:get_job();
	player:add_item(g_ten_race_equip_config[param_473][njob],g_ten_race_equip_config[param_473][4],g_ten_race_equip_config[param_473][5],0,0);
	local obj = {};
	obj.ret = 0;
	player:SendPacketToSelf(4541,0,encode(obj));
end

function OnMoneyTree(player,type,thread)
	if type == 0 then
		OnMoneyTreeInfo(player,thread)
	elseif type == 1 then
		OnMoneyTreeGold(player,thread)
	elseif type == 2 then
		OnMoneyTreeCoin(player,thread)
	end
end

function OnMoneyTreeInfo(player,thread)
	local obj = {};
	local nvip = player:get_player_type();
	obj.goldnum = player:get_param(682);
	obj.goldtimes = player:get_param(683);
	obj.goldmaxtimes = g_money_tree_vip_times[nvip][1];
	obj.coinnum = player:get_param(684);
	obj.cointimes = player:get_param(685);
	obj.coinmaxtimes = g_money_tree_vip_times[nvip][2];
	player:SendPacketToSelf(4621,0,encode(obj));
end

function OnMoneyTreeGold(player,thread)
	local nvip = player:get_player_type();
	local gold = player:get_param(682);
	local times = player:get_param(683);
	--判断元宝
	if player:get_vcoin() < g_money_tree_gold_info[times][1] then
		return;	
	end
	--判断次数
	if times >= g_money_tree_vip_times[nvip][1] then
		return;
	end
	--扣除元宝
	player:sub_vcoin(g_money_tree_gold_info[times][1]);
	--计算暴击
	local add_gold = g_money_tree_gold_info[times][2];
	local n_rand = math.random(1,100);
	if n_rand < g_money_tree_gold_info[times][4] then
		add_gold = add_gold * g_money_tree_gold_info[times][3];
		player:alert(10,0,0,"恭喜你，祈福翻" .. g_money_tree_gold_info[times][3] .. "倍，获得绑定金币x" .. add_gold);
	else
		player:alert(10,0,0,"获得绑定金币x" .. add_gold);
	end
	--增加次数
	times = times + 1;
	player:FinishFeats(27,1);
	player:set_param(683,times);
	player:add_gamemoney_bind(add_gold);
	gold = gold + add_gold;
	player:set_param(682,gold);
	--通知前端
	local obj = {};
	obj.goldnum = gold;
	obj.goldtimes = times;
	obj.goldmaxtimes = g_money_tree_vip_times[nvip][1];
	player:SendPacketToSelf(4622,0,encode(obj));
end

function OnMoneyTreeCoin(player,thread)
	local nvip = player:get_player_type();
	local gold = player:get_param(684);
	local times = player:get_param(685);
	--判断元宝
	if player:get_vcoin() < g_money_tree_coin_info[times][1] then
		return;	
	end
	--判断次数
	if times >= g_money_tree_vip_times[nvip][2] then
		return;
	end
	--扣除元宝
	player:sub_vcoin(g_money_tree_coin_info[times][1]);
	--计算暴击
	local add_gold = g_money_tree_coin_info[times][2];
	local n_rand = math.random(1,100);
	if n_rand < g_money_tree_coin_info[times][4] then
		add_gold = add_gold * g_money_tree_coin_info[times][3];
		player:alert(10,0,0,"恭喜你，祈福翻" .. g_money_tree_coin_info[times][3] .. "倍，获得绑定元宝x" .. add_gold);
	else
		player:alert(10,0,0,"获得绑定元宝x" .. add_gold);
	end
	--增加次数
	times = times + 1;
	player:FinishFeats(27,1);
	player:set_param(685,times);
	player:add_vcoin_bind(add_gold);
	--飞行特效
	player:SendVcoinFly(add_gold, 10, 1);
	gold = gold + add_gold;
	player:set_param(684,gold);
	--通知前端
	local obj = {};
	obj.coinnum = gold;
	obj.cointimes = times;
	obj.coinmaxtimes = g_money_tree_vip_times[nvip][2];
	player:SendPacketToSelf(4623,0,encode(obj));
end