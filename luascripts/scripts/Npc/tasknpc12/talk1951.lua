function ontalk1951(npc,event,player)
	if player:get_task_state(2) == 90 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
你带回来的消息很有价值，我们终于找到了对抗
魔族的希望，请尽快将这消息禀报给城主大人。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">40000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&todoM2402,1#&talk_finish_bt#&]]);
	else

	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
从哪来，往哪去，家里有几口人，人均几
亩地，地里几头牛，说！
  ]]);
	end
end


function CreatureNpcSceneNpcStatus1951(npc,event,player,npcid)
	if npcid == 1201 then
		if player:get_task_state(2) == 90 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end


function ontalk1951_1(npc,player)
	if player:get_task_state(2) == 90 then
		player:set_task_state(2,93);
		player:push_task_data(1,1);
		player:add_exp(40000);

		player:add_gamemoney_bind(0);
		player:find_road_goto(12,104,116,1207);
	end
end
