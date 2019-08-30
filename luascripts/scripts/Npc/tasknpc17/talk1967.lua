function ontalk1967(npc,event,player)
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
只为证明
#&task_content#&

#&talk_line#&
		BOSS之家，游戏内所有的BOSS都会出现在里面,
		刷新最快，数量最多，掉落最丰富

#&talk_line#&
		1、进入条件：<font color='#21d119'>成为VIP1</font></font>
		2、BOSS数量：<font color='#21d119'>一层10只，二层5只</font>
		3、BOSS掉落：<font color='#21d119'>全系列装备，全系列材料</font>
		4、BOSS刷新：<font color='#21d119'>15-180分钟</font>

#&talk_line#&


			 <u><a href='event:M2402,1'>进入BOSS之家一层</a></u>
			 <u><a href='event:M2402,2'>测试信息输出10条</a></u>
			 <u><a href='event:M2402,3'>测试信息输出100条</a></u>
			 <u><a href='event:M2402,4'>测试信息输出500条</a></u>
  ]]);
		-- player:set_task_state(3,80);
		-- player:push_task_data(1,1);		
end

function CreatureNpcFun1967(npc,event,player,funid)
	if funid == 1 then
		ontalk1967_1(npc,player);
		return;
	end
	if funid == 2 then
		ontalk1967_2(npc,player);
		return;
	end
	if funid == 3 then
		ontalk1967_3(npc,player);
		return;
	end
	if funid == 4 then
		ontalk1967_4(npc,player);
		return;
	end
end

function CreatureNpcSceneNpcStatus1967(npc,event,player,npcid)

end

function ontalk1967_2(npc,player)
	local target = {};
	for i=1,100 do
		table.insert(target,13);
		table.insert(target,"<font color='#9e1ad5'>玩家</font> <font color='#2ac0b7'>["..player:GetName().."]</font> 挖掘宝藏,获得:{_equip,20001}");
	end
	SendGlobalMsg(target);
end
function ontalk1967_3(npc,player)
	local target = {};
	for i=1,100 do
		table.insert(target,13);
		table.insert(target,"<font color='#9e1ad5'>玩家</font> <font color='#2ac0b7'>["..player:GetName().."]</font> 挖掘宝藏,获得:{_equip,20001}");
	end
	SendGlobalMsg(target);
end
function ontalk1967_4(npc,player)
	local target = {};
	for i=1,500 do
		table.insert(target,13);
		table.insert(target,"<font color='#9e1ad5'>玩家</font> <font color='#2ac0b7'>["..player:GetName().."]</font> 挖掘宝藏,获得:{_equip,20001}");
	end
	SendGlobalMsg(target);
		-- g_broadcast(13,0,0,"<font color='#9e1ad5'>玩家</font> <font color='#2ac0b7'>["..player:GetName().."]</font> 挖掘宝藏,获得:{_equip,20001}");
end

function ontalk1967_1(npc,player)
	local nvip = player:get_player_type();
	if nvip >= 1 then
		player:randomthismap(45);
		g_broadcast(14,0,0,"<font color='#28ff28'>["..player:GetName().."]</font>进入了<font color='#28ff28'>BOSS之家一层</font>，BOSS之家可在传奇土城BOSS之家NPC处进入");
		g_broadcast(13,0,0,"<font color='#28ff28'>["..player:GetName().."]</font>进入了<font color='#28ff28'>BOSS之家一层</font>，BOSS之家可在传奇土城BOSS之家NPC处进入");
	else
		player:alert(21,0,0,"对不起，您的条件不足无法进入BOSS之家!");
	end
end