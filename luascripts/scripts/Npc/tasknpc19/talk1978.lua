function ontalk1978(npc,event,player)
	if player:gen_has(0) <= 0 then
		if player:get_param(287) >= 1 then
			player:enter_map(12,110,120,3);
			player:find_road_goto(12,95,79,1214);
		else
			player:enter_map(17,124,152,3);
		end
		player:alert(21,0,0,"你的镖车呢？？？");
	else
		player:openpanel(59);
	end
end

function CreatureNpcFun1978(npc,event,player,funid)

end
	
function CreatureNpcSceneNpcStatus1978(npc,event,player,npcid)
	if npcid == 1905 then
		if player:get_task_state(10) == 2 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end