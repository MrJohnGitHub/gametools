function OnSiegeWarStart()		--攻城战开始
    g_broadcast(14,0,0,"激情攻城战进行中,请到天星城参加攻城战");
end

function OnWarStatueBeAttak()
	 g_broadcast(14,0,0,"皇城雕像被攻击，请速度前往天星城防守");
end

function OnSiegeWarHalf()		--可以进入皇宫
	g_broadcast(14,0,0,"皇城保护时间已过，可以进入皇宫进行争夺");
end

function OnSiegeWarEnd(guildname,flag)
	if flag == 2 then
		g_broadcast(14,0,0,"攻城战已结束,很遗憾本次攻城战没有胜利方");
	else
	    g_broadcast(14,0,0,"<font color='#00ccff'>["..guildname.."]</font>公会取得攻城战胜利，请会长及时到神武王城雕像处领取奖励");
		g_broadcast(12,0,0,"攻城为下，攻心为上，<font color='#00ccff'>["..guildname.."]</font>公会称霸全服，请会长及时到神武王城雕像处领取专属神兵。");
	end
end

function OnSiegeOwnerChange(getguildname,loseguildname,flag)
	if flag == 1 or flag == 3 then
		g_alert("[<font color='#00FF00'>"..getguildname.."</font>]公会占领[<font color='#00FF00'>皇宫</font>]",1,1000,0,1);
		--g_alert("[<font color='#00FF00'>皇宫</font>]已被[<font color='#00FF00'>"..getguildname.."</font>]行会占领",2,1000,0,1);
	end
end