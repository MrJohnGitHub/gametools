function ontalk1052(npc,event,player)
    local mapid = player:GetMapId();
    if mapid < 237 and mapid >= 220 then
        mapid = mapid + 1;
    end
    
    OnRequestTran(player, mapid, 30, 50,0);
end

function CreatureNpcFun1052(npc,event,player,funid)
    if funid == 1 then
        ontalk1052(npc,event,player);
        return;
    end
end
	
function CreatureNpcSceneNpcStatus1052(npc,event,player,npcid)
	if npcid == 103 then
		if player:get_task_state(2) == 60 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end
