function ontalk1953(npc,event,player)
	if player:gen_has(0) <= 0 then
		player:openpanel(58);
	else
		player:alert(21,0,0,"请尽快押解镖车前往目的地!!");
	end
end


	
function CreatureNpcSceneNpcStatus1953(npc,event,player,npcid)
	if npcid == 1214 then
		if player:get_task_state(3) == 87 then
			player:show_npc_flags(npcid,1);
		elseif player:get_task_state(10) == 1 then
			if player:get_param(287) >= 1 then
				player:show_npc_flags(npcid,3);
			end
		else
			player:show_npc_flags(npcid,0);
		end
	end
end


