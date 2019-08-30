function ontalk1959(npc,event,player)
	if player:get_task_state(2) == 15 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
听说你是个很不错的年轻人，希望你的修炼之
路可以长久一些。
#&task_target#&

#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">4000</font>
#&item19004#&<font color="#28FF28">0</font>

#&todoM2402,3#&talk_finish_bt#&]]);
	elseif player:get_task_state(2) == 99 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
城主大人已经答应了召见你，进去吧。
#&task_target#&

#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">80000</font>
#&item19004#&<font color="#28FF28">0</font>

#&todoM2402,2#&talk_finish_bt#&]]);
	elseif player:get_task_state(3) == 85 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
听说你要去无双城，哪里现在乱成一团，如果实
力不足进去恐怕会很危险，为了以防万一，先想
办法强化一下你身上的装备吧！
#&task_target#&

#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">3000000</font>
#&item19004#&<font color="#28FF28">0</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
		player:echo(0,npc:GetLowGUID(),[[
	#&task_describe#&
	赤月皇城禁止私自械斗，但是来我这里就
	可以了。
	#&task_content#&
	]]);
	end
end

--	<u><a href='event:M2402,2'>提交铁血令</a></u> 总提交次数:]]..g_get_param(20)..[[次

function CreatureNpcFun1959(npc,event,player,funid)
	if funid == 1 then
		ontalk1959_1(npc,player);
		return;
	end
	if funid == 2 then
		ontalk1959_2(npc,player);
		return;
	end
	if funid == 3 then
		ontalk1959_3(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1959(npc,event,player,npcid)
	if npcid == 1220 then
		if player:get_task_state(3) == 85 then
			player:show_npc_flags(npcid,1);
		elseif player:get_task_state(2) == 99 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	elseif npcid == 1221 then
		if player:get_task_state(2) == 15 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end


function ontalk1959_1(npc,player)
	if player:get_task_state(3) == 85 then
		player:set_task_state(3,86);
		player:push_task_data(1,1);
		player:add_exp(3000000);

		player:add_gamemoney_bind(0);
		player:find_road_goto(12,154,66,1208);
	end
end

function ontalk1959_2(npc,player)
	if player:get_task_state(2) == 99 then
		player:set_task_state(2,105);
		player:push_task_data(1,1);
		player:add_exp(80000);

		player:add_gamemoney_bind(0);
		player:find_road_goto(12,154,66,1208);
	end
end

function ontalk1959_3(npc,player)
	if player:get_task_state(2) == 15 then
		player:set_task_state(2,16);
		player:push_task_data(1,1);
		player:add_exp(4000);

		player:add_gamemoney_bind(0);
		player:find_road_goto(12,110,131,1218);
	end
end

	-- local txltable = {
	-- 	[1]={[100]=10178,[101]=1680,[102]=1,[103]="强化刺杀"},
	-- 	[2]={[100]=10179,[101]=1680,[102]=1,[103]="强化半月"},
	-- 	[3]={[100]=10180,[101]=1680,[102]=1,[103]="强化野蛮"},
	-- 	[4]={[100]=10181,[101]=1680,[102]=1,[103]="强化雷电术"},
	-- 	[5]={[100]=10182,[101]=1680,[102]=1,[103]="强化火墙"},
	-- 	[6]={[100]=10183,[101]=1680,[102]=1,[103]="强化抗拒"},
	-- 	[7]={[100]=10184,[101]=1680,[102]=1,[103]="强化火咒"},
	-- 	[8]={[100]=10185,[101]=1680,[102]=1,[103]="强化施毒"},
	-- 	[9]={[100]=10186,[101]=1680,[102]=1,[103]="强化防御术"},
	-- 	[10]={[100]=10167,[101]=840,[102]=1,[103]="烈火"},
	-- 	[11]={[100]=10171,[101]=840,[102]=1,[103]="冰咆哮"},
	-- 	[12]={[100]=10176,[101]=840,[102]=1,[103]="召唤神兽"},
	-- 	[13]={[100]=10172,[101]=420,[102]=0,[103]="魔法盾"},
	-- 	[14]={[100]=10169,[101]=420,[102]=1,[103]="火墙"},
	-- 	[15]={[100]=10165,[101]=420,[102]=1,[103]="半月"},
	-- 	[16]={[100]=10175,[101]=420,[102]=1,[103]="防御术"},
	-- 	[17]={[100]=10177,[101]=420,[102]=0,[103]="隐身术"},
	-- 	[18]={[100]=10174,[101]=180,[102]=0,[103]="施毒"},
	-- 	[19]={[100]=10170,[101]=180,[102]=0,[103]="抗拒"},
	-- 	[20]={[100]=10166,[101]=180,[102]=0,[103]="野蛮"},
	-- 	[21]={[100]=10164,[101]=90,[102]=0,[103]="刺杀"},
	-- 	[22]={[100]=10168,[101]=90,[102]=0,[103]="雷电术"},
	-- 	[23]={[100]=10173,[101]=90,[102]=0,[103]="火咒"},
	-- 	[24]={[100]=10221,[101]=2,[102]=0,[103]="银锭"},
	-- 	}
	-- if player:package_item(19021) >= 1 then
	-- 	player:remove_item(19021,1,0);
	-- 	for i=1,25 do
	-- 		if i < 25 then
	-- 			local nrandom = math.random(1,txltable[i][101]);
	-- 			if nrandom == 1 then
	-- 				player:add_item(txltable[i][100],1,txltable[i][102],0,0);
	-- 				player:alert(2,0,0,"恭喜你获得了<font color='#00FF00'>"..txltable[i][103].."</font>");
	-- 				break;
	-- 			end
	-- 		else
	-- 			local Expr = math.random(30000,1500000);
	-- 			player:add_exp(Expr);
	-- 			player:alert(2,0,0,"经验值 + <font color='#00FF00'>"..Expr.."</font>");
	-- 		end
	-- 	end
	-- 	g_set_param(20,g_get_param(20) + 1);
	-- 	if g_get_param(20) >= 500 then
	-- 		g_set_param(20,0);
	-- 		local obj = {};
	-- 		obj[2] = player:GetX();
	-- 		obj[3] = player:GetY();
	-- 		obj[4] = 8804;
	-- 		obj[5] = 35077;
	-- 		obj[6] = "铁血蚩尤";
	-- 		obj[7] = 1;
	-- 		obj[8] = 1;
	-- 		if g_get_day() >= 1 and g_get_day() < 20 then
	-- 			obj[14] = (g_get_day() * 0.1 + 1) * 100;
	-- 		elseif g_get_union_day >= 1 or g_get_day() >= 20 then
	-- 			obj[14] = 3 * 100;
	-- 		end
	-- 		obj[15] = 1;
	-- 		player:mon_gen(encode(obj));
	-- 		g_broadcast(14,0,0,"玩家："..player:GetName().."在"..player:get_mapname(player:GetMapId()).."("..player:GetX()..","..player:GetY()..")召唤出来了铁血蚩尤!!");
	-- 	end
	-- else
	-- 	player:alert(21,0,0,"对不起,您没有铁血令了!")
	-- end
	-- ontalk1959(npc,event,player);