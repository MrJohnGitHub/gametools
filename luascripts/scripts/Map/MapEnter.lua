function Map13_Enter(map,player,mgr)

end


function Map33_Enter(map,player,mgr)
    player:set_status(1105,0,0,0);
end
--[[
function Map202_Enter(map,player,mgr)

	local xssbc = 121;	--打宝-火云山
	
	if player:get_task_state(xssbc) == 1 then				     
		player:set_task_state(xssbc,2);
		SendUpdateTrackPanel_1(player,xssbc);   
	end
end

function Map203_Enter(map,player,mgr)

	local xssbc = 124;	--打宝-龙军墓穴
	
	if player:get_task_state(xssbc) == 1 then				     
		player:set_task_state(xssbc,2);
		SendUpdateTrackPanel_1(player,xssbc);   
	end
end

function Map204_Enter(map,player,mgr)

	local xssbc = 127;	--打宝-三万山崖
	
	if player:get_task_state(xssbc) == 1 then				     
		player:set_task_state(xssbc,2);
		SendUpdateTrackPanel_1(player,xssbc);   
	end
end

function Map466_Enter(map,player,mgr)

	local xssbc = 130;	--神威狱
	
	if player:get_task_state(xssbc) == 1 then				     
		player:set_task_state(xssbc,2);
		SendUpdateTrackPanel_1(player,xssbc);   
	end
end
]]
function Map142_Enter(map,player,mgr)
	if player:get_task_state(4) == 26 then
		if player:num_monster() == 0 then
			local obj = {};
			obj[7] = 3;
			obj[8] = 5;
			obj[2] = 22;
			obj[3] = 39;
			obj[4] = 5105;
			obj[5] = 35151;
			obj[6] = "破甲狂僵尸";
			player:mon_gen(encode(obj));

			obj[4] = 5106;
			obj[5] = 35148;
			obj[6] = "枷锁僵尸";
			player:mon_gen(encode(obj));
		
			obj[4] = 5107;
			obj[5] = 35151;
			obj[6] = "地狱僵尸";
			player:mon_gen(encode(obj));

			obj[7] = 1;
			obj[8] = 1;
			obj[4] = 5104;
			obj[5] = 35149;
			obj[6] = "尸王";
			obj[19] = 4;
			player:mon_gen(encode(obj));

		end
	end
end

function Map238_Enter(map,player,mgr)
 --   player:alert(2,0,0,"您的背包空间不足1格,无法领取奖励");
 	player:alert(15,0,0,"侵占地图上喷点，每5秒送大量元宝和经验");
 	player:SetFightModle(1);
    local format_time = tonumber(os.date("%H%M",os.time()));	
    local nQxzb = #activity_qxzb_tm;
    for i=1,nQxzb do
       if format_time >= tonumber(activity_qxzb_tm[i][1]) and format_time < tonumber(activity_qxzb_tm[i][2]) then
            local start_time = g_get_param(5);
			local mytime = player:get_param(395);
			if mytime == 0 or start_time ~= mytime then
	   			player:set_param(395,start_time);
	   			player:InitQxzb(0,0);
			end
           local xyQxzb = #activity_qxzb_xy;
           local msg_packet = {};
           msg_packet.arra = {};
           msg_packet.state = 1;
           local targeta;
           for t=1,xyQxzb do
               targeta = {};
               targeta.type = activity_qxzb_xy[t][1];
               targeta.x = activity_qxzb_xy[t][2];
               targeta.y = activity_qxzb_xy[t][3];
               table.insert(msg_packet.arra,targeta);                             
           end
           player:SendPacketToSelf(2970,0,encode(msg_packet));
           return;
        end       
    end  		
end

function Map295_Enter(map,player,mgr)	--进入神秘商店地图
	if player:get_param(219) == 1 then		
		return;
	end
	local obj = {};
	for k,value in pairs(g_limitshop) do
		local target = {};
		target.id = k;
		local rate = value[1];
		local index = math.random(0,rate - 1);
		for i=1,#value[2] do
			if  index < value[2][i][8] then
				target.entry = value[2][i][1];
				target.stack = value[2][i][2];
				target.num   = value[2][i][3];
				target.type  = value[2][i][4];
				target.gold  = value[2][i][5];
				target.band  = value[2][i][6];
				target.send  = value[2][i][7];
				break;
			end
		end
		table.insert(obj,target);
    end
    player:InitLimitShop(encode(obj));
    player:set_param(219,1);
    
    local modle = player:GetFightModle();
    player:SetLastFightModle(modle);
    player:SetFightModle(0);
end

function Map296_Enter(map,player,mgr)
	player:SetFightModle(0);
end

function Map462_Enter(map,player,mgr)
    --城主之刃
    local format_time = tonumber(os.date("%H%M",os.time()));    
    local nQxzb = #activity_cityknife_tm;
    for i=1,nQxzb do
        if format_time >= activity_cityknife_tm[i][1] and format_time < activity_cityknife_tm[i][2] then

           local msg_packet = {};
           msg_packet.arra = {};
           msg_packet.state = 1;
           local targeta = {};
           local startTime = g_get_param(43)
           local myTime = player:get_param(650);
           if myTime == 0 or startTime ~= myTime then
           		player:InitCityKnife(0, 0)
           		player:set_param(650,startTime)
           end
           targeta.type = 2
           targeta.x = activity_cityknife_xy[1];
           targeta.y = activity_cityknife_xy[2];
           table.insert(msg_packet.arra,targeta);          
           player:SendPacketToSelf(2970,0,encode(msg_packet));
           return;
        end
    end
end

function Map136_Enter(map,player,mgr)
	if player:get_task_state(3) == 95 then
		if player:num_monster() == 0 then
			local obj = {};
			obj[7] = 1;
			obj[2] = 59;
			obj[3] = 74;
			obj[4] = 5046;
			obj[5] = 35167;
			obj[6] = "大刀侍卫";
			obj[19] = 5;
			player:mon_gen(encode(obj));

			obj[2] = 62;
			obj[3] = 71;
			obj[4] = 5046;
			obj[5] = 35167;
			obj[6] = "大刀侍卫";
			obj[19] = 5;
			player:mon_gen(encode(obj));

			obj[2] = 55;
			obj[3] = 78;
			obj[4] = 5046;
			obj[5] = 35167;
			obj[6] = "大刀侍卫";
			obj[19] = 5;
			player:mon_gen(encode(obj));

			obj[2] = 57;
			obj[3] = 68;
			obj[4] = 5047;
			obj[5] = 35168;
			obj[6] = "弓箭侍卫";
			obj[19] = 5;
			player:mon_gen(encode(obj));
			
			obj[2] = 52;
			obj[3] = 72;
			obj[4] = 5047;
			obj[5] = 35168;
			obj[6] = "弓箭侍卫";
			obj[19] = 5;
			player:mon_gen(encode(obj));

		end
	end
end

function Map3_Enter(map,player,mgr)		
	local start_time = g_get_param(2);
	local mytime = player:get_param(394);
	if mytime == 0 or start_time ~= mytime then
	   	player:set_param(394,start_time);
	   	player:InitPkBubble();
	end
    player:set_status(1101,0,100,4);	
	player:SetFightModle(1);	
	player:alert(10,0,0,"已自动切换为全体模式");
end

function Map28_Enter(map,player,mgr)
	 player:SetFightModle(1);
	 player:alert(10,0,0,"已自动切换为全体模式");	
end

function Map29_Enter(map,player,mgr)
	 player:set_status(1112,0,100,4);	
	 player:SetFightModle(1);	
	 player:alert(10,0,0,"已自动切换为全体模式");
end

function Map32_Enter(map,player,mgr)
    player:set_param(350,1);     --谁与争锋奖励类型
    player:SetFightModle(0);   
    g_broadcast(12,0,0, "<font color='#00ccff'>"..player:GetName().."</font>强势参战，争夺谁与争锋1000元宝大奖。<a href='event:M2411,1,75,122,task_track_link_npc,1,140,173,124'><u><font color='#0be140'>我也要参加</font></u></a>");
    player:alert(10,0,0,"现在为报名时间，自动切换为和平模式");
    mgr:map_playernum(0);--广播剩余人数
end

function Map220_Enter(map,player,mgr)
	if player:GetMapId() == 471 then
		local modle = player:GetFightModle();
    	player:SetLastFightModle(modle);
	end
    player:SendMonsterDieBeingTomb();
end


function Map212_Enter(map,player,mgr) --转生秘境
    g_broadcast(13,0,0,"<font color='#00ccff'>"..player:GetName().."</font>进入<font color='#00ccff'>"
        ..player:get_mapname(212).."</font>，能否获得极品装备就看他的运气了!");
    player:SendMonsterDieBeingTomb();
end

function Map213_Enter(map,player,mgr) --转生秘境
    g_broadcast(13,0,0,"<font color='#00ccff'>"..player:GetName().."</font>进入<font color='#00ccff'>"
        ..player:get_mapname(213).."</font>，能否获得极品装备就看他的运气了!");
    player:SendMonsterDieBeingTomb();
end

function Map214_Enter(map,player,mgr) --转生秘境
    g_broadcast(13,0,0,"<font color='#00ccff'>"..player:GetName().."</font>进入<font color='#00ccff'>"
        ..player:get_mapname(214).."</font>，能否获得极品装备就看他的运气了!");
    player:SendMonsterDieBeingTomb();
end

function Map215_Enter(map,player,mgr) --转生秘境
    g_broadcast(13,0,0,"<font color='#00ccff'>"..player:GetName().."</font>进入<font color='#00ccff'>"
        ..player:get_mapname(215).."</font>，能否获得极品装备就看他的运气了!");
    player:SendMonsterDieBeingTomb();
end

function Map216_Enter(map,player,mgr) --转生秘境
    g_broadcast(13,0,0,"<font color='#00ccff'>"..player:GetName().."</font>进入<font color='#00ccff'>"
        ..player:get_mapname(216).."</font>，能否获得极品装备就看他的运气了!");
    player:SendMonsterDieBeingTomb();
end

function Map217_Enter(map,player,mgr) --转生秘境
    g_broadcast(13,0,0,"<font color='#00ccff'>"..player:GetName().."</font>进入<font color='#00ccff'>"
        ..player:get_mapname(217).."</font>，能否获得极品装备就看他的运气了!");
    player:SendMonsterDieBeingTomb();
end

function Map218_Enter(map,player,mgr) --转生秘境
    g_broadcast(13,0,0,"<font color='#00ccff'>"..player:GetName().."</font>进入<font color='#00ccff'>"
        ..player:get_mapname(218).."</font>，能否获得极品装备就看他的运气了!");
    player:SendMonsterDieBeingTomb();
end

function Map219_Enter(map,player,mgr) --转生秘境
    g_broadcast(13,0,0,"<font color='#00ccff'>"..player:GetName().."</font>进入<font color='#00ccff'>"
        ..player:get_mapname(219).."</font>，能否获得极品装备就看他的运气了!");
    player:SendMonsterDieBeingTomb();
end


function Map111_Enter(map,player,mgr)

end

function Map17_Enter(map,player,mgr)
    if g_is_war_time() ==  true then
		player:SendCastleExpInfo(true);
		if player:GetGuildLeader() ~= nil then 
			player:SetFightModle(2);
		else
			player:SetFightModle(1);
		end
		local mytime = player:get_param(354);
		local now = os.time();
		if now + 1800 >= mytime then
			player:set_status(2000,0,0,0);
		end   
		local value = player:get_param(803) + 1
		player:set_param(803, value)
    end
end

function Map18_Enter(map,player,mgr)
	if g_is_war_time() ==  true then
		player:set_status(2000,0,0,0);   
		player:SendCastleExpInfo(true);
	end
end




function Map20_Enter(map,player,mgr)
	if player:get_task_state(2) == 235 then
		if player:num_monster() == 0 then
			local obj = {};
			obj[7] = 1;
			obj[2] = 17;
			obj[3] = 29;
			obj[4] = 5020;
			obj[5] = 35021;
			obj[6] = "楼兰骨弓";
			player:mon_gen(encode(obj));

			obj[2] = 22;
			obj[3] = 22;
			obj[4] = 5021;
			obj[5] = 35022;
			obj[6] = "楼兰沙蝎";
			player:mon_gen(encode(obj));

			obj[2] = 18;
			obj[3] = 18;
			obj[4] = 5022;
			obj[5] = 35023;
			obj[6] = "噬魂镰刀";
			player:mon_gen(encode(obj));
		
			obj[2] = 14;
			obj[3] = 24;
			obj[4] = 5023;
			obj[5] = 35024;
			obj[6] = "楼兰沙怪";
			player:mon_gen(encode(obj));

			obj[2] = 15;
			obj[3] = 19;

			local job = player:get_job();
			if job == 1 then
				if player:get_gender() == 1 then
					obj[4] = 5063;
				else
					obj[4] = 5064;
				end
			elseif job == 2 then
				if player:get_gender() == 1 then
					obj[4] = 5065;
				else
					obj[4] = 5066;
				end
			elseif job == 3 then
				if player:get_gender() == 1 then
					obj[4] = 5067;
				else
					obj[4] = 5068;
				end
			end
			obj[5] = 35026;
			obj[6] = "楼兰巨魔";
			obj[19] = 4;
			player:mon_gen(encode(obj));
		end
	end
end

function Map30_Enter(map,player,mgr)

end


function Map16_Enter(map,player,mgr)
	if player:get_task_state(1) == 50 then
		if player:num_monster() == 0 then
			local obj = {};
			obj[7] = 1;
			obj[2] = 24;
			obj[3] = 39;
			obj[4] = 5050;
			obj[5] = 35155;
			obj[6] = "触龙神";
			obj[19] = 4;
			player:mon_gen(encode(obj));
		end
	end
end


function Map22_Enter(map,player,mgr)
	if player:get_task_state(1) == 90 then
		if player:num_monster() == 0 then
			local obj = {};
			obj[7] = 1;
			obj[2] = 15;
			obj[3] = 16;
			local job = player:get_job();
			if job == 1 then
				obj[4] = 5051;
			elseif job == 2 then
				obj[4] = 5052;
			elseif job == 3 then
				obj[4] = 5053;
			end
			obj[5] = 35008;
			obj[6] = "尸霸统领";
			obj[19] = 4;
			player:mon_gen(encode(obj));
		end
	end
end

function Map64_Enter(map,player,mgr)
	-- local nMonid = 8201;
	-- local nMonidb = 8211;
	-- local nMonhp = 1;
	-- local nTxlevel = player:get_param(258);
	-- local nLevel = player:get_level();
	-- local montable = {
	-- 	[70] = 1;
	-- 	[71] = 1.1;
	-- 	[72] = 1.2;
	-- 	[73] = 1.3;
	-- 	[74] = 1.4;
	-- 	[75] = 1.5;
	-- 	[76] = 1.6;
	-- 	[77] = 1.7;
	-- 	[78] = 1.8;
	-- 	[79] = 1.9;
	-- 	[80] = 2;
	-- 	[81] = 2.1;
	-- 	[82] = 2.2;
	-- 	[83] = 2.5;
	-- 	[84] = 2.6;
	-- 	[85] = 2.7;
	-- 	[86] = 2.8;
	-- 	[87] = 2.9;
	-- 	[88] = 3;
	-- 	[89] = 3.1;
	-- 	[90] = 3.2;
	-- }
	-- if nLevel >= 70 and nLevel <= 90 then
	-- 	nMonhp = montable[nLevel];
	-- end
	-- if nLevel >= 91 then
	-- 	nMonhp = montable[90];
	-- end
	-- if nTxlevel == 1 then
	-- 	nMonhp = 3.5;
	-- elseif nTxlevel == 2 then
	-- 	nMonhp = 4;
	-- elseif nTxlevel == 3 then
	-- 	nMonhp = 4.5;
	-- elseif nTxlevel >= 4 then
	-- 	nMonhp = nTxlevel + 1;
	-- end
	-- if nTxlevel >= 41 then
	-- 	nMonid = 8210;
	-- 	nMonidb = 8220;
	-- elseif nTxlevel >= 31 and nTxlevel <= 40 then
	-- 	nMonid = 8209;
	-- 	nMonidb = 8219;
	-- elseif nTxlevel >= 21 and nTxlevel <= 30 then
	-- 	nMonid = 8208;
	-- 	nMonidb = 8218;
	-- elseif nTxlevel >= 16 and nTxlevel <= 20 then
	-- 	nMonid = 8207;
	-- 	nMonidb = 8217;
	-- elseif nTxlevel >= 11 and nTxlevel <= 15 then
	-- 	nMonid = 8206;
	-- 	nMonidb = 8216;
	-- elseif nTxlevel >= 4 and nTxlevel <= 10 then
	-- 	nMonid = 8205;
	-- 	nMonidb = 8215;
	-- elseif nTxlevel >= 1 and nTxlevel <= 5 then
	-- 	nMonid = 8204;
	-- 	nMonidb = 8214;
	-- elseif nLevel >= 86 and nLevel <= 120 then
	-- 	nMonid = 8203;
	-- 	nMonidb = 8213;
	-- elseif nLevel >= 78 and nLevel <= 85 then
	-- 	nMonid = 8202;
	-- 	nMonidb = 8212;
	-- end
	-- for i=1,180 do
	-- 	local obj = {};
	-- 	obj[7] = 1;
	-- 	obj[2] = 17;
	-- 	obj[3] = 57;
	-- 	obj[4] = nMonid;
	-- 	obj[5] = 35054;
	-- 	obj[6] = "盗墓贼";
	-- 	obj[9] = 1;
	-- 	obj[10] = 1000 * i;
	-- 	obj[14] = nMonhp * 100;
	-- 	obj[18] = 6;
	-- 	player:mon_gen(encode(obj));
	-- end

	-- for i=1,3 do
	-- 	local nsj = math.random(1,3);
	-- 	if nsj == 1 then
	-- 	local obj = {};
	-- 		obj[7] = 1;
	-- 		obj[2] = 17;
	-- 		obj[3] = 57;
	-- 		obj[4] = nMonidb;
	-- 		obj[5] = 35055;
	-- 		obj[6] = "携宝小妖";
	-- 		obj[9] = 1;
	-- 		obj[10] = 5000 * i;
	-- 		obj[14] = nMonhp * 100;
	-- 		obj[18] = 6;
	-- 		player:mon_gen(encode(obj));
	-- 	end
	-- end

end


function Map239_Enter(map,player,mgr)
	local temp = map - 219;
	g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>进入<font color = '#00ccff'>八大禁地</font>，极品装备随便爆。<a href='event:M2411,1,161,208,task_track_link_npc,1,155,181,129'><u><font color='#0be140'>前往禁地</font></u></a>");
end

function Map23_Enter(map,player,mgr)
	player:set_param(308,0);
end

function Map25_Enter(map,player,mgr)

end

function Map37_Enter(map,player,mgr)

end


function Map62_Enter(map,player,mgr)

end

function Map63_Enter(map,player,mgr)

end

function Map66_Enter(map,player,mgr)

end

function Map76_Enter(map,player,mgr)
end


function Map74_Enter(map,player,mgr)
end

function Map4_Enter(map,player,mgr)	
    player:add_item(20164,1,1,0,0);
    player:use_item(20164);
    player:alert(10,0,0,"自动为您穿戴鹤嘴锄");
end

function Map65_Enter(map,player,mgr)
	player:SetBodyDisplay(0,30047,1,1);
end

function Map249_Enter(map,player,mgr)
    local task = 60;
    player:set_param(799,0);--副本标志
    local nowtask = player:get_task_state(0);
    local mapid = player:GetMapId(); 
    local obj = {};

    if mapid == 259 and nowtask == task then
        player:set_task_state(task,2);  
        player:push_task_data(task,1);    
    end
    
   if mapid == 258 and player:get_task_state(74) == 1 then
        player:set_task_state(74,2);  
        player:push_task_data(74,1);    
    end   
    
    if mapid == 260 then
    	OnCompleteQest(player,11,0,1);
    end
    
	player:NewFinishCommon(6,mapid,1);
	local initTime = g_get_init_time()
	local passDay = GetTodayIsWhichDay(initTime)
	if passDay >= #g_mxiaoguai then
		passDay = #g_mxiaoguai
	end
	local conf = g_mxiaoguai[passDay]
    for k,boss_ in pairs(conf) do
        if boss_[5] == mapid then
            obj[1] = mapid;
            obj[2] = boss_[6];
            obj[3] = boss_[7];
            obj[4] = boss_[1];
            obj[5] = boss_[2];
            obj[6] = boss_[3];
            obj[7] = boss_[8];
            obj[8] = boss_[10];
            obj[19] = boss_[9];
            
         --   if mapid == 259 and nowtask == task then
         --   	obj[4] = 2295;
         --   end
            
            player:mon_gen(encode(obj));  
            
            local nid = k + 179;
            player:set_task_state(nid,0);
        end
    end
end

function Map250_Enter(map,player,mgr)
	local tasktb = {[62]={250,2294},[66]={251,2315}};		--{[任务ID]=怪物配置ID}
	local nowtask = player:get_task_state(0);
	local nowstate = player:get_task_state(nowtask);
	local entryid = 0;	 
	player:set_param(799,0);--副本标志
	for m,value in pairs(tasktb) do
    	if map == value[1] then
    		player:set_task_param(m,0,1);
    	end
    end
	if tasktb[nowtask] ~= nil and tasktb[nowtask][1] == map then	
		if nowstate ~= 2 then
			entryid = tasktb[nowtask][2];
		end
		
		player:set_task_state(nowtask,2);
		player:push_task_data(nowtask,1);
	end
   
    local obj = {};  
    for k,boss_ in pairs(g_mboss) do
        if boss_[5] == map then
            obj[1] = map;
            obj[2] = boss_[6];
            obj[3] = boss_[7];
            obj[4] = boss_[1];
            obj[5] = boss_[2];
            obj[6] = boss_[3];
            obj[7] = 1;
            obj[19] = boss_[8];
            
            if entryid ~= 0 then
            	obj[4] = entryid;
            end           
            player:mon_gen(encode(obj));  
            
            local nid = k + 259;
            if k == 107 then
            	nid = 229;
            end
            player:set_task_state(nid,0);
        end
    end
  --   player:updateDailyTask(6);
end

function Map270_Enter(map,player,mgr)
    local time = os.date("*t",os.time());
    local from = os.time({year = time.year, month = time.month, day = time.day, hour = time.hour, min = time.min, sec = time.sec});
    local to = {year = time.year, month = time.month, day = time.day, hour = nil, min = nil, sec = 0};
    to.hour = string.sub(activity_runningman[1][1],1,2);
    to.min = string.sub(activity_runningman[1][1],-2);
    mgr:map_playernum(0);--广播剩余人数
    player:alert(15,0,0,"赛跑时间为2分钟，前十名将获得丰厚奖励");
    if from + 15 > os.time(to) then
    	player:SetFightModle(0);
    	player:alert(10,0,0,"已自动切换为和平模式");
    else
    	player:SetFightModle(1);
    	player:alert(10,0,0,"已自动切换为全体模式");
    end
end


function Map440_Enter(map,player,mgr)
    if player:get_task_state(15) == 1 then
	  if player:get_task_param(15,1) < 1 then
	  player:set_task_param(15,1,player:get_task_param(15,1) + 1);
	  end
	  player:push_task_data(15,1);
	end
end


function Map277_Enter(map,player,mgr)
    if player:get_task_state(34) == 1 then
	  if player:get_task_param(34,1) < 1 then
	  player:set_task_param(34,1,player:get_task_param(34,1) + 1);
	  end
	  player:push_task_data(34,1);
	end
end


function Map280_Enter(map,player,mgr)
    if player:get_task_state(48) == 1 then
	  if player:get_task_param(48,1) < 1 then
	  player:set_task_param(48,1,player:get_task_param(48,1) + 1);
	  end
	  player:push_task_data(48,1);
	end
end

function Map473_Enter(map,player,mgr)			
	player:SetFightModle(1);	
	player:alert(10,0,0,"已自动切换为全体模式");
end

function Map475_Enter(map, player, mgr)
	local format_time = tonumber(os.date("%H%M", os.time()))
	local tm_config = g_yzwc_config.tm
	for i = 1, #tm_config do
		if format_time >= tm_config[i][1] and format_time < tm_config[i][2] then
			local startTime = g_get_param(47)
			local myTime = player:get_param(687)
			if myTime ~= startTime then
				player:set_param(687, startTime)
				player:InitYZWCInfo()
			end
			player:LeaveOrEnterSence(0);
			player:SetFightModle(5)
			player:SetLastEnterYZWCTime(os.time())
			player:alert(10,0,0,"已自动切换为阵营模式")
			return 
		end
	end
end




--============================== 新手引导副本 =================================
function Map438_Enter(map,player,mgr)						--奔跑吧兄弟
	if player:get_task_state(115) == 1 then
		player:set_task_param(115,0,1);
		player:set_task_state(115,2);	        
		SendUpdateTrackPanel_1(player,115);   
	end
	player:FinishFeats(9, 1);
	player:alert(23,0,0,"海量元宝？还有丰厚经验？！奔跑领奖员通通为你准备好了！");
	player:EventSpawnJiaRen(500000007,1,1111,1,2,1);
	player:EventSpawnJiaRen(500000008,1,1121,1,13,3);
	player:EventSpawnJiaRen(500000009,1,1112,3,2,2);
	player:EventSpawnJiaRen(500000010,1,1122,3,11,3);
	player:EventSpawnJiaRen(500000007,1,1113,5,9,3);
	player:EventSpawnJiaRen(500000007,1,1123,5,9,3);
	player:EventSpawnJiaRen(500000008,1,1114,7,7,3);
	player:EventSpawnJiaRen(500000008,1,1124,7,7,3);
	player:EventSpawnJiaRen(500000009,1,1115,9,5,3);
	player:EventSpawnJiaRen(500000009,1,1125,9,5,3);
	player:EventSpawnJiaRen(500000010,1,1116,10,4,3);
	player:EventSpawnJiaRen(500000010,1,1126,10,4,3);
	player:EventSpawnJiaRen(500000011,1,1117,11,3,3);
	player:EventSpawnJiaRen(500000011,1,1127,11,3,3);
	player:EventSpawnJiaRen(500000012,1,1118,12,2,3);
	player:EventSpawnJiaRen(500000012,1,1128,12,2,3);
	player:EventSpawnJiaRen(500000007,1,1119,13,1,3);
	player:EventSpawnJiaRen(500000007,1,1129,13,1,3);
	player:EventSpawnJiaRen(500000008,1,1120,14,0,3);
	player:EventSpawnJiaRen(500000008,1,1130,14,0,3);
	player:SendRunningSum(20);
	
	player:alert(23,0,15000,"名次越靠前奖励越丰厚，奔跑吧！兄弟！");
	local tox = 79;
    local toy = 39;
    local i = 1;
    for i = 1,6 do
        local obj = {};
        obj[1] = 438;--地图id
        obj[2] = tox + i;--x坐标
        obj[3] = toy + i;--y坐标
        obj[4] = 4001;--怪物id
        obj[5] = 8001;--形象id
        --obj[6] = "印地安纳琼斯";--怪物名字  
 	    obj[7] = 1;
        --obj[8] = 1;--随机范围
        --obj[9] = 1;
       -- obj[10] = 1;
        obj[11] = 16000;--怪物存活时间
        obj[12] = 10;
        --obj[18] = 12;
        --obj[19] = 4;    --bossring 怪物类型4boss           
        mgr:mon_gen(encode(obj)); 
        
   end
   tox = 79;
   toy = 38;
   for i = 1,6 do
        local obj = {};
        obj[1] = 438;--地图id
        obj[2] = tox + i;--x坐标
        obj[3] = toy + i ;--y坐标
        obj[4] = 4001;--怪物id
        obj[5] = 8001;--形象id
        --obj[6] = "印地安纳琼斯";--怪物名字  
 	    obj[7] = 1;
   --     obj[8] = 1;
        obj[11] = 16000;--怪物存活时间
        obj[12] = 10;
      --  obj[18] = 12;
      --  obj[19] = 4;    --bossring 怪物类型4boss           
        mgr:mon_gen(encode(obj)); 
    end
     local nametb = {	--所有玩家姓名不能重复，不然排行榜上可能出现重名
			[1]={"爆菊池塘边","百花威少","百撕不得骑姐"},
			[2]={"别理我我很烦","拔叼问青天","逗比最NB"},
			[3]={"哈利波特别大","俺村俺最长","月京舞梨"},
			[4]={"加载中请稍后","烽火戏诸侯","紫功内魔"},
			[5]={"流浪的蛤蟆","拉风的白晶晶","雪中悍刀"},
			[6]={"菊部地区有血","细长耷拉地","不喝不舒服"},
			[7]={"边渡友次子","池佐岛野香","只见和尚来洗头"},
			[8]={"龙夫耕田","琴日佑秋水","秀田武仁耕"},
			[9]={"原本琴日香","用萝卜试试","有点不会玩"}
	};  
	local n_rand = math.random(1,3);
	mgr:add_runing_rank_name(90,nametb[1][n_rand]);
	mgr:add_runing_rank_name(100,nametb[2][n_rand * 2 % 3 + 1]);
	mgr:add_runing_rank_name(110,nametb[3][n_rand * 3 % 3 + 1]);
	mgr:add_runing_rank_name(120,nametb[4][n_rand * 4 % 3 + 1]);
	mgr:add_runing_rank_name(122,nametb[5][n_rand * 5 % 3 + 1]);
	mgr:add_runing_rank_name(124,nametb[6][n_rand * 6 % 3 + 1]);
	mgr:add_runing_rank_name(126,nametb[7][n_rand * 7 % 3 + 1]);
	mgr:add_runing_rank_name(130,nametb[8][n_rand * 8 % 3 + 1]);
	mgr:add_runing_rank_name(140,nametb[9][n_rand * 9 % 3 + 1]);
end


function Map439_Enter(map,player,mgr)						--PK泡点
	if player:get_task_state(113) == 1 then
	    player:set_task_param(113,0,1);
	    player:set_task_state(113,2);	        
	    SendUpdateTrackPanel_1(player,113);   
	end
	player:FinishFeats(3, 1);
	local mapid = player:GetMapId(); 
	local obj = {};
	obj[1] = mapid;
	obj[2] = 27;
	obj[3] = 31;
	obj[4] = 2287;
	obj[5] = 9013;
	obj[6] = "妖神猪无戒";
	obj[7] = 1;
	--obj[8] = 1; 
	obj[18] = 12;
	obj[19] = 4;            
	player:mon_gen(encode(obj));
    player:set_status(1110,0,100,0);	
--	player:SetFightModle(1);	
--	player:alert(10,0,0,"已自动切换为全体模式");
	player:alert(23,0,0,"地图泡3秒，经验长3万！击杀boss还有大惊喜！");
	player:InitPkBubble();

	
	local msg = {};
	msg.exp = 0;
	player:SendPacketToSelf(2916,0,encode(msg));
end
--=============================================================================