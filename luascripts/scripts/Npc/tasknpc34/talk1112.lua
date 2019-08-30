function ontalk1112(npc,event,player)
  OnRequestTran(player, 201, 24, 33,0);
end

function CreatureNpcFun1112(npc,event,player,funid)
	if funid == 1 then
		ontalk1112(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1112(npc,event,player,npcid)
	if npcid == 101 then
		if player:get_task_state(2) == 40 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

