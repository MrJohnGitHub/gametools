function ontalk1900(npc,event,player)
	if player:get_task_state(1) == 1 then
		player:openpanel(1);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
魔族妖怪接踵而至，恐怕海角村将不得安
宁。
  ]]);
  end
end

function CreatureNpcFun1900(npc,event,player,funid)
	if funid == 1 then
		onTalk1900_1(npc,player);
		return;
	end
end

function CreatureNpcSceneNpcStatus1900(npc,event,player,npcid)
	if npcid == 1001 then
		if player:get_task_state(1) == 1 then
			player:show_npc_flags(npcid,1);
		elseif player:get_task_state(1) == 80 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function onTalk1900_1(npc,player)
	player:set_task_state(10,1);
	player:push_task_data(10,1);
end