function OnRichang(player)
	local nLevel = player:get_level();
	local number = player:get_param(200);
	local param204 = player:get_param(204);
	local ntype = player:get_task_state(8);
	local nMonCount = player:get_task_param(8,2);
	local expbl = 1.0;
	--===================倍率计算=================
	if nLevel >= 40 and nLevel <= 50 then
		expbl = 1.0;
	elseif nLevel >= 51 and nLevel <= 109 then
		expbl = 0.02 * (nLevel - 51) + 1.1;
	elseif nLevel >= 110 then
		expbl = 2.1;
	end
	if nLevel >= 40 then
		--=================检测日常次数是否够了==========
		if ntype == 0 then
			player:set_task_state(8,1);
			player:push_task_data(8,1);
			ntype = player:get_task_state(8);
		end

		if number > 12 then
			player:set_task_state(8,1);
			player:push_task_data(8,1);
			if player:get_param(273) == 1 then
				player:set_param(273,0);
				player:set_param(274,0);
				player:set_param(265,0);
				player:go_home();
			end
			player:alert(21,0,0,"当天日常已完成，请等待24点后刷新任务!");
		end
		--================击杀地图===============
		local mapname = {
		[0]="机关洞穴",
		[1]="机关洞穴",
		[2]="牛魔祭坛",
		[3]="死亡蚁洞",
		[4]="蛇魔巢穴",
		[5]="通天魔塔",
		[6]="英雄战场",
		[7]="铁血魔城",
		[8]="修罗天界",
		[9]="邪恶熔岩",
		[10]="雪域冰原"
		};
		local sMap = mapname[param204];
		local obj = {};
		local nbl = 1;
		if player:get_param(203) == 1 then
			nbl = 2;	
		end
		--================击杀奖励===============
		local objexp = {
			[1]={[100]=900000,[101]=500},
			[2]={[100]=1250000,[101]=700},
			[3]={[100]=1600000,[101]=1100},
			[4]={[100]=2000000,[101]=1500},
			[5]={[100]=2400000,[101]=2000}
		};
		local param202 = player:get_param(202);
		for i=1,5 do
			if param202 == i then
				obj.exp = objexp[i][100] * expbl * nbl;
				obj.items = objexp[i][101] * nbl;
				break;
			end
		end
		--================所有奖励显示===============
		local arr = {};
		local target;
		local nlevel = player:get_level();
		local nMonCountZ = 0;
		local objmon = {
			[1]={[100]=10,[101]=10,[102]=20,[103]=20},
			[2]={[100]=15,[101]=20,[102]=30,[103]=40},
			[3]={[100]=20,[101]=30,[102]=40,[103]=60},
			[4]={[100]=25,[101]=40,[102]=50,[103]=80},
			[5]={[100]=30,[101]=50,[102]=60,[103]=100},
		};
		obj.count = arr;
		for i=1,5 do
			target = {};
			target.exp = objexp[i][100] * expbl;
			target.jgs = objexp[i][101];
			if nlevel >= 110 then
				nMonCountZ = objmon[i][103];
			elseif nlevel >= 100 then
				nMonCountZ = objmon[i][102];
			elseif nlevel >= 80 then
				nMonCountZ = objmon[i][101];
			else
				nMonCountZ = objmon[i][100];
			end
			target.mon = nMonCountZ;
			table.insert(arr,target);
		end
		--================击杀数量===============
		nMonCountZ = 0;
		local param201 = player:get_param(201);
		for i=1,5 do
			if param201 == i then
				if nlevel >= 110 then
					nMonCountZ = objmon[i][103];
				elseif nlevel >= 100 then
					nMonCountZ = objmon[i][102];
				elseif nlevel >= 80 then
					nMonCountZ = objmon[i][101];
				else
					nMonCountZ = objmon[i][100];
				end
				player:set_param(205,nMonCountZ);
				break;
			end
		end
		--================发送数据===============
		obj.taskTimes = number;
		obj.mapName = sMap;
		obj.soulCount = nMonCountZ;
		if ntype == 3 then
			obj.nowSoul = nMonCountZ;
		else
			obj.nowSoul = player:get_task_param(8,2);
		end
		if nLevel >= 1 and nLevel <= 79 then
			obj.reduceDifficultyCost = 25;
			obj.improveQualityCost = 25;
			obj.isReward = 100;
		elseif nLevel >= 80 and nLevel <= 99 then
			obj.reduceDifficultyCost = 50;
			obj.improveQualityCost = 50;
			obj.isReward = 200;
		elseif nLevel >= 100 and nLevel <= 109 then
			obj.reduceDifficultyCost = 100;
			obj.improveQualityCost = 100;
			obj.isReward = 400;
		else
			obj.reduceDifficultyCost = 150;
			obj.improveQualityCost = 150;
			obj.isReward = 600;
		end
		obj.taskDifficulty = player:get_param(201);
		local param202 = player:get_param(202);
		if param202 > 0 then
			obj.taskQuality = param202;
		end
		obj.isDoubleReward = player:get_param(203);
		obj.pace = ntype;
		obj.isHostingState = player:get_param(273);
		obj.closeWindows = 0;
		player:SendScriptNewTaskPanel(encode(obj)); --1809
	else
		player:alert(21,0,0,"对不起，您的级别不足40!");
	end
end

function OnRichangtg(player)
	--=================托管系统==========
	local nLevel = player:get_level();
	if player:get_param(273) == 1 and player:get_player_type() >= 1 then --是否为托管状态
		local ngold = 0;
		if nLevel >= 1 and nLevel <= 79 then
			ngold = 25;
		elseif nLevel >= 80 and nLevel <= 99 then
			ngold = 50;
		elseif nLevel >= 100 and nLevel <= 109 then
			ngold = 100;
		else
			ngold = 150;
		end
		if player:get_param(275) == 1 then
			if player:get_gamemoney() >= ngold and player:get_param(202) < 5 then --判断礼金是否足够
				OnRichangZw(player,2);
			end
		end
		if player:get_param(265) == 1 then
			if player:get_gamemoney() >= ngold and player:get_param(201) > 1 then --判断金币是否足够
				OnRichangZw(player,1);
			end
		end
		if player:get_task_state(8) == 1 then --接任务状态
			OnRichangZw(player,3);
		end
		if player:get_task_state(8) == 2 then --任务中途
			OnRichangZw(player,4);
		end
		if player:get_task_state(8) == 3 then --任务完成 托管系统
			if player:get_param(274) == 1 then
				if nLevel >= 1 and nLevel <= 79 then
					ngold = 100;
				elseif nLevel >= 80 and nLevel <= 99 then
					ngold = 200;
				elseif nLevel >= 100 and nLevel <= 109 then
					ngold = 400;
				else
					ngold = 600;
				end
				if player:get_gamemoney() >= ngold then
					player:set_param(203,1);
				end
			end
			OnRichangZw(player,5);
		end
		local obj = {};
		obj.isHostingState = player:get_param(273);
		player:SendScriptNewTaskPanel(encode(obj));
	end
end

function OnRichangZw(player,taskid)
	local nLevel = player:get_level();
	local param204 = player:get_param(204);
	if taskid == 1 then--降低难度
		local param201 = player:get_param(201);
		local ngold = 0;
		if param201 > 1 then
			if nLevel >= 1 and nLevel <= 79 then
				ngold = 25;
			elseif nLevel >= 80 and nLevel <= 99 then
				ngold = 50;
			elseif nLevel >= 100 and nLevel <= 109 then
				ngold = 100;
			else
				ngold = 150;
			end
			if player:get_gamemoney() >= ngold then
				local obj = {};
				player:sub_gamemoney(ngold);
				player:set_param(201,1);
				param201 = player:get_param(201);
				player:alert(21,0,0,"您的任务难度已经降低了");
				--================击杀数量===============
				local objmon = {
					[1]={[100]=10,[101]=10,[102]=20,[103]=20},
					[2]={[100]=15,[101]=20,[102]=30,[103]=40},
					[3]={[100]=20,[101]=30,[102]=40,[103]=60},
					[4]={[100]=25,[101]=40,[102]=50,[103]=80},
					[5]={[100]=30,[101]=50,[102]=60,[103]=100}
				};
				local nMonCountZ = 0;
				for i=1,5 do
					if param201 == i then
						if nLevel >= 110 then
							nMonCountZ = objmon[i][103];
						elseif nLevel >= 100 then
							nMonCountZ = objmon[i][102];
						elseif nLevel >= 80 then
							nMonCountZ = objmon[i][101];
						else
							nMonCountZ = objmon[i][100];
						end
						player:set_param(205,nMonCountZ);
						break;
					end
				end
				--=======检测降低是否比当前怪物还少================
				local param205 = player:get_param(205);
				if player:get_task_param(8,2) >= param205 then
					player:set_task_state(8,3);
				end
				--=======更新任务状态================
				OnRichang(player);
				obj = {};
				obj.num = param205;
				player:SendPacketToSelf(3534,0,encode(obj));
				player:push_task_data(8,1);
			else
				player:alert(21,0,0,"对不起,您的礼金不足"..ngold);
			end
		else
			player:alert(21,0,0,"对不起,您的任务难度已经最低了")
		end
	elseif taskid == 2 then--提高奖励
		if player:get_param(202) < 5 then
			if nLevel >= 1 and nLevel <= 79 then
				ngold = 25;
			elseif nLevel >= 80 and nLevel <= 99 then
				ngold = 50;
			elseif nLevel >= 100 and nLevel <= 109 then
				ngold = 100;
			else
				ngold = 150;
			end
			if player:get_gamemoney() >= ngold then
				player:sub_gamemoney(ngold);
				player:set_param(202,5);
				player:alert(21,0,0,"您的奖励已经提高到最高值!");
				player:push_task_data(8,1);
				OnRichang(player);
			else
				player:alert(21,0,0,"对不起,您的礼金不足"..ngold);
				player:gui_high_focus(107,2,547,188,"点击提升任务品质");
				local task3 = player:get_task_state(3);
				if task3 == 11 or task3 == 86 or task3 == 116 then
					if player:get_task_state(8) == 1 then
						player:gui_high_focus(7,0,48,445,"点击按钮接受任务");
					end
				end
			end
		else
			player:alert(21,0,0,"对不起,您的任务奖励已经最高了")
			player:gui_high_focus(107,2,547,188,"点击提升任务品质");
			local task3 = player:get_task_state(3);
			if task3 == 11 or task3 == 86 or task3 == 116 then
				if player:get_task_state(8) == 1 then
					player:gui_high_focus(7,0,48,445,"点击按钮接受任务");
				end
			end
		end
	elseif taskid == 3 then--接受任务
		if player:get_task_state(8) == 1 then
			player:set_task_state(8,2);
			player:push_task_data(8,1);
			local target = {};
			target.type = 2;
			player:SendPacketToSelf(1810,0,encode(target));

			local obj = {}
			obj.text_1 = "";
			obj.ContinueTask = 0;
			obj.text_0 = "";
			obj.id = 3;
			obj.state = 2;
			obj.type = 0;
			player:SendPacketToSelf(2403,0,encode(obj));

			OnRichang(player);
			if player:get_param(273) == 0 then
				OnRichangZw(player,4);
			end
		end
	elseif taskid == 4 then--继续任务
		if player:get_task_state(8) == 2 then
			local obj = {};
			obj.type = 3;
			player:SendPacketToSelf(1810,0,encode(obj));
			if param204 == 1 or param204 == 0 then
				local nWz = math.random(1,2);
				if nWz == 1 then
					player:enter_map(1,32,140,0);
					player:autofightstart(1,32,140);
				else
					player:enter_map(1,94,146,0);
					player:autofightstart(1,94,146);
				end
			elseif param204 == 2 then
				player:enter_map(2,53,107,0);
				player:autofightstart(2,53,107);
			elseif param204 == 3 then
				player:enter_map(28,80,167,0);
				player:autofightstart(28,80,167);
			elseif param204 == 4 then
				player:enter_map(5,33,130,0);
				player:autofightstart(5,33,130);
			elseif param204 == 5 then
				player:randomthismap(31);
				player:autofightstart(31,player:GetX(),player:GetY());
			elseif param204 == 6 then
				player:randomthismap(72);
				player:autofightstart(72,player:GetX(),player:GetY());
			elseif param204 == 7 then
				player:randomthismap(38);
				player:autofightstart(38,player:GetX(),player:GetY());
			elseif param204 == 8 then
				player:randomthismap(58);
				player:autofightstart(58,player:GetX(),player:GetY());
			elseif param204 == 9 then
				player:randomthismap(54);
				player:autofightstart(54,player:GetX(),player:GetY());
			elseif param204 == 10 then
				player:randomthismap(42);
				player:autofightstart(42,player:GetX(),player:GetY());
			end
			player:GroupInOut(0)
		end
	elseif taskid == 5 then--提交任务
		if player:get_task_state(8) == 3 then
			local nbl = 1;
			if player:get_param(203) == 1 then
				if nLevel >= 1 and nLevel <= 79 then
					ngold = 100;
				elseif nLevel >= 80 and nLevel <= 99 then
					ngold = 200;
				elseif nLevel >= 100 and nLevel <= 109 then
					ngold = 400;
				else
					ngold = 600;
				end
				if player:get_gamemoney() >= ngold then
					player:sub_gamemoney(ngold);
					nbl = 2;
				else
					player:alert(21,0,0,"对不起，您的礼金不足"..ngold.."，无法领取双倍奖励");
					return;
				end
			end
			if player:get_param(200) < 12 then
				player:set_param(200,player:get_param(200) + 1);
				local obj = {};
				obj.type = 4;
				player:SendPacketToSelf(1810,0,encode(obj));
				player:set_task_state(8,2,0);
				player:set_task_state(8,1);
				player:push_task_data(8,1);
				local nLevel = player:get_level();
				local expbl = 1.0;
				--===================倍率计算=================
				if nLevel >= 40 and nLevel <= 60 then
					expbl = 1.0;
				elseif nLevel >= 61 and nLevel <= 109 then
					expbl = 0.02 * (nLevel - 61) + 1.1;
				elseif nLevel >= 110 then
					expbl = 2.1;
				end
				local objexp = {
					[1]={[100]=900000,[101]=500},
					[2]={[100]=1250000,[101]=700},
					[3]={[100]=1600000,[101]=1100},
					[4]={[100]=2000000,[101]=1500},
					[5]={[100]=2400000,[101]=2000}
				};
				local param202 = player:get_param(202);
				for i=1,5 do
					if param202 == i then
						nExp = objexp[i][100] * expbl * nbl;
						nItem = objexp[i][101] * nbl;
						break;
					end
				end
				if param202 >= 4 then
					local nrandom = math.random(1,100);
					if nrandom >= 1 and nrandom <= 10 then
						nrandom = math.random(1,100)
						if nrandom >= 1 and nrandom <= 80 then
							player:SendSystemMail("炼妖5星额外奖励","恭喜你已经获得<font color='#21d119'>炼妖5星级别</font>额外奖励","[10221,1]","[0,0,0,0]",1);
						else
							player:SendSystemMail("炼妖5星额外奖励","恭喜你已经获得<font color='#21d119'>炼妖5星级别</font>额外奖励","[10064,1]","[0,0,0,0]",1);
						end
						player:alert(20,0,0,"恭喜你获得了日常任务额外奖励，请查收邮件!")
					end
				end
				player:set_param(206,0);
				player:add_exp(nExp);
				player:set_param(248,player:get_param(248) + nItem,"任务奖励");

				if player:get_param(415) < 5 then
					player:set_param(415,player:get_param(415) + 1);
					if player:get_param(415) == 5 then
						local obj = {};
						obj.id = 10;
						obj.ret = 1;
						player:SendPacketToSelf(2437,0,encode(obj));
					end
				end

				local obj = {}
				obj.text_1 = "";
				obj.ContinueTask = 0;
				obj.text_0 = "";
				obj.id = 1;
				obj.state = 2;
				obj.type = 0;
				player:SendPacketToSelf(2403,0,encode(obj));

				player:set_param(205,0); --击杀数量
				player:set_param(203,0); --双倍提交
				--难度
				local a = math.random(1,100);
				if a >= 1 and a <= 10 then
					player:set_param(201,1);
				elseif a >= 11 and a <= 30 then
					player:set_param(201,2);
				elseif a >= 31 and a <= 60 then
					player:set_param(201,3);
				elseif a >= 61 and a <= 85 then
					player:set_param(201,4);
				else
					player:set_param(201,5);
				end
				--===奖励
				a = math.random(1,100);
				if a >= 1 and a <= 10 then
					player:set_param(202,1);
				elseif a >= 11 and a <= 30 then
					player:set_param(202,2);
				elseif a >= 31 and a <= 60 then
					player:set_param(202,3);
				elseif a >= 61 and a <= 85 then
					player:set_param(202,4);
				else
					player:set_param(202,5);
				end
				--=================随机选择地图==========
				local nLevel = player:get_level();
				local param258 = player:get_param(258);
				if param258 >= 30 then
					player:set_param(204,10);
				elseif param258 >= 21 then
					player:set_param(204,math.random(9,10));
				elseif param258 >= 11 then
					player:set_param(204,math.random(8,9));
				elseif param258 >= 1 then
					player:set_param(204,math.random(6,8));
				elseif nLevel >= 90 then
					player:set_param(204,math.random(3,5));
				elseif nLevel >= 80 then
					player:set_param(204,math.random(2,4));
				elseif nLevel >= 70 then
					player:set_param(204,math.random(2,4));
				else
					player:set_param(204,1);
				end
				OnRichang(player);
				--=================托管跳转==========
				if player:get_param(273) == 1 then
					OnRichangtg(player)
				end
				-- player:gui_high_focus(107,0,48,445,"点击按钮领取奖励");
				local task3 = player:get_task_state(3);
				if task3 == 11 or task3 == 86 or task3 == 116 then
					if player:get_task_state(8) == 1 then
						if player:get_param(202) < 5 then
							player:gui_high_focus(7,2,547,188,"点击提升任务品质");
						end
					end
				end
				if player:get_task_state(2) == 171 then
					player:set_task_state(2,175);
					player:push_task_data(1,1);
					player:add_exp(2000000);
					player:openpanel(35);
					player:find_road_goto(12,98,121,1210);
					return;
				end
			end
		end
	elseif taskid == 6 then--双倍提交
		if player:get_param(203) == 0 then
			player:set_param(203,1);
		else
			player:set_param(203,0);
		end
		local obj = {};
		obj.isDoubleReward = player:get_param(203);
		player:SendScriptNewTaskPanel(encode(obj));
		OnRichang(player);
	end
end

function TaskMonNum(player,mon)
	local nMonCountZ = player:get_param(205);
	local map = player:GetMapId();
	local param204 = player:get_param(204);
	if player:get_task_state(8) == 2 then
		if param204 == 1 or param204 == 0 then
			if not(map == 1 or map == 4) then
				return;
			end
		elseif param204 == 2 then
			if not(map ~= 3 or map ~= 2) then
				return;
			end
		elseif param204 == 3 then
			if not(map ~= 28 or map ~= 29 or map ~= 30) then
				return;
			end
		elseif param204 == 4 then
			if not(map ~= 5 or map ~= 6 or map ~= 7) then
				return;
			end
		elseif param204 == 5 then
			if not(map~= 31 or map ~= 32 or map ~= 33) then
				return;
			end
		elseif param204 == 6 then
			if not(map ~= 70 or map ~= 71 or map ~= 72) then
				return;
			end
		elseif param204 == 7 then
			if not(map ~= 38 or map ~= 39 or map ~= 40) then
				return;
			end
		elseif param204 == 8 then
			if not(map ~= 58 or map ~= 59 or map ~= 60) then
				return;
			end
		elseif param204 == 9 then
			if not(map ~= 54 or map ~= 56 or map ~= 57) then
				return;
			end
		elseif param204 == 10 then
			if not(map ~= 42 or map ~= 43 or map ~= 44) then
				return;
			end
		end
		if player:get_task_param(8,2) >= 0 then
			player:set_task_param(8,2,player:get_task_param(8,2)+1);
			player:push_task_data(8,1);
			player:alert(111,0,0,"<font color='#ffffff'>已收集妖魄数量："..player:get_task_param(8,2).."/"..nMonCountZ.."</font>");
			local obj = {};
			obj.creatureid = mon:GetLowGUID();
			obj.action = 0;
			obj.num = player:get_task_param(8,2);
			player:SendPacketToSelf(3534,0,encode(obj));
			obj = {};
			obj.nowSoul = player:get_task_param(8,2);
			player:SendScriptNewTaskPanel(encode(obj));
			if player:get_task_param(8,2) >= nMonCountZ then

				local obj = {}
				obj.text_1 = "";
				obj.ContinueTask = 0;
				obj.text_0 = "";
				obj.id = 1;
				obj.state = 2;
				obj.type = 0;
				player:SendPacketToSelf(2403,0,encode(obj));

				player:set_task_state(8,3);
				player:push_task_data(8,1);
				if player:get_param(273) == 1 then
					OnRichangtg(player);
				end
				if player:get_task_state(8) == 3 then
					player:GroupInOut(1);
					local level = player:get_level();
					if level <= 70 then
						player:gui_high_focus(1,3,30,35,"点击回城提交任务");
					end
					if level < 50 then
						player:find_road_goto(12,104,116,1207);
						return;
					end
					if level < 56 then
						player:find_road_goto(17,106,142,1714);
						return;
					end
				end
			end
		end
	elseif player:get_task_state(8) == 3 then
		player:GroupInOut(1);
		local level = player:get_level();
		player:gui_high_focus(1,3,30,35,"点击回城提交任务");
		if level < 50 then
			player:find_road_goto(12,104,116,1207);
			return;
		end
		if level < 56 then
			player:find_road_goto(17,106,142,1714);
			return;
		end
	end
	return;
end
