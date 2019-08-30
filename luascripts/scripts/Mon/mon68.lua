function mon8805(mon,event,player)
	if player:get_task_state(104) == 1 then
		if player:get_param(314) == 0 then
			player:set_param(314,1);
			player:alert(19,0,0,"恭喜你获得了一次额外奖励机会,在NPC提交任务的时候看到!");
		end
	end
end
