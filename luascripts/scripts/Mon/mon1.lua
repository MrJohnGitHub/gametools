function mon5006(mon,event,player)
	if player:get_task_state(2) == 35 then
		if player:get_task_param(2,35) >= 0 then
			player:set_task_param(2,35,player:get_task_param(2,35) + 1);
			player:push_task_data(1,1);
			--player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,35).."/5");
		end
		if player:get_task_param(2,35) == 5 then
			player:set_task_state(2,40);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(1,49,149,101);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

--集字活动接口 
function loot_text_item(mon,text_num_config,text_weight,text_item_config,text_item_weight)
	local num_rand = math.random(1,text_weight);
	local num = 0;
	for i = 1,#text_num_config do
		if num_rand <= text_num_config[i] then 
			num = i - 1;
			break;
		else 
			num_rand = num_rand - text_num_config[i];
		end
	end
	if num == 0 then
		return;
	end
--	g_broadcast(2,0,0,"3");
	for i = 1,num do
		local n_rand = math.random(1,text_item_weight);	
        local nAllItemCount = #text_item_config;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = text_item_config[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
            	local total = g_add_param(50 + j,nowCfg[5]);
            	if total == 1 then
                	mon:WorldGenerateLoot(nowCfg[1],nowCfg[2],nowCfg[4],true);
                else
                	mon:WorldGenerateLoot(41001,1,0,true);              	
                end
                break;
            end
        end
	end
end

--圣诞集字活动接口 
function other_loot_text_item(mon,text_num_config,text_weight,text_item_config,text_item_weight)
	local num_rand = math.random(1,text_weight);
	local num = 0;
	for i = 1,#text_num_config do
		if num_rand <= text_num_config[i] then 
			num = i - 1;
			break;
		else 
			num_rand = num_rand - text_num_config[i];
		end
	end
	if num == 0 then
		return;
	end
--	g_broadcast(2,0,0,"3");
	for i = 1,num do
		local n_rand = math.random(1,text_item_weight);	
        local nAllItemCount = #text_item_config;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = text_item_config[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
            	local total = g_add_param(64 + j,nowCfg[5]);
            	if total == 1 then
                	mon:WorldGenerateLoot(nowCfg[1],nowCfg[2],nowCfg[4],true);
                else
                	mon:WorldGenerateLoot(41011,1,0,true);              	
                end
                break;
            end
        end
	end
end

--元旦掉落活动接口 
function another_loot_text_item(mon,text_num_config,text_weight,text_item_config,text_item_weight)
	local num_rand = math.random(1,text_weight);
	local num = 0;
	for i = 1,#text_num_config do
		if num_rand <= text_num_config[i] then 
			num = i - 1;
			break;
		else 
			num_rand = num_rand - text_num_config[i];
		end
	end
	if num == 0 then
		return;
	end
	for i = 1,num do
		local n_rand = math.random(1,text_item_weight);	
        local nAllItemCount = #text_item_config;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = text_item_config[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
            	local total = g_add_param(72 + j,nowCfg[5]);
            	if total == 1 then
                	mon:WorldGenerateLoot(nowCfg[1],nowCfg[2],nowCfg[4],true);
               	end
               	break;
            end
        end
	end
end

function lootConfit(mon)
	local start, over = GetActivityStartAndOverTimeStamp(G_Text_Collect_Config);
	local cur = os.time();
	if start > cur or cur > over then
		return;
	end
	local entry = mon:GetEntry();
	local monconf = g_montb[entry];
	if monconf == nil then
		monconf = g_montb[6169];
	end	
	loot_text_item(mon,monconf["text_num_config"],monconf["text_num_weight"],monconf["text_item_config"],monconf["text_item_weight"]);
end

function otherlootConfit(mon)
	local conf, start, over = GetOperActivityConfig(G_Festival_Text_Collect_Config)
	local cur = os.time();
	if start > cur or cur > over then
	--	g_broadcast(12,0,0,"444");
		return;
	end
	--g_broadcast(12,0,0,"444");
	local entry = mon:GetEntry();
	local monconf = G_festival_montb[entry];
	if monconf == nil then
		monconf = G_festival_montb[6169];
	end	
	other_loot_text_item(mon,monconf["text_num_config"],monconf["text_num_weight"],monconf["text_item_config"],monconf["text_item_weight"]);
end

function anotherlootConfit(mon)
	local conf, start, over = GetOperActivityConfig(G_NewYear_Drop)
	local cur = os.time();
	if start > cur or cur > over then
		return;
	end
	local entry = mon:GetEntry();
	local monconf = G_NewYear_montb[entry];
	if monconf == nil then
		monconf = G_NewYear_montb[6169];
	end	
	another_loot_text_item(mon,monconf["text_num_config"],monconf["text_num_weight"],monconf["text_item_config"],monconf["text_item_weight"]);
end

function mon7035(mon,event,player,type)
	if type == 0 then
		lootConfit(mon);
		otherlootConfit(mon);
		anotherlootConfit(mon);
	end
end

function mon6666(mon,event,player,type)
	mon7035(mon,event,player,type)
	if player:GetMapId() <= 340 and player:GetMapId() >= 317 then
		--317-436
		local towerid = player:GetMapId() - 316
		if towerid == 24 then
			player:alert(10,0,0,"恭喜完成全部关卡，你真是太棒了！");
		else
			player:alert(10,0,0,"成功击杀了BOSS，赶快挑战下一关卡吧！");
		end
		local obj = {};
		obj.isfinish = 1;
		player:SendPacketToSelf(3609,0,encode(obj));
		
		local enter_time = player:get_param(789);
		local day = GetTodayIsWhichDay(enter_time);
		local maxtowerid = player:get_param(600);
		local maxdailytowerid = player:get_param(601);
		if towerid > maxtowerid then
			player:set_param(600,towerid);
		else
			player:set_param(602,towerid);
		end
		if towerid > maxdailytowerid and day == 1 then
			player:set_param(601,towerid);
		end
		local flagnum = math.ceil(towerid/32) + 602;
		local flag = player:get_param(flagnum);
		local index = towerid%32;
		if index == 0 then
			index = 32;
		end
		if bitget(flag,index) == 0 then
			local str = "领取成功,获得";
			local str_flag = 0;
			local len = #TowerFirst[towerid];
			for i = 1, len do
				if TowerFirst[towerid][i][1] == 0 and player:num_bag_black() == 0 then
					player:SendSystemMail("玄神宫首通奖励","    亲爱的玩家，您的背包已满。这是您遗留的道具"	,"[".. TowerFirst[towerid][i][2].. "," .. TowerFirst[towerid][i][3] .. ",0,0,0,0]","[0,0,0,0]",1);
				else
					new_add_item(player,TowerFirst[towerid][i][1],TowerFirst[towerid][i][2],TowerFirst[towerid][i][3],TowerFirst[towerid][i][4]);
				end
			end
			player:set_param(flagnum,bitset(flag,index));
		end
		
		player:FinishFeats(21, 1);
		AddXuanShenYouLiParamCount(player);
	end
end

function mon6667(mon,event,player,type)
	mon7035(mon,event,player,type)
	if player:GetMapId() <= 364 and player:GetMapId() >= 341 then
		--341-364
		local towerid = player:GetMapId() - 340
		if towerid == 24 then
			player:alert(10,0,0,"恭喜完成全部关卡，你真是太棒了！");
		else
			player:alert(10,0,0,"成功击杀了BOSS，赶快挑战下一关卡吧！");
		end
		local obj = {};
		obj.isfinish = 1;
		player:SendPacketToSelf(3609,0,encode(obj));
		
		local enter_time = player:get_param(789);
		local day = GetTodayIsWhichDay(enter_time);
		local maxtowerid = player:get_param(797);
		local maxdailytowerid = player:get_param(798);
		if towerid > maxtowerid then
			player:set_param(797,towerid);
		else
			player:set_param(801,towerid);
		end
		if towerid > maxdailytowerid and day == 1 then
			player:set_param(798,towerid);
		end
		local flag = player:get_param(800);
		local index = towerid%32;
		if index == 0 then
			index = 32;
		end
		if bitget(flag,index) == 0 then
			local str = "领取成功,获得";
			local str_flag = 0;
			local len = #TowerFirstNew[towerid];
			for i = 1, len do
				if TowerFirstNew[towerid][i][1] == 0 and player:num_bag_black() == 0 then
					player:SendSystemMail("玄神宫首通奖励","    亲爱的玩家，您的背包已满。这是您遗留的道具"	,"[".. TowerFirstNew[towerid][i][2].. "," .. TowerFirstNew[towerid][i][3] .. ",0,0,0,0]","[0,0,0,0]",1);
				else
					new_add_item(player,TowerFirstNew[towerid][i][1],TowerFirstNew[towerid][i][2],TowerFirstNew[towerid][i][3],TowerFirstNew[towerid][i][4]);
				end
			end
			local temp = bitset(flag,index);
			player:set_param(800,temp);
		end
		
		player:FinishFeats(21, 1);
		AddXuanShenYouLiParamCount(player);
	end
end

function mon5007(mon,event,player)
	if player:get_task_state(2) == 45 then
		if player:get_task_param(2,45) >= 0 then
			player:set_task_param(2,45,player:get_task_param(2,45) + 1);
			--player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,45).."/5");
			player:push_task_data(1,1);
		end
		if player:get_task_param(2,45) == 5 then
			player:set_task_state(2,50);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(1,80,146,102);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end


function mon5008(mon,event,player)
	if player:get_task_state(2) == 31 then
		if player:get_task_param(2,31) >= 0 then
			player:set_task_param(2,31,player:get_task_param(2,31) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,31).."/5");
			player:push_task_data(1,1);
		end
		if player:get_task_param(2,31) == 5 then
			player:set_task_state(2,32);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(8,31,41,801);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	if player:get_task_state(2) == 55 then
		if player:get_task_param(2,55) >= 0 then
			player:set_task_param(2,55,player:get_task_param(2,55) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,55).."/5");
			player:push_task_data(1,1);
		end
		if player:get_task_param(2,55) == 5 then
			player:set_task_state(2,60);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(1,105,130,103);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon5009(mon,event,player)
	if player:get_task_state(2) == 65 then
		if player:get_task_param(2,65) >= 0 then
			player:set_task_param(2,65,player:get_task_param(2,65) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,65).."/5");
			player:push_task_data(1,1);
		end
		if player:get_task_param(2,65) == 5 then
			player:set_task_state(2,70);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(1,116,99,104);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end



function mon5010(mon,event,player)
	if player:get_task_state(2) == 75 then
		if player:get_task_param(2,75) >= 0 then
			player:set_task_param(2,75,player:get_task_param(2,75) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,75).."/5");
			player:push_task_data(1,1);
		end
		if player:get_task_param(2,75) == 5 then
			player:set_task_state(2,80);
			player:push_task_data(1,1);
			player:autofightstart(0,0,0);
			player:find_road_goto(1,116,64,105);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon5014(mon,event,player)
	if player:get_task_state(2) == 85 then
		if player:get_task_param(2,85) >= 0 then
			player:set_task_param(2,85,player:get_task_param(2,85) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(2,85).."/1");
			player:push_task_data(1,1);
		end
		if player:get_task_param(2,85) == 1 then
			player:set_task_state(2,90);
			player:push_task_data(1,1);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
end

function mon4001(mon,event,player)
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon4002(mon,event,player)
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon4003(mon,event,player)
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon4004(mon,event,player)
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end


function mon4005(mon,event,player)
end

function mon6701(mon,event,player)
	local map = player:GetMapId();
	if map == 137 or map == 138 or map == 139 or map == 140 or map == 111 or map == 114 then
		if player:get_param(286) == 0 then
			player:set_param(286,player:get_param(286) + 1);
			local obj = {};
			obj.bosscount5 = player:get_param(286);
			player:SendPacketToSelf(1816,0,encode(obj));
		end
		if player:num_monster(map) == 0 then
			player:set_param(270,1);
			local obj = {};
			obj.bosstype = player:get_param(270);
			player:SendPacketToSelf(1816,0,encode(obj));
			player:gui_high_focus(8,3,30,250,"点击按钮领取奖励!");
			player:autofightstart(0,0,0);
		end
	end
end

function mon4031(mon,event,player)
end

function mon4006(mon,event,player)
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon4007(mon,event,player)
	local task8 = player:get_task_state(8);
	if task8 == 2 or task8 == 3 then
		TaskMonNum(player,mon);
	end
end

function mon7092(mon,event,player)
	g_set_param(78,0);
end