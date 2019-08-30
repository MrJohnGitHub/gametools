--打宝NPC
function ontalk1110(npc,event,player)
player:echo(0,npc:GetLowGUID(),[[
title^npc123|
image^fubengshuoming|
line|
text^<font color="#8f7754">打装备的好去处，每次进入消耗一定数额元宝<br>初级打宝新手玩家必进，爆70级装备<br>中级和高级打宝欢迎高阶玩家，爆转生装备<br>超级打宝，稀有装备等着最强的你</font>|
image^chujidabao|text^<font color="#b8a085">（挑战等级：60）</font>|
line|
text^<u><a href='event:M2411,202,0,0'><font color="#32ea00">火 云 山</font></a></u>^免费进入|
text^<u><a href='event:M2411,203,0,0'><font color="#32ea00">龙君墓穴</font></a></u>^进入消耗5绑定元宝|
text^<u><a href='event:M2411,204,0,0'><font color="#32ea00">三万山崖</font></a></u>^进入消耗5绑定元宝|
|

image^zhongjidabao|text^<font color="#b8a085">（挑战等级：转1）</font>|
line|
text^<u><a href='event:M2411,205,0,0'><font color="#32ea00">荒芜戈壁</font></a></u>^进入消耗10绑定元宝|
text^<u><a href='event:M2411,206,0,0'><font color="#32ea00">天 女 峰</font></a></u>^进入消耗10绑定元宝|
text^<u><a href='event:M2411,207,0,0'><font color="#32ea00">幽冥九渊</font></a></u>^进入消耗10绑定元宝|
|

image^gaojidabao|text^<font color="#b8a085">（挑战等级：转3）</font>|
line|
text^<u><a href='event:M2411,208,0,0'><font color="#32ea00">巫神禁地</font></a></u>^进入消耗15绑定元宝|
text^<u><a href='event:M2411,209,0,0'><font color="#32ea00">无尽深海</font></a></u>^进入消耗15绑定元宝|
text^<u><a href='event:M2411,210,0,0'><font color="#32ea00">蛮荒雪域</font></a></u>^进入消耗15绑定元宝|
|

image^chaojidabao|text^<font color="#b8a085">（挑战等级：转5）</font>|
line|
text^<u><a href='event:M2411,211,0,0'><font color="#32ea00">螺云荒漠</font></a></u>^进入消耗30绑定元宝|
|

]]);
end



--#&task_describe#&这里是末日168场景,点击进入<u><a href='event:M2411,34,30,50,0'>进入场景</a></u>

function CreatureNpcFun1110(npc,event,player,funid)
	if funid == 1 then
		ontalk1110(npc,player);
		return;
	end


	
end

function CreatureNpcSceneNpcStatus1110(npc,event,player,npcid)
	if npcid == 1101 then
		if player:get_task_state(2) == 40 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

