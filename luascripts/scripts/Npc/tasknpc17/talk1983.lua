function ontalk1983(npc,event,player)
	player:openpanel(56);
end

function CreatureNpcFun1983(npc,event,player,funid)
	if funid == 1 then
		ontalk1983_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1983(npc,event,player,npcid)
	if npcid == 1720 then
		player:show_npc_flags(npcid,3);
	end
end


function ontalk1983_1(npc,player)
	player:alert(21,0,0,"不好意思，整顿中")
end
