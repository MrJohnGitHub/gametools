function ontalk1109(npc,event,player)
player:echo(0,npc:GetLowGUID(),
[[#&task_describe#&这里是末日168场景,点击进入<u><a href='event:M2411,34,30,50,0'>进入场景</a></u> 
]]);
end

function CreatureNpcFun1109(npc,event,player,funid)
	if funid == 1 then
		ontalk1109(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1109(npc,event,player,npcid)
	if npcid == 101 then
		if player:get_task_state(2) == 40 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

