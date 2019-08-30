function ontalk1177(npc,event,player)	--迷宫出口NPC
	local param383 = player:get_param(383);
	if param383 == 1 then
		return;
	end
	player:set_param(383,1);
	local index = g_comple_maze_activity(player:GetLowGUID());
	local obj = {};
	obj.rank = index;
	player:SendPacketToSelf(2917,0,encode(obj));
	if index > 10 then
		player:alert(10,0,0,"恭喜完成挑战，很遗憾未进入排名!");
	else
		player:alert(10,0,0,"恭喜成为第"..index.."名完成挑战的玩家!");
	end
end