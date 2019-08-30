function ontalk1908(npc,event,player)
	if player:get_task_state(1) == 15 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
受伤的人越来越多，我们储备的药物已经消耗
殆尽，麻烦你采集药草送到药师那里去。
#&task_target#&
#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">190</font>
#&item19004#&<font color="#28FF28">0</font>

#&todoM2402,3#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
听说铁匠大叔帮翠儿打造了一条钢鞭，今
晚回家我该如何是好？

  ]]);
  end
end

function CreatureNpcFun1908(npc,event,player,funid)
	if funid == 3 then
		ontalk1908_3(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1908(npc,event,player,npcid)
	if npcid == 1004 then
		if player:get_task_state(1) == 15 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1908_3(npc,player)
	if player:get_task_state(1) == 15 then
		player:set_task_state(1,20);
		player:push_task_data(1,1);
		player:add_exp(190);

		player:add_gamemoney_bind(0);
		player:find_road_item(10,34,29,19004);
		player:gui_high_focus(1,3,30,35,"点击npc寻路");
	end
end