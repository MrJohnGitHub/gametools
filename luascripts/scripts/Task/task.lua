function SendUpdateTrackPanel(player,taskid)	--主线任务
	player:set_task_state(0,taskid);
	
	--player:alert(2,0,0,"任务ID："..taskid.."数量"..player:get_task_param(1,1));
	if taskid == 1 then
		local obj = {};
		local arr = {};
		local target;
		obj.ContinueTask = 0;
		
		target = {};
		target.taskid = taskid;
		target.task_state = player:get_task_state(1);
		target.finish_num = player:get_task_param(1,1);
		target.total_num = 1;
		target.oper_state = 1;
		
		table.insert(arr,target);
		obj.text_0 = arr;
		obj.type = 0;
		player:SendPacketToSelf(2403,0,encode(obj));
	elseif taskid >= 2 and taskid <= 112 then
		local obj = {};
		local arr = {};
		local target;
		local before_task = taskid - 1;
		local before_states = player:get_task_state(before_task);
		local task_states = player:get_task_state(taskid);
		obj.ContinueTask = 0;
		
		if before_states == 2 then
			target = {};
			player:set_task_state(before_task,3);
			target.taskid = before_task;
			target.task_state = 2;
			target.finish_num = 0;
			target.total_num = 0;
			target.oper_state = 2;
			table.insert(arr,target);					
		end

		target = {};
		target.taskid = taskid;
		target.task_state = task_states;
		target.finish_num = player:get_task_param(taskid,1);
		
		if taskid == 4 or taskid == 5 then
			target.total_num = 2;
		elseif  taskid == 10 or taskid == 11 or taskid == 70 or taskid == 91 or taskid == 112 or taskid == 118 then
			target.total_num = 3;
		elseif taskid == 12 or taskid == 13 or taskid == 16 or taskid == 17 or taskid == 18  then
			target.total_num = 5;
		elseif taskid == 20   or taskid == 27 then 
			target.total_num = 10;
		elseif taskid == 28 or taskid == 29 or taskid == 31 or taskid == 32 or taskid == 33 or taskid == 44 or taskid == 45  or taskid == 41 or taskid == 42 or taskid == 43 then
			target.total_num = 15;
		elseif taskid == 55 then
			target.total_num = 20;					
		elseif taskid == 83  or taskid == 117 then
			target.total_num = 2;
		elseif taskid == 74 or taskid == 98 or taskid == 119 then
		    target.total_num = 4;	
		elseif taskid == 104 then
		    target.total_num = 6;	
		elseif taskid == 11 then
		    target.total_num = 7;	
		elseif taskid == 76 then
		    target.total_num = 500;		
		elseif taskid == 87 then
		    target.total_num = 600;
		elseif taskid == 95 then
		    target.total_num = 700;
		elseif taskid == 101 then
		    target.total_num = 800;
		elseif taskid == 120 then
		    target.total_num = 9;    
		else
			target.total_num = 1;
		end
		
		target.oper_state = 1;
		table.insert(arr,target);
		
		
		
		obj.text_0 = arr;
		obj.type = 0;
		if taskid == 112 and task_states == 3 then
			
			
			target = {};
			target.taskid = 112;
			target.task_state = 2;
			target.finish_num = 0;
			target.total_num = 0;
			target.oper_state = 2;
			table.insert(arr,target);
			player:SendPacketToSelf(2403,0,encode(obj));
			
			
			obj.isfinish = 1;
		end
		
		player:SendPacketToSelf(2403,0,encode(obj));
	end
end

function SendUpdateTrackPanel_1(player,taskid) --支线任务
	local tasktb = {
		[113]=1,[114]=1,[115]=1,[116]=2,[117]=1,[118]=1,[119]=1,[120]=1,[121]=30,[122]=3,[123]=1,[124]=30,
		[125]=1,[126]=30,[127]=4,[128]=30,[129]=3,[130]=1,[131]=1,[132]=2,[133]=4,[134]=1,[135]=5,[136]=3,
		[137]=3,[138]=3,[139]=2,[140]=9,[141]=4,[142]=4,[143]=3
	};	--[支线任务ID]=需要完成次数

	local obj = {};
	local arr = {};
	if taskid == 0 then
		for k,value in pairs(tasktb) do
			local task_states = player:get_task_state(k);
			if task_states == 1 or task_states == 2 then
				local target = {};
				target.taskid = k;
				target.task_state = task_states;
				target.finish_num = player:get_task_param(k,0);	
				target.total_num = value;
				target.oper_state = 1;
				table.insert(arr,target);
				break;
			end			
		end
	else
		local task_states = player:get_task_state(taskid);
		if tasktb[taskid] == nil then
			return;
		end
		local target = {};
		target.taskid = taskid;
		target.task_state = task_states;
		target.finish_num = player:get_task_param(taskid,1);	
		target.total_num = tasktb[taskid];
		target.oper_state = 1;
		if task_states == 3 then
			target.oper_state = 2;
		end
		table.insert(arr,target);
	end
	obj.text_0 = arr;	
	player:SendPacketToSelf(2404,0,encode(obj));
end

function OnDialyTask(player,taskType)	--日常任务
	local paramtb = {[243]=244}
	if g_daily_tasktb[taskType] == nil then
		return;
	end
	local zhuansheng = player:get_param(258);
	local level = player:GetLevel();
	local index = player:get_param(taskType);
	if index == 0 or index < 100 then
		local t_index = 0;
		local daily_tasktb = {};
		for i=1,#g_daily_tasktb[taskType] do
			t_index = t_index + 1;
			if zhuansheng >= g_daily_tasktb[taskType][i]["zhuansheng"] and level >= g_daily_tasktb[taskType][i]["level"] then
				daily_tasktb = g_daily_tasktb[taskType][i][1];
				break;
			end
		end
		index = math.random(1,#daily_tasktb);
		index = index + t_index * 100;
		player:set_param(taskType,index);
		player:set_task_param(taskType,1,0);
		player:set_task_state(taskType,0);
	end
	local t = math.floor(index / 100);
	local p = index % 100;
	local taskid = g_daily_tasktb[taskType][t][1][p];
	local neednum = g_daily_num[taskid][1];
	if neednum == nil then
		return;
	end
	
	local task_states = player:get_task_state(taskType);
	local obj = {};
	local arr = {};
	local target = {};
	target.taskid = taskid;
	target.task_state = task_states;
	target.finish_num = player:get_task_param(taskType,1);	
	target.total_num = neednum;
	target.oper_state = 1;
	if task_states == 3 then
		target.oper_state = 2;
	end
	table.insert(arr,target);
	obj.text_0 = arr;
	obj.finishTimes = player:get_param(paramtb[taskType]);
	obj.isfinish = 1;
	if obj.finishTimes < 10 then
		obj.isfinish = 0;
	end
	player:SendPacketToSelf(2405,0,encode(obj));
end

function DialyKillTask(player,entry,tasktype)
	local index = player:get_param(tasktype);
	if index == 0 or index < 100 then
		return;
	end
	local t = math.floor(index / 100);
	local p = index % 100;
    local guildtask = g_daily_tasktb[tasktype][t][1][p];
    if guildtask ~= nil and g_daily_creature[entry] ~= nil then
	    if player:get_task_state(tasktype) == 1 then
	    	for i=1,#g_daily_creature[entry] do
	    		if g_daily_creature[entry][i] == guildtask then
			    	local nownum = player:get_task_param(tasktype,1) + 1;
			    	local neednum = g_daily_num[guildtask][1];
			    	if neednum == nil then
			    		return;
			    	end
			    	if nownum < neednum then
			            player:set_task_param(tasktype,1,nownum);
			        else
			        	player:set_task_state(tasktype,2);
			        end
			        OnDialyTask(player,tasktype);
			        return;
		        end
	        end
	    end
    end
end

function Rcrw(player,nId)
end

function OnCompleteQest(player,type,index,num)
	if type == 1 then	--焚天修炼任务
		local tasktable = {{114,1},{116,2},{129,3},{133,4},{140,9}};	--{任务ID，完成数量} 多个任务需要任务ID从前往后按顺序配置
		
		local sidetask = player:get_param(207);		--当前支线任务ID
		for i = 1,#tasktable do
		    if sidetask == tasktable[i][1] and player:get_task_state(tasktable[i][1]) == 1 then
		        if num < tasktable[i][2] then
		        	player:set_task_param(tasktable[i][1],1,num);
	        		SendUpdateTrackPanel_1(player,tasktable[i][1]);
		            break;
		        end
		        player:set_task_param(tasktable[i][1],1,tasktable[i][2]);
		        player:set_task_state(tasktable[i][1],2);
		        SendUpdateTrackPanel_1(player,tasktable[i][1]);
		        break;
		    end
		end
	    return;
	elseif type == 2 then	--BOSS击杀任务
		return;
	elseif type == 3 then	--穿戴N件X级装备	
		local tasktable = {{61,1,0,0,1},{62,1,0,50,0},{65,1,0,0,2},{66,2,0,50,0},{70,3,0,50,0},{74,4,0,50,0},{78,1,0,0,3},{79,1,0,60,0},{82,1,0,0,4},{83,2,0,60,0},{91,3,0,60,0},{98,4,0,60,0},{104,6,0,60,0}};	--{任务ID,需要数量,装备转生等级,装备等级,装备强化等级}
		local tasktable_1 = {{117,1,0,0,4},{120,1,0,0,5},{123,1,0,0,6},{125,1,0,0,7},{130,1,0,0,8}};	--支线任务
		
		local nowtask = player:get_task_state(0);	--当前主线任务ID
		for i = 1,#tasktable do
			if nowtask == tasktable[i][1] and player:get_task_state(tasktable[i][1]) == 1 then
				local sum = player:Equipment_Num(tasktable[i][3],tasktable[i][4],tasktable[i][5]);
				if sum < tasktable[i][2] then
					player:set_task_param(tasktable[i][1],1,sum);
	        		player:push_task_data(tasktable[i][1],1);	       
				else
					player:set_task_param(tasktable[i][1],1,tasktable[i][2]);
	        		player:set_task_state(tasktable[i][1],2);	        
	       			player:push_task_data(tasktable[i][1],1);
	       		end
	       		break;
			end
		end
		
		local sidetask = player:get_param(207);		--当前支线任务ID
		for i = 1,#tasktable_1 do
			if sidetask == tasktable_1[i][1] and player:get_task_state(tasktable_1[i][1]) == 1 then
				local sum = player:Equipment_Num(tasktable_1[i][3],tasktable_1[i][4],tasktable_1[i][5]);
				if sum < tasktable_1[i][2] then
					player:set_task_param(tasktable_1[i][1],1,sum);
	        		SendUpdateTrackPanel_1(player,tasktable_1[i][1]);
				else
					player:set_task_param(tasktable_1[i][1],1,tasktable_1[i][2]);
	        		player:set_task_state(tasktable_1[i][1],2);	        	       			
	       			SendUpdateTrackPanel_1(player,tasktable_1[i][1]);
	       		end
	       		break;
			end
		end
		return;
	elseif type == 4 then	--神炉升级
		local sidetask = player:get_param(207);		--当前支线任务ID
		if index == 1 then	--血玉		
			local tasktable = {{122,3},{127,4},{135,5}};
			
			for i = 1,#tasktable do
			    if sidetask == tasktable[i][1] and player:get_task_state(tasktable[i][1]) == 1 then
			        if num < tasktable[i][2] then
			        	player:set_task_param(tasktable[i][1],1,num);
		        		SendUpdateTrackPanel_1(player,tasktable[i][1]);
			            break;
			        end
			        player:set_task_param(tasktable[i][1],1,tasktable[i][2]);
			        player:set_task_state(tasktable[i][1],2);	        
			        SendUpdateTrackPanel_1(player,tasktable[i][1]);
			        break;
			    end
			end
		end
		if index == 3 then	--宝石		
			local tasktable = {{118,1},{132,2},{137,3},{142,4}};
			
			for i = 1,#tasktable do
			    if sidetask == tasktable[i][1] and player:get_task_state(tasktable[i][1]) == 1 then
			        if num < tasktable[i][2] then
			        	player:set_task_param(tasktable[i][1],1,num);
		        		SendUpdateTrackPanel_1(player,tasktable[i][1]);
			            break;
			        end
			        player:set_task_param(tasktable[i][1],1,tasktable[i][2]);
			        player:set_task_state(tasktable[i][1],2);	        
			        SendUpdateTrackPanel_1(player,tasktable[i][1]);
			        break;
			    end
			end
		end
		if index == 4 then	--魂珠
			local tasktable = {{134,1},{139,2},{143,3}};
			
			for i = 1,#tasktable do
			    if sidetask == tasktable[i][1] and player:get_task_state(tasktable[i][1]) == 1 then
			        if num < tasktable[i][2] then
			        	player:set_task_param(tasktable[i][1],1,num);
		        		SendUpdateTrackPanel_1(player,tasktable[i][1]);
			            break;
			        end
			        player:set_task_param(tasktable[i][1],1,tasktable[i][2]);
			        player:set_task_state(tasktable[i][1],2);	        
			        SendUpdateTrackPanel_1(player,tasktable[i][1]);
			        break;
			    end
			end
		end
		return;
	elseif type == 5 then	--翅膀升级
		local tasktable = {{136,3},{141,4}};
		
		local sidetask = player:get_param(207);		--当前支线任务ID
		for i = 1,#tasktable do
		    if sidetask == tasktable[i][1] and player:get_task_state(tasktable[i][1]) == 1 then
		        if num < tasktable[i][2] then
		        	player:set_task_param(tasktable[i][1],1,num);
	        		SendUpdateTrackPanel_1(player,tasktable[i][1]);
		            break;
		        end
		        player:set_task_param(tasktable[i][1],1,tasktable[i][2]);
		        player:set_task_state(tasktable[i][1],2);	        
		        SendUpdateTrackPanel_1(player,tasktable[i][1]);
		        break;
		    end
		end
		return;
	elseif type == 7 then	--转生等级任务
		local tasktable = {{109,1},{112,3}};
		
		local nowtask = player:get_task_state(0);	--当前主线任务ID
		for i = 1,#tasktable do
		    if nowtask == tasktable[i][1] and player:get_task_state(tasktable[i][1]) == 1 then
		        if num < tasktable[i][2] then
		        	player:set_task_param(tasktable[i][1],1,num);
	        		player:push_task_data(tasktable[i][1],1);
		            break;
		        end
		        player:set_task_param(tasktable[i][1],1,tasktable[i][2]);
		        player:set_task_state(tasktable[i][1],2);	        
		        player:push_task_data(tasktable[i][1],1);
		        break;
		    end
		end
	    return;
	elseif type == 8 then	--参与N次泡点/奔跑活动任务
		local tasktable = {{113,1,439,25,32},{115,1,438,86,36}};	--{任务ID，完成数量,地图ID,X坐标,Y坐标}
		
		local sidetask = player:get_param(207);		--当前支线任务ID
		for i = 1,#tasktable do
			if sidetask == tasktable[i][1] and player:get_task_state(tasktable[i][1]) == 1 then
				if tasktable[i][1] == num then
					local nownum = player:get_task_param(tasktable[i][1],1);
					player:enter_map(tasktable[i][3],tasktable[i][4],tasktable[i][5],0);
			        if nownum + 1 < tasktable[i][2] then
			        	player:set_task_param(tasktable[i][1],1,nownum + 1);
			        	SendUpdateTrackPanel_1(player,tasktable[i][1]);
			            break;
			        end
			        player:set_task_param(tasktable[i][1],1,tasktable[i][2]);
			        player:set_task_state(tasktable[i][1],2);	        
			        SendUpdateTrackPanel_1(player,tasktable[i][1]);
			        break;
		        end
		    end
		end
		return;
	elseif type == 9 then	--加入公会
		local taskid = 119;
		
		if player:get_task_state(taskid) == 1 then
		    player:set_task_param(taskid,1,1);
		    player:set_task_state(taskid,2);	        
		    SendUpdateTrackPanel_1(player,taskid);
		else
			player:set_task_param(taskid,0,1);
		end
		return;
	elseif type == 10 then	--完成封魔任务
		local tasktable = {{138,3}};
	--	player:alert(2,0,0,"封魔宝箱完成1");
		for i = 1,#tasktable do
			local state = player:get_task_state(tasktable[i][1]);
	--		player:alert(2,0,0,"封魔宝箱完成2:"..state);
			if state < 2 then
				local nownum = player:get_task_param(tasktable[i][1],1);
				if nownum + num < tasktable[i][2] then
		        	player:set_task_param(tasktable[i][1],state,nownum + num);
		        else
		        	player:set_task_param(tasktable[i][1],state,tasktable[i][2]);
		        	if state == 1 then
		        		player:set_task_state(tasktable[i][1],2);
		        	end
		        end
				if state == 1 then
					SendUpdateTrackPanel_1(player,tasktable[i][1]);
				end
			end
		end
	    return;
	elseif type == 11 then	--完成经验副本
		local tasktable = {{131,1}};
		for i = 1,#tasktable do
			local state = player:get_task_state(tasktable[i][1]);
			if state < 2 then
				local nownum = player:get_task_param(tasktable[i][1],1);
				if nownum + num < tasktable[i][2] then
		        	player:set_task_param(tasktable[i][1],state,nownum + num);
		        else
		        	player:set_task_param(tasktable[i][1],state,tasktable[i][2]);
		        	if state == 1 then
		        		player:set_task_state(tasktable[i][1],2);
		        	end
		        end
				if state == 1 then
					SendUpdateTrackPanel_1(player,tasktable[i][1]);
				end
			end
		end
	    return;
    end
end