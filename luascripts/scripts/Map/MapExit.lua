function Map61_Exit(map,player)
	player:enter_map(17,120,150,0);
	if player:get_task_state(3) == 75 then
		player:gui_high_focus(1,3,30,35,"点击npc寻路");
	end
end


--新手十倍场出场景
function Map33_Exit(map,player)
    player:del_status(1105);
end
