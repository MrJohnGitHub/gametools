activity = {              --[活动ID(和客户端对应)]={"5分钟开启通知","开始时间","结束时间"}
    [1]={"0957","1000","1010"},     --PK泡点
    [2]={"1027","1030","1040"},     --血符BOSS
    [3]={"1057","1100","1110"},     --疯狂挖矿
    [4]={"1117","1120","1140"},     --元宝BOSS
    [5]={"1157","1200","1230"},     --膜拜城主
    [6]={"1227","1230","1243"},     --谁与争锋
    [7]={"1257","1300","1310"},     --羽毛BOSS
    [8]={"1327","1330","1340"},     --群雄争霸
    [9]={"1357","1400","1420"},     --极限挑战
    [10]={"1427","1430","1440"},    --宝石BOSS
    [11]={"1457","1500","1510"},    --疯狂挖矿
    [12]={"1527","1530","1540"},    --坐骑BOSS
    [13]={"1557","1600","1610"},    --PK泡点
    [14]={"1617","1620","1640"},    --怪物攻城
    [15]={"1657","1700","1710"},    --魂珠BOSS
    [16]={"1727","1730","1740"},    --群雄争霸
    [17]={"1757","1800","1830"},    --膜拜城主
    [18]={"1837","1840","1843"},    --奔跑吧兄弟
    [19]={"1857","1900","1910"},    --夺宝奇兵
    [20]={"1917","1920","1940"},    --魔族入侵
    [21]={"1957","2000","2100"},    --攻城战
    [22]={"2057","2100","2110"},    --PK泡点
	[23]={"2127","2130","2150"},    --夜战皇城
    [24]={"2157","2200","2210"},    --群雄
--  [25]={"2227","2230","2240"},    --群雄争霸
    [26]={"1957","2000","2015"}     --特戒
};


function OnSendActivityList(player,type)
    --================== 活动列表 ================ 
	local obj = {};
	local arr = {};
	local target;
	local t = tonumber(os.date("%H%M",os.time()));
	local time = os.date("*t",os.time());
	local from = os.time({year = time.year, month = time.month, day = time.day, hour = time.hour, min = time.min, sec = time.sec});
	for i=1,26 do	
		if activity[i] then
			target = {};
			target.id = i;
			
			if t< tonumber(activity[i][1]) then
				target.isOpen = 0;
				target.leftTime = 0;
			elseif t >= tonumber(activity[i][1]) and t < tonumber(activity[i][2]) then
				target.isOpen = 1;
				local to = os.time({year = time.year, month = time.month, day = time.day, hour = string.sub(activity[i][2],1,2), min = string.sub(activity[i][2],-2), sec = 0});
				target.leftTime = to - from;
			elseif t >= tonumber(activity[i][2]) and t <= tonumber(activity[i][3]) then
				target.isOpen = 2;
				local to = os.time({year = time.year, month = time.month, day = time.day, hour = string.sub(activity[i][3],1,2), min = string.sub(activity[i][3],-2), sec = 0});
				target.leftTime = to - from;
			else
				target.isOpen = 3;
				target.leftTime = 0;
			end
			
			if i == 4 and g_get_param(9) == 1 then
				target.isOpen = 3;
				target.leftTime = 0;
			elseif i == 9 and player:get_param(381) == 1 then
				target.isOpen = 3;
				target.leftTime = 0;
			elseif i == 14 and g_get_param(10) == 1 then
				target.isOpen = 3;
				target.leftTime = 0;
			end
			
			if i == 21 then
				if g_has_apply_castle() == 1 then
					table.insert(arr,target);
				end
			elseif i == 26 then
				local tday = g_get_day();
    			if tday > activity_special_start[1] and tday <= activity_special_start[2] then
    				table.insert(arr,target);
    			end
    		else
    			table.insert(arr,target);
			end	
		end
	end
	obj.list = arr;
	player:SendActivityList(encode(obj)); --2900
end

function OnSendActivityDetail(player,id)

end

function OnSendNewFbDetail(player,id)
    local time = os.date("*t",os.time());
    local from = os.time({year = time.year, month = time.month, day = time.day, hour = time.hour, min = time.min, sec = time.sec});
    local to = {year = time.year, month = time.month, day = time.day, hour = nil, min = nil, sec = 0};
    local t = tonumber(os.date("%H%M",os.time()));
    if id == 1 then
        for i=1,#activity_duobaoqibing do
            if t >= tonumber(activity_duobaoqibing[i][1]) and t < tonumber(activity_duobaoqibing[i][2]) then
                to.hour = string.sub(activity_duobaoqibing[i][2],1,2);
                to.min = string.sub(activity_duobaoqibing[i][2],-2);
                local leftTime = os.time(to) - from;
                player:NewSendFBDetail(id,leftTime,0); 
                break;
            end
        end
    elseif id == 2 then
        if t >= tonumber(activity_shuiyuzhengfeng[1][1]) and t < tonumber(activity_shuiyuzhengfeng[1][2]) then
            if string.len(activity_shuiyuzhengfeng[1][2])%2 == 1 then
                to.hour = string.sub(activity_shuiyuzhengfeng[1][2],1,1);
            else
                to.hour = string.sub(activity_shuiyuzhengfeng[1][2],1,2);
            end  
            to.min = string.sub(activity_shuiyuzhengfeng[1][2],-2);
            local leftTime = os.time(to) - from;
            player:NewSendFBDetail(id,600,leftTime); 
        else
            if t >= tonumber(activity_shuiyuzhengfeng[2][1]) and t < tonumber(activity_shuiyuzhengfeng[2][2]) then
                if string.len(activity_shuiyuzhengfeng[2][2])%2 == 1 then
                    to.hour = string.sub(activity_shuiyuzhengfeng[2][2],1,1);
                else
                    to.hour = string.sub(activity_shuiyuzhengfeng[2][2],1,2);
                end  
                to.min = string.sub(activity_shuiyuzhengfeng[2][2],-2);
                local leftTime = os.time(to) - from;
                player:NewSendFBDetail(id,leftTime,0); 
            end
        end
    elseif id == 3 then
    	for i=1,#activity_runningman do
            if t >= tonumber(activity_runningman[i][1]) and t < tonumber(activity_runningman[i][2]) then
                to.min = string.sub(activity_runningman[i][2],-2);      
                if string.len(activity_runningman[i][2])%2 == 1 then
                	to.hour = string.sub(activity_runningman[i][2],1,1);
           		else
                	to.hour = string.sub(activity_runningman[i][2],1,2);
           		end  
                --local leftTime = os.time(to) - from;
                player:NewSendFBDetail(id,os.time(to),0); 
                break;
            end
        end
    elseif id == 4 then
    	for i=1,#activity_pk do 
            if t >= tonumber(activity_pk[i][1]) and t < tonumber(activity_pk[i][2]) then
                to.hour = string.sub(activity_pk[i][2],1,2);
                to.min = string.sub(activity_pk[i][2],-2);
               -- local leftTime = os.time(to) - from;
                player:NewSendFBDetail(id,os.time(to),0); 
                break;
            end
        end
     elseif id == 5 then
    	for i=1,#activity_qxzb_tm do
            if t >= tonumber(activity_qxzb_tm[i][1]) and t < tonumber(activity_qxzb_tm[i][2]) then
                to.hour = string.sub(activity_qxzb_tm[i][2],1,2);
                to.min = string.sub(activity_qxzb_tm[i][2],-2);
                --local leftTime = os.time(to) - from;
                player:NewSendFBDetail(id,os.time(to),0); 
                break;
            end
        end
    elseif id == 6 then
    	for i=1,#activity_wk do
            if t >= tonumber(activity_wk[i][1]) and t < tonumber(activity_wk[i][3]) then
                to.hour = string.sub(activity_wk[i][3],1,2);
                to.min = string.sub(activity_wk[i][3],-2);
                local leftTime = os.time(to) - from;
                player:NewSendFBDetail(id,leftTime,0); 
                break;
            end
        end
    elseif id == 7 then   	
        player:NewSendFBDetail(7,60 + from,0);
    elseif id == 8 then   	
        player:NewSendFBDetail(8,180 + from,0);
    elseif id == 9 then
        for i=1,#activity_zhengfengduomiao do
            if t >= tonumber(activity_zhengfengduomiao[i][1]) and t < tonumber(activity_zhengfengduomiao[i][2]) then
                to.hour = string.sub(activity_zhengfengduomiao[i][2],1,2);
                to.min = string.sub(activity_zhengfengduomiao[i][2],-2);
                local leftTime = os.time(to) - from;
                player:NewSendFBDetail(id,leftTime,0); 
                break;
            end
        end
    elseif id == 10 then
        for i = 1, #activity_cityknife_tm do
            if t >= tonumber(activity_cityknife_tm[i][1]) and t < tonumber(activity_cityknife_tm[i][2]) then
                to.hour = string.sub(activity_cityknife_tm[i][2],1,2)
                to.min = string.sub(activity_cityknife_tm[i][2],-2)
                local leftTime = os.time(to) - from
                player:NewSendFBDetail(id,leftTime,0)
                break
            end
        end
    elseif id == 11 then
    	local tday = g_get_day();
    	if tday > activity_special_start[1] and tday <= activity_special_start[2] then
	    	for i = 1, #activity_special_ring do
	        	if t >= tonumber(activity_special_ring[i][1]) and t < tonumber(activity_special_ring[i][2]) then
		            to.hour = string.sub(activity_special_ring[i][2],1,2)
		            to.min = string.sub(activity_special_ring[i][2],-2)
		            player:NewSendFBDetail(id,os.time(to),0)
		            break
	        	end
	    	end
	    end
	elseif id == 12 then
		local tm_config = g_yzwc_config.tm
    	for i = 1, #tm_config do
            if t >= tonumber(tm_config[i][1]) and t < tonumber(tm_config[i][2]) then
                to.hour = string.sub(tm_config[i][2],1,2)
                to.min = string.sub(tm_config[i][2],-2)
                local leftTime = os.time(to) - from
                player:NewSendFBDetail(id,leftTime,0)
                break
            end
        end
    end
    
end

function OnSendSyzfReward(player,type)
    local time = os.date("*t",os.time());
    local now = os.time({year = time.year, month = time.month, day = time.day, hour = time.hour, min = time.min, sec = time.sec});
    
    local from = {year = time.year, month = time.month, day = time.day, hour = nil, min = nil, sec = 0};
    from.hour = string.sub(activity_shuiyuzhengfeng[3][1],1,2);
    from.min = string.sub(activity_shuiyuzhengfeng[3][1],-2);
    
    local to = {year = time.year, month = time.month, day = time.day, hour = nil, min = nil, sec = 0};
    to.hour = string.sub(activity_shuiyuzhengfeng[3][2],1,2);
    to.min = string.sub(activity_shuiyuzhengfeng[3][2],-2);
    if now > os.time(to) or now < os.time(from) then
        player:alert(10,0,0,"12:33-13:20才可领奖")
        return;
    end
   
    local flag = player:get_param(350);
    if flag == 0 then
        player:alert(10,0,0,"别骗我，要不你已经领了，要不你根本没玩")
        return;
    end
    local mapid = player:GetMapId();
    if mapid == 32 and flag == 1 then
        player:alert(10,0,0,"把他们都解决掉，奖励就给你")
        return;
    end
    if flag == 1 then
		player:add_vcoin_bind(50);    
        player:add_gamemoney_bind(1000000);
        player:alert(10,0,0,"领奖成功");
        player:set_param(350,0);
    else
        if flag == 2 then
            player:add_vcoin(1000);
            player:add_gamemoney_bind(2000000);
            g_broadcast(14,0,0,"谁与争锋胜者：" .. "<font color='#00ccff'>"..player:GetName().."</font>获得1000元宝");
            player:alert(10,0,0,"领奖成功");
            player:set_param(350,0);
        end
    end
end

function OnEnterQxzb(player,x,y)
	local xyQxzb = #activity_qxzb_xy;
	for t=1,xyQxzb do
		 if activity_qxzb_xy[t][2] == x and activity_qxzb_xy[t][3] == y and activity_qxzb_xy[t][1] == 1 then
		 	 player:alert(15,0,0,"<font color='#00ccff'>"..player:GetName().."</font>占领<font color='#be0af1'>紫色喷点</font>，每5秒获得丰富奖励");
		 	 return;
		 end 
	end
end

function OnSendQxzbReward(player,x,y)
	local nQxzb = #activity_qxzb_tm;
	local time = os.date("*t",os.time());
    local format_time = time.hour*100+time.min;
    local time_flag = false;
   	for i=1,nQxzb do
    	if format_time >= activity_qxzb_tm[i][1] and  format_time < activity_qxzb_tm[i][2] then
    		 time_flag = true;
    		 break;
    	end
    end
    if time_flag == false then
    	player:reset_activity_param(238, 0);
    	return;
    end
    local xyQxzb = #activity_qxzb_xy;
    for t=1,xyQxzb do
        if activity_qxzb_xy[t][2] == x and activity_qxzb_xy[t][3] == y then
            local n_rand = math.random(1,10000);
            local bxtbl;
            if activity_qxzb_xy[t][1] == 1 then
                bxtbl = QxzbHigh;
            else
                bxtbl = QxzbLow;
            end
            local nAllItemCount = #bxtbl;
            local now_gailv = 0;
            for j = 1, nAllItemCount do
                local nowCfg = bxtbl[j];
                now_gailv = now_gailv + nowCfg[5];
                if n_rand <= now_gailv then
                    new_add_item(player,nowCfg[1],nowCfg[2],nowCfg[3],nowCfg[4]);
                    player:alert(10,0,0,"成功获得"..QxzbText[nowCfg[1]].."x"..nowCfg[3]);
                    player:InitQxzb(nowCfg[1],nowCfg[3]);
                    if nowCfg[6] == 1 then
                    	if activity_qxzb_xy[t][1] == 1 then 
                    	 	g_broadcast(15,0,0,"【群雄争霸】<font color='#00ccff'>"..player:GetName().."</font>占据<font color='#be0af1'>紫色喷点</font>，人品爆发，获得" .. QxzbText[nowCfg[1]] .. "x" .. nowCfg[3]);
                    	else
                    		g_broadcast(15,0,0,"【群雄争霸】<font color='#00ccff'>"..player:GetName().."</font>运气不错，获得" .. QxzbText[nowCfg[1]] .. "x" .. nowCfg[3] );
                    	end
                    end
                    break;
                end
            end
            return;
        end
    end
    player:reset_activity_param(238, 0);
end



function OnSendCityKnifeReward(player)
    local pX = player:GetX(); 
    local pY = player:GetY();  
    local d_x = math.abs(activity_cityknife_xy[1] - pX);
    local d_y = math.abs(activity_cityknife_xy[2] - pY);
    if d_x > 1 or d_y > 1 then 
        player:reset_activity_param(462, 0);
        return;
    end
    local time = os.date("*t",os.time());
    local format_time = time.hour*100+time.min;
    local from = os.time({year = time.year, month = time.month, day = time.day, hour = time.hour, min = time.min, sec = time.sec});
    local nCzzr = #activity_cityknife_tm;
    local timeflag = false;
   	for i=1,nCzzr do
    	if format_time >= activity_cityknife_tm[i][1] and format_time < activity_cityknife_tm[i][2] then
    		 timeflag = true;
    		 break;
    	end
    end 
    if timeflag == false then
    	player:reset_activity_param(462, 0);
        return;
    end
    local nLevelTypeCount = #activity_cityknife     
    local nLevel = player:GetLevel();
    for i = 1, nLevelTypeCount do
        local config = activity_cityknife[i]
        if config.minlevel <= nLevel and config.maxlevel >= nLevel then
            local nNowRate = math.random(1,10000);
            local awards = config.awards
            local nAwardsCount = #awards
            local nIndex = 1
            for j = 1, nAwardsCount do
                local tNowAward = awards[j]
                nNowRate = nNowRate - tNowAward[2]
                if nNowRate <= 0 then
                    local nAwardType = tNowAward[1]
                    if nAwardType == 0 then
                       -- print("\n*** player type:"..type(player))
                        if player:num_bag_black(0) == 0 then
                            player:alert(10,0,0,"您的背包不足!")
                            return;
                        end
                    end
                    new_add_item(player,nAwardType,tNowAward[3],tNowAward[4],0);
                    if nAwardType == 100 then
                    	g_broadcast(15,0,0,"【城主之刃】<font color='#00ccff'>"..player:GetName().."</font>鸿运当头，成功获得" .. tNowAward[4] .. "绑元");
                    end
                    player:InitCityKnife(nAwardType, tNowAward[4])
                    player:alert(10,0,0,"成功获得"..tNowAward[5].."x"..tNowAward[4]);
                    player:reset_activity_param(462, from + 5);
                    local flyType = nil 
                    if nAwardType == 101 then
                        flyType = 0
                    elseif nAwardType == 100 then
                        flyType = 1
                    end


                    if flyType ~= nil then
                        player:SendVcoinFly(tNowAward[4], 1, flyType)
                    end
                    return;
                end
            end
        end
    end 
     player:alert(10,0,0,"您的背包不足")
end

function DigInfoInfo(player)
	local vip = player:get_player_type();
	local login = player:get_login_days();
	local param366 = player:get_param(366);
	
	local mgr = {};
	local tar = {};
	for i=1,7 do
		local flag = 0;
		local up = 0;
		local param = bitget(param366,i);
		local level = player:get_param(366 + i) + 1;
		if param == 0 then
			level = 0;
		end
		if g_miner_info[i][level] == nil then
			flag = 3;
		else
			if vip >= g_miner_info[i][level][4] or login >= g_miner_info[i][level][5] then
				up = 1;
			end
			if up == 1 and param == 0 then
				flag = 1;
			elseif up == 1 and g_miner_info[i][level] ~= nil then
				flag = 2;
			elseif up == 0 and param == 1 then
				flag = 3;
			end
		end
		
		local obj = {};
		obj.flag  = flag;
		obj.num   = player:get_task_param(366 + i,0);
		obj.level = level;
		obj.state = player:get_task_state(366 + i);
		table.insert(mgr,obj);
	end
	tar.dig = mgr;
	tar.hasklick = player:get_param(249);
	player:SendPacketToSelf(2918,0,encode(tar));
end

function DigInfo(player,type,index)

	if type == 1 then
		if g_miner_info[index] == nil then
			return;
		end
		local param366 = player:get_param(366);
		local state = bitget(param366,index);
		if state ~= 0 then
			player:alert(10,0,0,"矿工已激活");
			return;
		end
		local vip = player:get_player_type();
		local login = player:get_login_days();
		
		if vip < g_miner_info[index][0][4] and login < g_miner_info[index][0][5] then
			if g_miner_info[index][0][6] > 0 then
				local money = player:NewGetGold(g_miner_info[index][0][8]);
				if money < g_miner_info[index][0][6] then
					player:alert(10,0,0,"激活条件不足");
					return;
				end
				player:NewDeductGold(g_miner_info[index][0][8],g_miner_info[index][0][6],103);
			else
				player:alert(10,0,0,"激活条件不足");
				return;
			end
		end
		player:set_param(366,bitset(param366,index));
		player:alert(10,0,0,"成功激活矿工");
	elseif type == 2 then
		local param366 = player:get_param(366);
		local state = bitget(param366,index);
		if state == 0 then
			player:alert(10,0,0,"矿工未激活");
			return;
		end

		local param = player:get_task_param(366 + index,0);
		if param == 0 then
			player:alert(10,0,0,"没有奖励可领");
			return;
		end

		player:set_param(249,1);
		player:set_task_param(366 + index,0,0);
		local level = player:get_param(366 + index);
		new_add_item(player,g_miner_info[index][level][3],0,param,0);	
		player:alert(10,0,0,"领取成功，获得"..QxzbText[g_miner_info[index][level][3]].."x"..param);
	elseif type == 3 then
		local param366 = player:get_param(366);
		local state = bitget(param366,index);
		if state == 0 then
			player:alert(10,0,0,"矿工未激活");
			return;
		end
		local level = player:get_param(366 + index) + 1;
		if g_miner_info[index][level] == nil then
			player:alert(10,0,0,"矿工已满级");
			return;
		end
		local vip = player:get_player_type();
		local login = player:get_login_days();
		
		if vip < g_miner_info[index][level][4] and login < g_miner_info[index][level][5] and g_miner_info[index][level][6] > 0 then
			local money = player:NewGetGold(g_miner_info[index][level][8]);
			if money < g_miner_info[index][level][6] then
				player:alert(10,0,0,"升级条件不足");
				return;
			end
			player:NewDeductGold(g_miner_info[index][level][8],g_miner_info[index][level][6],103);
		end
		player:set_param(366 + index,level);
		player:alert(10,0,0,"矿工升级成功");
	elseif type == 10 then
		local state = player:get_param(366);
		for i=1,7 do
			if bitget(state,i) ~= 0 then
				local level = player:get_param(366 + i);
				local param = player:get_task_param(366 + i,0);
				if param < g_miner_info[i][level][1] then
					local times = player:get_task_state(366 + i) + index;	
					if times < g_miner_info[i][level][7] then
						player:set_task_state(366 + i,times);
					else
						local num = math.floor(times / g_miner_info[i][level][7]);
						player:set_task_state(366 + i,times % g_miner_info[i][level][7]);
						if param + g_miner_info[i][level][2] * num > g_miner_info[i][level][1] then
							player:set_task_param(366 + i,0,g_miner_info[i][level][1]);
						else
							player:set_task_param(366 + i,0,param + g_miner_info[i][level][2] * num);
						end
					end
				end
			end
		end
	end
	
	DigInfoInfo(player);
end
