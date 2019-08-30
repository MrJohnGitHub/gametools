function ontalk1955(npc,event,player)
	player:openpanel(34);
	local task3 = player:get_task_state(3);
	if task3 == 67 or task3 == 70 or task3 == 182 or task3 == 185 then
		player:gui_high_focus(10,3,200,585,"请点击进入");
	else
		player:gui_high_focus(110,3,200,585,"请点击进入");
	end
end

function CreatureNpcFun1955(npc,event,player,funid)
end

function CreatureNpcSceneNpcStatus1955(npc,event,player,npcid)
end