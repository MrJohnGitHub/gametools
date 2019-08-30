function mon5043(mon,event,player)
	if player:get_task_state(1) == 90 then
		if player:get_task_param(1,90) >= 0 then
			player:set_task_param(1,90,player:get_task_param(1,90) + 1);
		--	player:alert(111,0,0,"击杀目标数量："..player:get_task_param(1,90).."/1");
			player:push_task_data(1,1);
		end
		if player:get_task_param(1,90) == 1 then
			player:set_task_state(1,95);
			player:push_task_data(1,1);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
end

function mon2293(mon,event,player,type)
	if type == 1 then
		return;
	end
	g_send_activity_detail(4,3,0);	--2901
	g_set_param(9,1);
	local name = player:GetName();
	local mapid = player:GetMapId();
	local mapname = player:get_mapname(mapid);
	g_broadcast(12,0,0,"<font color='#00ccff'>"..name.."</font>在<font color='#00ccff'>"..mapname.."</font>击杀了<font color='#00ccff'>元宝BOSS</font>，掉落了大量<font color='#ff0000'>非绑元宝</font>，赶快去抢！！！");	
	g_broadcast(12,0,0,"<font color='#00ccff'>"..name.."</font>在<font color='#00ccff'>"..mapname.."</font>击杀了<font color='#00ccff'>元宝BOSS</font>，掉落了大量<font color='#ff0000'>非绑元宝</font>，赶快去抢！！！");
	g_broadcast(12,0,0,"<font color='#00ccff'>"..name.."</font>在<font color='#00ccff'>"..mapname.."</font>击杀了<font color='#00ccff'>元宝BOSS</font>，掉落了大量<font color='#ff0000'>非绑元宝</font>，赶快去抢！！！");
end

function mon2316(mon,event,player,type)
	if type == 1 then
		return;
	end
	g_send_activity_detail(4,3,0);	--2901
	g_set_param(9,1);
	
	local name = player:GetName();
	local mapid = player:GetMapId();
	local mapname = player:get_mapname(mapid);
	g_broadcast(12,0,0,"<font color='#00ccff'>"..name.."</font>在<font color='#00ccff'>"..mapname.."</font>击杀了<font color='#00ccff'>元宝BOSS</font>，掉落了大量<font color='#ff0000'>元宝</font>，赶快去抢！！！");
	g_broadcast(12,0,0,"<font color='#00ccff'>"..name.."</font>在<font color='#00ccff'>"..mapname.."</font>击杀了<font color='#00ccff'>元宝BOSS</font>，掉落了大量<font color='#ff0000'>元宝</font>，赶快去抢！！！");
	g_broadcast(12,0,0,"<font color='#00ccff'>"..name.."</font>在<font color='#00ccff'>"..mapname.."</font>击杀了<font color='#00ccff'>元宝BOSS</font>，掉落了大量<font color='#ff0000'>元宝</font>，赶快去抢！！！");
end

function mon2309(mon,event,player)
	--player:alert(2,0,0,"怪物攻城BOSS：2309");
	g_send_activity_detail(14,3,0);	--2901
	g_set_param(10,1);
end

function mon2333(mon,event,player)
	g_send_activity_detail(20,3,0);	--2901
	g_set_param(44,1);
end