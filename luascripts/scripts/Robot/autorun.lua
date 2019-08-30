--=========== 活动列表更新 2901 =====================
function OnTimeEvent(hour,min)
    local format_time = hour * 100 + min
	
	local init_day = g_get_day();
	if init_day >= 10 and hour == 11 and min == 30 then
	    g_broadcast(12,0,0,"<font color='#ff0000'>跨服BOSS天谴神兵</font>出现在<font color='#00ccff'>跨服地图</font><font color='#0be140'>[</font><a href= 'event:M2411,1,73,117,task_track_link_npc,1,73,116,172'><u><font color='#0be140'>传</font></u></a><font color='#0be140'>]</font>");      
	end
	
	if init_day >= 10 and hour == 16 and min == 30 then
	    g_broadcast(12,0,0,"<font color='#ff0000'>跨服BOSS天谴之主</font>出现在<font color='#00ccff'>跨服地图</font><font color='#0be140'>[</font><a href= 'event:M2411,1,73,117,task_track_link_npc,1,73,116,172'><u><font color='#0be140'>传</font></u></a><font color='#0be140'>]</font>");      
	end
	
	if init_day >= 5 and hour == 15 and min == 00 then
	    g_broadcast(12,0,0,"赤月峡谷活动开启啦，前往峡谷参与活动吧～<font color='#0be140'>{_showSysWin,立即前往,OPEN_CHIYUEACT}</font>");
	end

    if hour == 9 then 				--9点发生的事件
		if min == 57 then			--55分发生的事件
			--g_broadcast(14,0,0,"PK泡点活动即将开启!!!");
			g_send_activity_detail(1,1,180);
			return;
		end
		return;
	end
	if hour == 10 then
		if min == 0 then
			--g_broadcast(14,0,0,"PK泡点活动开启!!!");
			g_send_activity_detail(1,2,600);
			return;
		end
		if min == 10 then
			--g_broadcast(14,0,0,"PK泡点活动结束!!!");
			g_send_activity_detail(1,3,0);
			return;
		end
		if min == 27 then
			--g_broadcast(14,0,0,"群雄争霸活动即将开启!!!");
			g_send_activity_detail(2,1,180);
			return;
		end
		if min == 30 then
			--g_broadcast(14,0,0,"群雄争霸活动开启!!!");
			g_send_activity_detail(2,2,600);
			return;
		end
		if min == 40 then
			--g_broadcast(14,0,0,"群雄争霸活动结束!!!");
			g_send_activity_detail(2,3,0);
			return;
		end
		if min == 57 then
			--g_broadcast(14,0,0,"疯狂挖矿活动即将开启!!!");
			g_send_activity_detail(3,1,180);
			return;
		end
		return;
	end
	if hour == 11 then
		if min == 0 then
			--g_broadcast(14,0,0,"疯狂挖矿活动开启!!!");
			g_send_activity_detail(3,2,600);
			return;
		end
		if min == 10 then
			--g_broadcast(14,0,0,"疯狂挖矿活动结束!!!");
			g_send_activity_detail(3,3,0);
			return;
		end
		if min == 17 then
			--g_broadcast(14,0,0,"元宝BOSS活动即将开启!!!");
			g_send_activity_detail(4,1,180);
			return;
		end
		if min == 20 then
			--g_broadcast(14,0,0,"元宝BOSS活动开启!!!");
			g_send_activity_detail(4,2,1200);
			return;
		end
		if min == 40 then
			--g_broadcast(14,0,0,"元宝BOSS活动结束!!!");
			g_send_activity_detail(4,3,0);
			return;
		end
		if min == 57 then
			--g_broadcast(14,0,0,"膜拜城主活动即将开启!!!");
			g_send_activity_detail(5,1,180);
			return;
		end
		return;
	end
	if hour == 12 then
		if min == 0 then
			--g_broadcast(14,0,0,"膜拜城主活动开启!!!");
			g_send_activity_detail(5,2,1800);
			return;
		end
		if min == 30 then
			--g_broadcast(14,0,0,"膜拜城主活动结束!!!");
			g_send_activity_detail(5,3,0);
			--g_broadcast(14,0,0,"谁与争风活动开启!!!");
			g_send_activity_detail(6,2,600);
			return;
		end
		if min == 27 then
			--g_broadcast(14,0,0,"谁与争风活动即将开启!!!");
			g_send_activity_detail(6,1,180);
			return;
		end
		if min == 43 then
			--g_broadcast(14,0,0,"谁与争风活动结束!!!");
			g_send_activity_detail(6,3,0);
			return;
		end
		if min == 57 then
			--g_broadcast(14,0,0,"PK泡点活动即将开启!!!");
			g_send_activity_detail(7,1,180);
			return;
		end
		return;
	end
	if hour == 13 then
		if min == 0 then
			--g_broadcast(14,0,0,"PK泡点活动开启!!!");
			g_send_activity_detail(7,2,600);
			return;
		end
		if min == 10 then
			--g_broadcast(14,0,0,"PK泡点活动结束!!!");
			g_send_activity_detail(7,3,0);
			return;
		end
		if min == 27 then
			--g_broadcast(14,0,0,"群雄争霸活动即将开始!!!");
			g_send_activity_detail(8,1,180);
			return;
		end
		if min == 30 then
			--g_broadcast(14,0,0,"群雄争霸活动开始!!!");
			g_send_activity_detail(8,2,600);
			return;
		end
		if min == 40 then
			--g_broadcast(14,0,0,"群雄争霸活动结束!!!");
			g_send_activity_detail(8,3,0);
			return;
		end
		if min == 57 then
			--g_broadcast(14,0,0,"迷宫活动即将开始!!!");
			g_send_activity_detail(9,1,180);
			return;
		end
		return;
	end

	if hour == 14 then
		if min == 00 then
			--g_broadcast(14,0,0,"迷宫活动开始!!!");
			g_send_activity_detail(9,2,600);
			return;
		end
		if min == 20 then
			--g_broadcast(14,0,0,"迷宫活动结束!!!");
			g_send_activity_detail(9,3,0);
			return;
		end
		if min == 27 then
			--g_broadcast(14,0,0,"争分夺秒活动即将开始!!!");
			g_send_activity_detail(10,1,180);
			return;
		end
		if min == 30 then
			--g_broadcast(14,0,0,"争分夺秒开始!!!");
			g_send_activity_detail(10,2,600);
			return;
		end
		if min == 40 then
			--g_broadcast(14,0,0,"争分夺秒活动结束!!!");
			g_send_activity_detail(10,3,0);
			return;
		end
		if min == 57 then
			--g_broadcast(14,0,0,"城主之刃活动即将开始!!!");
			g_send_activity_detail(11,1,180);
			return;
		end
		return;
	end
	if hour == 15 then
		if min == 0 then
			--g_broadcast(14,0,0,"城主之刃活动开始!!!");
			g_send_activity_detail(11,2,600);
			return;
		end
		if min == 10 then
			--g_broadcast(14,0,0,"城主之刃活动结束!!!");
			g_send_activity_detail(11,3,0);
			return;
		end
		if min == 27 then
			--g_broadcast(14,0,0,"群雄争霸活动即将开始!!!");
			g_send_activity_detail(12,1,180);
			return;
		end
		if min == 30 then
			--g_broadcast(14,0,0,"群雄争霸活动开始!!!");
			g_send_activity_detail(12,2,600);
			return;
		end
		if min == 40 then
			--g_broadcast(14,0,0,"群雄争霸活动结束!!!");
			g_send_activity_detail(12,3,0);
			return;
		end
		if min == 57 then
			--g_broadcast(14,0,0,"PK泡点活动即将开始!!!");
			g_send_activity_detail(13,1,180);
			return;
		end
		return;
	end
	if hour == 16 then
		if min == 0 then
			--g_broadcast(14,0,0,"PK泡点活动开始!!!");
			g_send_activity_detail(13,2,600);
			return;
		end
		if min == 10 then
			--g_broadcast(14,0,0,"PK泡点活动结束!!!");
			g_send_activity_detail(13,3,0);
			return;
		end
		if min == 17 then
			--g_broadcast(14,0,0,"怪物攻城活动即将开始!!!");
			g_send_activity_detail(14,1,180);
			return;
		end
		if min == 20 then
			--g_broadcast(14,0,0,"怪物攻城活动开始!!!");
			g_send_activity_detail(14,2,1200);
			return;
		end
		if min == 40 then
			--g_broadcast(14,0,0,"怪物攻城活动结束!!!");
			g_send_activity_detail(14,3,0);
			return;
		end
		if min == 57 then
			--g_broadcast(14,0,0,"PK泡点活动即将开始!!!");
			g_send_activity_detail(15,1,180);
			return;
		end
		return;
	end
	if hour == 17 then
		if min == 0 then
			--g_broadcast(14,0,0,"PK泡点活动开始!!!");
			g_send_activity_detail(15,2,600);
			return;
		end
		if min == 10 then
			--g_broadcast(14,0,0,"PK泡点活动结束!!!");
			g_send_activity_detail(15,3,0);
			return;
		end
		if min == 27 then
			--g_broadcast(14,0,0,"群雄争霸活动即将开始!!!");
			g_send_activity_detail(16,1,180);
			return;
		end
		if min == 30 then
			--g_broadcast(14,0,0,"群雄争霸活动开始!!!");
			g_send_activity_detail(16,2,600);
			return;
		end
		if min == 40 then
			--g_broadcast(14,0,0,"群雄争霸活动结束!!!");
			g_send_activity_detail(16,3,0);
			return;
		end
		if min == 57 then
			--g_broadcast(14,0,0,"膜拜城主活动即将开始!!!");
			g_send_activity_detail(17,1,180);
			return;
		end
		return;
	end
	if hour == 18 then
		if min == 0 then
			--g_broadcast(14,0,0,"膜拜城主活动开启!!!");
			g_send_activity_detail(17,2,7200);
			return;
		end
		if min == 30 then
			--g_broadcast(14,0,0,"膜拜城主活动结束!!!");
			g_send_activity_detail(17,3,0);
			return;
		end
		if min == 37 then
			--g_broadcast(14,0,0,"奔跑吧兄弟活动即将开始!!!");
			g_send_activity_detail(18,1,180);
			return;
		end
		if min == 40 then
			--g_broadcast(14,0,0,"奔跑吧兄弟活动开始!!!");
			g_send_activity_detail(18,2,600);
			return;
		end
		if min == 43 then
			--g_broadcast(14,0,0,"奔跑吧兄弟活动结束!!!");
			g_send_activity_detail(18,3,0);
			return;
		end
		if min == 57 then
			--g_broadcast(14,0,0,"夺宝奇兵活动即将开始!!!");
			g_send_activity_detail(19,1,180);
			return;
		end
		return;
	end
	if hour == 19 then
		if min == 0 then
			--g_broadcast(14,0,0,"夺宝奇兵活动开始!!!");
			g_send_activity_detail(19,2,600);
			return;
		end
		if min == 10 then
			--g_broadcast(14,0,0,"夺宝奇兵活动结束!!!");
			g_send_activity_detail(19,3,0);
			return;
		end
		if min == 17 then
			--g_broadcast(14,0,0,"魔族入侵活动即将开始!!!");
			g_send_activity_detail(20,1,180);
			return;
		end
		if min == 20 then
			--g_broadcast(14,0,0,"魔族入侵活动开始!!!");
			g_send_activity_detail(20,2,1200);
			return;
		end
		if min == 40 then
			--g_broadcast(14,0,0,"魔族入侵活动结束!!!");
			g_send_activity_detail(20,3,0);
			return;
		end
		if min == 57 then
			--g_broadcast(14,0,0,"特戒活动即将开始!!!");
			g_send_activity_detail(26,1,180);
			--g_broadcast(14,0,0,"攻城战活动即将开始!!!");
			if g_has_apply_castle() ~= 0 then
				g_send_activity_detail(21,1,180);
			end
			return;
		end
		return;
	end
	if hour == 20 then
		if min == 0 then
			--g_broadcast(14,0,0,"特戒活动开始!!!");
			g_send_activity_detail(26,2,900);
			--g_broadcast(14,0,0,"攻城战活动开始!!!");
			if g_has_apply_castle() ~= 0 then
				g_send_activity_detail(21,2,3600);
			end
			return;
		end
		if min == 15 then
			--g_broadcast(14,0,0,"特戒活动活动结束!!!");
			g_send_activity_detail(26,3,0);
			return;
		end
		if min == 57 then
			--g_broadcast(14,0,0,"城主之刃活动即将开始!!!");
			g_send_activity_detail(22,1,180);
			return;
		end
		return;
	end
	if hour == 21 then
		if min == 0 then
			--g_broadcast(14,0,0,"攻城战活动结束!!!");
			g_send_activity_detail(21,3,0);	
			--g_broadcast(14,0,0,"城主之刃活动开始!!!");
			g_send_activity_detail(22,2,600);
			return;
		end
		if min == 10 then
			--g_broadcast(14,0,0,"城主之刃活动结束!!!");
			g_send_activity_detail(22,3,0);
			return;
		end
		if min == 27 then
			--g_broadcast(14,0,0,"夜战皇城活动即将开始!!!");
			g_send_activity_detail(23,1,180);
			return;
		end
		if min == 30 then
			--g_broadcast(14,0,0,"夜战皇城活动开始!!!");
			g_send_activity_detail(23,2,1200);
			return;
		end
		if min == 50 then
			--g_broadcast(14,0,0,"夜战皇城活动结束!!!");
			g_send_activity_detail(23,3,0);
			return;
		end
		if min == 57 then
			--g_broadcast(14,0,0,"PK泡点活动即将开始!!!");
			g_send_activity_detail(24,1,180);
			return;
		end
		return;
	end
	if hour == 22 then
		if min == 0 then
			--g_broadcast(14,0,0,"PK泡点活动开始!!!");
			g_send_activity_detail(24,2,600);
			return;
		end
		if min == 10 then
			--g_broadcast(14,0,0,"PK泡点活动结束!!!");
			g_send_activity_detail(24,3,0);
			return;
		end
		return;
	end
	

	
end
