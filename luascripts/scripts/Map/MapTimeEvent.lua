
--固定点刷怪
local function IsThisMapCanFixedPointSumon(map_id)
    local conf = g_fixedPointRefreshMonster[map_id]
    if conf then
      return true
    end

    return false
end

local function IsCanFristFixedPointSummon(map_id, hour, min, sec)
    local conf =  g_fixedPointRefreshMonster[map_id]
    local begin_random_t = conf.begin_random_t
    if begin_random_t == nil then
        return
    end

    local t1 = hour * 3600 + min * 60 + sec
    local t2 = begin_random_t.hour * 3600 + begin_random_t.min * 60 + begin_random_t.sec

    if t1 >= t2 then
        return true
    end

    return false
end

local function FixedPointRandomMonster(mgr, map_id)
    local conf =  g_fixedPointRefreshMonster[map_id]
    local boss_list  = conf and conf.boss_list
    if boss_list == nil then
        return
    end
    local weightSum = 0
    for k, v in pairs(boss_list) do
        weightSum = weightSum + v.weight
    end

    local random = math.random(1, weightSum)
    local iCount = 0
    local hitIndex = 0
    for i = 1, #boss_list do
        iCount = iCount + boss_list[i].weight
        if random <= iCount then
            hitIndex = i
            break
        end
    end
    local bosstype = boss_list[hitIndex].boss_type
    local obj = 
    {
        [1] = map_id, --地图id
        [2] = boss_list[hitIndex].x,  --x坐标
        [3] = boss_list[hitIndex].y,  --y坐标
        [4] = boss_list[hitIndex].id,  --怪物id
        [5] = boss_list[hitIndex].facad,  --形象id
        [6] = boss_list[hitIndex].name,  --怪物名字
        [7] = 1,  --怪物数量
        [8] = boss_list[hitIndex].radius,  --刷怪半径
        [19] = bosstype       
   }
  mgr:mon_gen(encode(obj))

  if boss_list[hitIndex].isBrocast == 1 then
      local brocastStr = boss_list[hitIndex].brocastStr
      g_broadcast(12, 0, 0, brocastStr)
  end
  local monsterid = boss_list[hitIndex].id
  mgr:AddFixedPointSummon(monsterid)

end

function FixedPointSummon(mgr, hour, min, sec)
    do
      return 
    end
    local map_id = mgr:GetMapId()
    if IsThisMapCanFixedPointSumon(map_id) == false then
        return
    end

    if mgr:IsEverFixedPointSummon() == 1 then
        local deadTime, monsterid = mgr:GetFixedPointSummonDeadTime()
        if deadTime == 0 then
            return 
        end
        local conf = g_fixedPointRefreshMonster[map_id]
        local cur = os.time()
        local diff = cur - deadTime
        local range = conf.re_random_t and conf.re_random_t[monsterid] and conf.re_random_t[monsterid].min_t
        if range == nil then
            return 
        end

        range = range * 60
        if diff >= range then
            FixedPointRandomMonster(mgr, map_id)
        end
    else
        if IsCanFristFixedPointSummon(map_id, hour, min, sec) then
            FixedPointRandomMonster(mgr, map_id)
        end
    end
end

--地图秒定时器  需要在c++里面开放地图
function Map3_OnTimeEvent(mgr,hour,min,sec)
    local format_time = hour * 100 + min;
    for i = 1,#activity_pk do
        if format_time >= activity_pk[i][1] and format_time < activity_pk[i][2] and mgr:get_activity_flag() == 0 then
            local obj = {};
            obj[2] = 27;
            obj[3] = 31;
            obj[4] = 2015;
            --obj[5] = 9002;
            obj[5] = 9013;
            --obj[6] = "暗黑修罗";
            obj[6] = "妖神猪无戒";
            obj[7] = 1;
           -- obj[8] = 1;
          --不需要存活时间
          --  obj[11] = 300000; 
            obj[18] = 12;
            obj[19] = 4;            
            mgr:mon_gen(encode(obj));   
            mgr:activity_start(); 
            g_broadcast(14,0,0,"PK泡点正式开启，丰富奖励等着你");
            mgr:set_activity_flag(1);
            break;
        elseif format_time == activity_pk[i][2] and mgr:get_activity_flag() == 1 then
            mgr:activity_end();   
            mgr:set_activity_flag(0);
            break;
        end
    end
end

function Map17_OnTimeEvent(mgr,hour,min,sec)
    YuanBaoBossRefreshConditions(mgr,hour,min,sec)
--[[
	local union_day = g_get_union_day()
	local param77 = g_get_param(77);
	local param78 = g_get_param(78);
	if param78 == 0 and param77 == 0 and hour == 20 and min == 00 then
		if union_day == 1 then
    		local obj = {};
        	obj[2] = 137;--x
        	obj[3] = 192;--y
        	obj[4] = 7090;--id
        	obj[5] = 9046;--形象
        	obj[6] = "合服BOSS";
        	obj[7] = 1;
     	 -- obj[8] = 1;
    	--  obj[11] = 300000; --存活时间
        	obj[18] = 12;
        	obj[19] = 4;   --boss血条
        	mgr:mon_gen(encode(obj)); 
        	g_broadcast(12,0,0,"<font color='#ff0000'>合服BOSS</font>出现在<font color='#00ccff'>天星城</font><font color='#0be140'>");  
        	g_set_param(77,1);
        	g_set_param(78,1);
        elseif union_day == 1 then
        	local obj = {};
        	obj[2] = 138;--x
        	obj[3] = 192;--y
        	obj[4] = 7091;--id
        	obj[5] = 9045;--形象
        	obj[6] = "合服BOSS";
        	obj[7] = 1;
     	 -- obj[8] = 1;
    	--  obj[11] = 300000; --存活时间
        	obj[18] = 12;
        	obj[19] = 4;   --boss血条
        	mgr:mon_gen(encode(obj));  
        	g_broadcast(12,0,0,"<font color='#ff0000'>合服BOSS</font>出现在<font color='#00ccff'>天星城</font><font color='#0be140'>"); 
        	g_set_param(77,1);
        	g_set_param(78,1);
        elseif union_day == 3 then
        	local obj = {};
        	obj[2] = 137;--x
        	obj[3] = 191;--y
        	obj[4] = 7092;--id
        	obj[5] = 9020;--形象
        	obj[6] = "合服BOSS";
        	obj[7] = 1;
     	 -- obj[8] = 1;
    	--  obj[11] = 300000; --存活时间
        	obj[18] = 12;
        	obj[19] = 4;   --boss血条
        	mgr:mon_gen(encode(obj));   
        	g_broadcast(12,0,0,"<font color='#ff0000'>合服BOSS</font>出现在<font color='#00ccff'>天星城</font><font color='#0be140'>");
        	g_set_param(77,1);
        	g_set_param(78,1);
  		end    	
     end
	 --]]
end

function Map462_OnTimeEvent(mgr,hour,min,sec)
	local format_time = hour * 100 + min;
    	local nCzzr = #activity_cityknife_tm;
   		for i=1,nCzzr do
       		if format_time >= activity_cityknife_tm[i][1] and format_time < activity_cityknife_tm[i][2] and mgr:get_activity_flag() == 0 then
           		local xyQxzb = #activity_cityknife_xy;
           		local msg_packet = {};
           		msg_packet.arra = {};
    		    msg_packet.state = 1;
    		    local targeta;
    		    targeta = {};
    		    targeta.type = 2;
    		    targeta.x = activity_cityknife_xy[1];
    		    targeta.y = activity_cityknife_xy[2];
    		    table.insert(msg_packet.arra,targeta);    
    		    mgr:activity_start()
    		    g_map_alert(462,10,0,0,encode(msg_packet));
    		    mgr:set_activity_flag(1);
    		    break;
        	elseif format_time == activity_cityknife_tm[i][2] and mgr:get_activity_flag() == 1 then
    		    local msg_packet = {};
                msg_packet.arra = {};
             	local targeta = {}
              	targeta.type = 2;
              	targeta.x = activity_cityknife_xy[1];
              	targeta.y = activity_cityknife_xy[2];
              	table.insert(msg_packet.arra,targeta); 
    		    msg_packet.state = 0;
    		    g_map_alert(462,10,0,0,encode(msg_packet)); 
    		    mgr:activity_end();
    		    mgr:set_activity_flag(0);
    		    break;
        	end
        end
end

function Map28_OnTimeEvent(mgr,hour,min,sec)
	local format_time = hour*100 + min;
		 for i=1,#activity_duobaoqibing do
	 	 	if format_time >= activity_duobaoqibing[i][1] and format_time < activity_duobaoqibing[i][2] and mgr:get_activity_flag() == 0 then
	     		local obj = {};
           		obj[1] = 28;--地图id
          		obj[2] = 26;--x坐标
           		obj[3] = 31;--y坐标
           		obj[4] = 2016;--怪物id
           		-- obj[5] = 9001;--形象id
              obj[5] = 9015;--形象id
           		-- obj[6] = "印地安纳琼斯";--怪物名字 
              obj[6] = "上古牛魔神";--怪物名字 
 	       		obj[7] = 1;
           		obj[8] = 1;
    --      	obj[11] = 300000;--怪物存活时间
           		obj[18] = 12;
           		obj[19] = 4;    --bossring 怪物类型4boss           
           		mgr:mon_gen(encode(obj)); 
           		mgr:activity_start(); 
           		mgr:set_activity_flag(1);
           		break;
       	 	elseif format_time == activity_duobaoqibing[i][2] and mgr:get_activity_flag() == 1 then
           		mgr:activity_end();
           		mgr:set_activity_flag(0); 
	       		break;
         	end
         end       
    
    for i = 1, #activity_duobaoqibing do
    	if format_time > activity_duobaoqibing[i][1] and format_time < activity_duobaoqibing[i][2] then
    		local endHour = math.floor(activity_duobaoqibing[i][2] / 100)
    		local endMin = activity_duobaoqibing[i][2] - endHour * 100
    		local now = os.time()
    		local curDate = os.date("*t", now)
    		curDate.hour = endHour
    		curDate.min = endMin
    		curDate.sec = 0
    		local endTimestamp = os.time(curDate)
    		local notifyTime = endTimestamp - 30
    		local notifyMsg = "持箱人请在30秒内打开宝箱"
    		if now == notifyTime then
    			for i = 1, 3 do
    				mgr:NewSendMapSystemNotice(15, notifyMsg)
    			end
    		end
    		break
    	end
    end
    
end

function Map238_OnTimeEvent(mgr,hour,min,sec)
	local format_time = hour*100 + min;
		local nQxzb = #activity_qxzb_tm;
   		for i=1,nQxzb do
       		if format_time >= activity_qxzb_tm[i][1] and format_time < activity_qxzb_tm[i][2] and mgr:get_activity_flag() == 0 then
       			g_broadcast(14,0,0,"<font color = '#ffea00'>群雄争霸正式开启，请大家踊跃参加</font>");
       			local time = os.date("*t",os.time());
    			local from = os.time({year = time.year, month = time.month, day = time.day, hour = time.hour, min = time.min, sec = time.sec});
        		g_set_param(5,from);
        		mgr:set_qxzb(0,"");
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
           		g_map_alert(238,10,0,0,encode(msg_packet));
           		mgr:set_activity_flag(1);
           		break;
           	elseif format_time == activity_qxzb_tm[i][2] - 1 and sec == 0 then
           		mgr:NewSendMapSystemNotice(15,"活动即将结束，明天同一时间再会");
       		elseif format_time == activity_qxzb_tm[i][2] and mgr:get_activity_flag() == 1 then
          		local xyQxzb = #activity_qxzb_xy;
           		local msg_packet = {};
           		msg_packet.state = 0;
         		g_map_alert(238,10,0,0,encode(msg_packet)); 
           		mgr:activity_end(); 
           		mgr:set_activity_flag(0);
           		break;
        	end
        end          
end

function Map32_OnTimeEvent(mgr,hour,min,sec)
	local format_time = hour * 100 + min;
		 if format_time >= activity_shuiyuzhengfeng[1][1] and format_time < activity_shuiyuzhengfeng[2][2] and mgr:get_activity_flag() == 0 then
		 	g_broadcast(14,0,0,"<font color = '#ffea00'>谁与争锋活动开启，请大家踊跃参加</font>");
       	 	g_set_param(0,0);  
       	 	mgr:set_activity_flag(1);
   		 end
   		 if format_time == activity_shuiyuzhengfeng[2][1] and mgr:get_activity_flag() == 1 then
    	    mgr:map_set_pk(1);  --设置pk模式
         	mgr:map_reward();   --设置奖励
         	g_set_param(0,1);   --设置活动正式开始阶段
         	mgr:NewSendMapSystemNotice(15,"活动正式开启！战斗吧！");
         	mgr:NewSendMapSystemNotice(13,"活动正式开启！战斗吧！");
         	mgr:NewSendMapSystemNotice(10,"比赛开始，自动切换为全体模式");
         	mgr:set_activity_flag(2);
    	 end
   		 if format_time == activity_shuiyuzhengfeng[2][2]- 5 and sec == 0 then
        	mgr:NewSendMapSystemNotice(15,"抓紧时间！胜利就在眼前！！");
   		 end
   		 if format_time == activity_shuiyuzhengfeng[2][2]- 3 and sec == 0 then
        	mgr:NewSendMapSystemNotice(15,"还剩3分钟！大奖不容错过！！");
   		 end
   		 if format_time == activity_shuiyuzhengfeng[2][2]- 1 and sec == 0 then
        	mgr:NewSendMapSystemNotice(15,"最后1分钟！燃烧你的小宇宙吧！！");
   		 end
   		 if format_time == activity_shuiyuzhengfeng[2][2] and mgr:get_activity_flag() == 2 then
        	g_set_param(0,2); 
        	mgr:activity_end(); 
        	mgr:set_activity_flag(0);
   		 end
end

function Map270_OnTimeEvent(mgr,hour,min,sec)
	local format_time = hour * 100 + min;
		for i = 1,#activity_runningman do
    		if format_time >= activity_runningman[i][1] and format_time < activity_runningman[i][2] and mgr:get_activity_flag() == 0 then
    			g_broadcast(14,0,0,"<font color = '#ffea00'>活动正式开启！奔跑吧！</font>");
        		local time = os.date("*t",os.time());
    			local from = os.time({year = time.year, month = time.month, day = time.day, hour = time.hour, min = time.min, sec = time.sec});
        		mgr:clear_runningman_name();
        		g_set_param(21,from);
        		for i = 22,32 do
        			g_set_param(i,0);
        		end
        		
        		local tox = 79;
        		local toy = 39;
        		for i = 1,6 do
        			local obj = {};
           			obj[1] = 270;--地图id
          			obj[2] = tox + i;--x坐标
           			obj[3] = toy + i;--y坐标
           			obj[4] = 4001;--怪物id
           			obj[5] = 8001;--形象id
           			--obj[6] = "印地安纳琼斯";--怪物名字  
 	       			obj[7] = 1;
           		--	obj[8] = 1;
           			obj[9] = 1;
           			obj[10] = 1;
          			obj[11] = 15000;--怪物存活时间
           			obj[12] = 10;     
           			mgr:mon_gen(encode(obj)); 
           		end
           		
           		tox = 79;
        		toy = 38;
           		for i = 1,6 do
        			local obj = {};
           			obj[1] = 270;--地图id
          			obj[2] = tox + i;--x坐标
           			obj[3] = toy + i;--y坐标
           			obj[4] = 4001;--怪物id
           			obj[5] = 8001;--形象id
           			--obj[6] = "印地安纳琼斯";--怪物名字  
 	       			obj[7] = 1;
          			obj[11] = 15000;--怪物存活时间
           			obj[12] = 10;     
           			mgr:mon_gen(encode(obj)); 
           		end
           		mgr:set_activity_flag(1);
        		break;
        	elseif format_time == activity_runningman[i][1] and sec == 15 then
        		mgr:NewSendMapSystemNotice(15,"活动正式开启！奔跑吧！");
				mgr:NewSendMapSystemNotice(13,"活动正式开启！奔跑吧！");
        		break;
        	elseif format_time == activity_runningman[i][2] - 1 and sec == 30 then
				mgr:NewSendMapSystemNotice(15,"紧张刺激的奔跑活动又要结束了。明天18：40再约");
        		break;	
      	    elseif format_time == activity_runningman[i][2] and mgr:get_activity_flag() == 1 then
        		mgr:activity_end();
        		mgr:set_activity_flag(0);
        		break;
        	end
   		 end
end

function Map29_OnTimeEvent(mgr,hour,min,sec)
    local format_time = hour * 100 + min;         
        for i=1,#activity_zhengfengduomiao do
            if format_time >= activity_zhengfengduomiao[i][1] and format_time < activity_zhengfengduomiao[i][2] and mgr:get_activity_flag() == 0 then
                local obj = {};
                obj[1] = 29;--地图id
                obj[2] = 29;--x坐标
                obj[3] = 29;--y坐标
                obj[4] = 2017;--怪物id
                -- obj[5] = 9001;--形象id
                obj[5] = 9021;--形象id
                --obj[6] = "争分霸主";--怪物名字  
                obj[6] = "踏炎金晶兽";--怪物名字  
                obj[7] = 1;
                obj[8] = 1;
           --     obj[11] = 300000;--怪物存活时间
                obj[18] = 12;
                obj[19] = 4;    --bossring 怪物类型4boss           
                mgr:mon_gen(encode(obj));  
                
                obj = {};
                obj[1] = 29;
                obj[2] = 14;
                obj[3] = 32;
                obj[4] = 2018;
                obj[5] = 9021;
                obj[6] = "踏炎金晶兽";   
                obj[7] = 1;
                obj[8] = 1;
            --    obj[11] = 300000;
                obj[18] = 12;
                obj[19] = 4;                
                mgr:mon_gen(encode(obj));   
                mgr:activity_start(); 
                mgr:set_activity_flag(1);
                break;
             end
             if format_time == activity_zhengfengduomiao[i][2] and mgr:get_activity_flag() == 1 then
                mgr:activity_end(); 
                mgr:set_activity_flag(0);
                break;
             end       
        end 
end

function Map295_OnTimeEvent(mgr,hour,min,sec)
    local format_time = hour * 100 + min;           
        for i=1,#activity_migong do
            if format_time == activity_migong[i][1] and sec == 0 then
            	g_broadcast(15,0,0,"<font color='#00ccff'>极限挑战</font>活动还有5分钟开启，请各位少侠做好准备！");
              	return;
            end
            if format_time == activity_migong[i][2] and sec == 0 then
            	g_broadcast(15,0,0,"<font color='#00ccff'>极限挑战</font>活动还有1分钟开启，请各位少侠做好准备！");
              	return;
            end
            if format_time >= activity_migong[i][3] and format_time < activity_migong[i][4] and mgr:get_activity_flag() == 0 then
            	g_broadcast(15,0,0,"<font color='#00ccff'>极限挑战</font>活动正式开启，请各位少侠前往挑战NPC进入活动地图！");
            	g_broadcast(13,0,0,"<font color='#00ccff'>极限挑战</font>活动正式开启，请各位少侠前往挑战NPC进入活动地图！ <u><a href='event:M2411,1,68,112,task_track_link_npc,1,137,68,149'><font color='#28ff28'>前往参与</font></a></u>");
        		g_initmaze();
        		mgr:set_activity_flag(1);
              	return;
            end 
            if format_time == activity_migong[i][4] and mgr:get_activity_flag() == 1 then
            	g_broadcast(15,0,0,"<font color='#00ccff'>极限挑战</font>活动结束！");           
              	mgr:set_activity_flag(0);
              	return;
            end    
            if format_time == activity_migong[i][5] and sec <= 3 then
              	mgr:maze_activity_end();           
              	return;
            end   
        end 
end

function Map316_OnTimeEvent(mgr,hour,min,sec)
    local format_time = hour * 100 + min;           
    for i=1,#activity_migong do
    	if format_time == activity_migong[i][5] and sec <= 3 then
        	mgr:activity_end(); 
            return;
        end       
    end 
end

function Map4_OnTimeEvent(mgr,hour,min,sec)
    local format_time = hour * 100 + min;    
        for i=1,#activity_wk do
        	if format_time >= activity_wk[i][1] and format_time < activity_wk[i][3] and mgr:get_activity_flag() == 0 then
				g_broadcast(14,0,0,"<font color = '#ffea00'>疯狂挖矿正式开启，请大家踊跃参加！</font>");
				mgr:set_activity_flag(1);
				return;
			end
        	if format_time == activity_wk[i][2] and sec == 0 then
        		mgr:NewSendMapSystemNotice(15,"活动即将结束，明天同一时间再会！");
        		return;
        	end
            if format_time == activity_wk[i][3] and mgr:get_activity_flag() == 1 then
              	mgr:activity_end(); 
              	mgr:set_activity_flag(0);
              	return;
            end       
        end 
end

function Map473_OnTimeEvent(mgr,hour,min,sec)
    local format_time = hour * 100 + min;
    local tday = g_get_day();

    if tday > activity_special_start[1] and tday <= activity_special_start[2] then
	    for i=1,#activity_special_ring do
	    	if format_time >= activity_special_ring[i][1] and format_time < activity_special_ring[i][2] and mgr:get_activity_flag() == 0 then
	    		for j=1,#g_special_ring do
	    			local obj = {};
	            	obj[1]  = 473;--地图id
	            	obj[2]  = g_special_ring[j][4];--x坐标
	                obj[3]  = g_special_ring[j][5];--y坐标
	                obj[4]  = g_special_ring[j][1];--怪物id
	                obj[5]  = g_special_ring[j][8];--形象id 
	                obj[6]  = g_special_ring[j][2];--怪物名字  
	                obj[7]  = g_special_ring[j][3];--怪物数量
	                obj[8]  = g_special_ring[j][6];--刷怪半径
	                obj[9]	= 2;
	                obj[10] = g_special_ring[j][7];--延迟刷怪
	                obj[11] = 90000;			   --存活时间       
	                mgr:mon_gen(encode(obj));
	                
	                if g_special_ring[j][1] == 7023 or g_special_ring[j][1] == 7024 then
	                	SendCenterTextToWorld(15,0,g_special_ring[j][7],"【全民特戒】特戒BOSS<font color='#00ccff'>"..g_special_ring[j][2].."</font>出现了，击杀BOSS争夺神秘特戒碎片吧！");
	                end
	    		end	
	    		g_broadcast(14,0,0,"<font color='#00ccff'>全民特戒</font>如火如荼的展开啦，击杀小怪抢夺碎片，一起参与活动吧！");
	    		g_broadcast(13,0,0,"<font color='#00ccff'>全民特戒</font>如火如荼的展开啦，击杀小怪抢夺碎片，一起参与活动吧！ <u><a href='event:M2411,1,102,74,task_track_link_npc,1,133,102,74'><font color='#28ff28'>前往参与</font></a></u>");
				mgr:set_activity_flag(1);
				return;
			end
	        if format_time == activity_special_ring[i][2] and mgr:get_activity_flag() == 1 then
	          	mgr:activity_end(); 
	          	mgr:set_activity_flag(0);
	          	return;
	        end       
	    end
	elseif mgr:get_activity_flag() == 1 then
		 mgr:activity_end(); 
	     mgr:set_activity_flag(0);
	     return;
	end
end

function Map475_OnTimeEvent(mgr,hour,min,sec)
	 local format_time = hour * 100 + min;
	 local tm_config = g_yzwc_config.tm
	 for i = 1, #tm_config do
	 	local tm_info = tm_config[i]
	 	if format_time >= tm_info[1] and format_time < tm_info[2] and mgr:get_activity_flag() == 0 then
	 		local aliveTime = 20 * 60 * 1000 - 30 * 1000
	 		for j = 1, #g_yzwc_mon_config do
	 			local obj = {
	 				[1] = 475, --地图id
	 				[2] = g_yzwc_mon_config[j][4],	--x坐标
	 				[3] = g_yzwc_mon_config[j][5],	--y坐标
	 				[4] = g_yzwc_mon_config[j][1],	--怪物id
	 				[5] = g_yzwc_mon_config[j][8],	--形象id
	 				[6] = g_yzwc_mon_config[j][2],	--怪物名字
	 				[7] = g_yzwc_mon_config[j][3],	--怪物数量
	 				[8] = g_yzwc_mon_config[j][6],	--刷怪半径
	 				[9] = 2,
	 				[10] = g_yzwc_mon_config[j][7],	--延迟刷怪
	 				[11] = aliveTime,  				--存活时间                   
	 			}
	 			mgr:mon_gen(encode(obj))
	 		end
	 		mgr:activity_start()
	 		mgr:set_activity_flag(1)
      g_broadcast(15,0,0,"【夜战王城】前往战场击杀敌对阵营的玩家，掠夺积分竞争排行!")
	 		return 
	 	end
	 	
	 	if format_time >= tm_info[1] and format_time < tm_info[2] and mgr:get_activity_flag() == 1 then
		 	local now = os.time()
		 	local next = tonumber(os.date("%H%M", now + 30))
		 	if next >= tm_info[2] and mgr:get_activity_flag() == 1 then
		 		--广播消息给给前端
		 		--告诉前端当前距离结束时间还有30秒
		 		mgr:NotifyYzwcWillBeOver()
		 		mgr:set_activity_flag(2)
		 		return 
		 	end
		 	
		 	local lastChange = mgr:GetLastChangeCampTimeStamp()
		 	if lastChange == 0 then
		 		local cur = tonumber(os.date("%H%M", now))
		 		if cur - tm_info[1] >= 5 then
		 			mgr:SetLastChangeCampTimeStamp(now)
		 			mgr:ChangeCamp()
		 		else
		 			cur = tonumber(os.date("%H%M", now + 10))
		 			if cur - tm_info[1] >= 5 and mgr:GetFirstNotifyChangeCampFlag() == 0 then
		 				local retMsg = {flag = 0}
		 				mgr:MapBroadcastMessage(4648, encode(retMsg))
		 				mgr:SetFirstNotifyChangeCampFlag(1)
		 			end
		 		end
		 	else
		 		local diff = now - lastChange
		 		if diff >= 300 then
		 			mgr:SetLastChangeCampTimeStamp(now)
		 			mgr:ChangeCamp()
		 		elseif diff == 290 then
		 			local retMsg = {flag = 0}
		 			mgr:MapBroadcastMessage(4648, encode(retMsg))
		 		end
		 	end
	 	end
	 	
	 	if format_time >= tm_info[2] and mgr:get_activity_flag() == 2 then 
	 		mgr:activity_end()
	        mgr:set_activity_flag(0)
	        return
	 	end
	 	
	 end
end

function Map501_OnTimeEvent(mgr,hour,min,sec)
	local format_time = hour * 100 + min;
	local start_time = 19 * 100 + 20;
	local end_time = 19 * 100 + 50;

	if g_get_day() < 15 then
		return;
	end
	if format_time >= start_time and format_time < end_time and mgr:get_activity_flag() == 0 then
		local aliveTime = 30 * 60 * 1000;
	 	for j = 1, #g_travel_mon_config do
	 		local obj = {
	 			[1] = 501, --地图id
	 			[2] = g_travel_mon_config[j][4],	--x坐标
	 			[3] = g_travel_mon_config[j][5],	--y坐标
	 			[4] = g_travel_mon_config[j][1],	--怪物id
	 			[5] = g_travel_mon_config[j][8],	--形象id
	 			[6] = g_travel_mon_config[j][2],	--怪物名字
	 			[7] = g_travel_mon_config[j][3],	--怪物数量
	 			[8] = g_travel_mon_config[j][6],	--刷怪半径
	 			[9] = 2,
	 			[10] = g_travel_mon_config[j][7],	--延迟刷怪
	 			[11] = aliveTime,  				--存活时间                   
	 		}
	 		mgr:mon_gen(encode(obj))	 		
	 	end
	 	mgr:set_activity_flag(1)
	elseif format_time == end_time then
		mgr:set_activity_flag(0)
	end
end

function Map502_OnTimeEvent(mgr,hour,min,sec)
	local format_time = hour * 100 + min;
	local start_time = 15 * 100;
	local end_time = 15 * 100 + 30;

	if format_time >= start_time and format_time < end_time and mgr:get_activity_flag() == 0 then
		local aliveTime = 30 * 60 * 1000;
	 	for j = 1, #g_travel_snatch_config do
	 		local obj = {
	 			[1] = 502, --地图id
	 			[2] = g_travel_snatch_config[j][4],	--x坐标
	 			[3] = g_travel_snatch_config[j][5],	--y坐标
	 			[4] = g_travel_snatch_config[j][1],	--怪物id
	 			[5] = g_travel_snatch_config[j][8],	--形象id
	 			[6] = g_travel_snatch_config[j][2],	--怪物名字
	 			[7] = g_travel_snatch_config[j][3],	--怪物数量
	 			[8] = g_travel_snatch_config[j][6],	--刷怪半径
	 			[9] = 2,
	 			[10] = g_travel_snatch_config[j][7],	--延迟刷怪
	 			[11] = aliveTime,  				--存活时间                   
	 		}
	 		mgr:mon_gen(encode(obj))
	 	end
	 	mgr:set_activity_flag(1)
	elseif format_time == end_time then
		mgr:set_activity_flag(0)
	end
end
