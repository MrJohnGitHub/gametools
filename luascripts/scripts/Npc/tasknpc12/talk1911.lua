function ontalk1911(npc,event,player)
	if player:get_task_state(2) == 5 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
我听说了你在海角村的表现，正好我们要配合张
天师完成一项任务，需要你的协助，不过在此之
前先在城里领取一些好的装备吧。
#&task_target#&
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">3000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
你最好听我的劝告，不要在城里闹事，否
则你会知道错的。

  ]]);
  end
end

function CreatureNpcFun1911(npc,event,player,funid)
	if funid == 1 then
		ontalk1911_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1911(npc,event,player,npcid)
	if npcid == 1202 then
		if player:get_task_state(2) == 5 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1911_1(npc,player)
	if player:get_task_state(2) == 5 then
		player:set_task_state(2,10);
		player:push_task_data(1,1);
		player:add_exp(3000);

		player:add_gamemoney_bind(0);
		player:find_road_goto(12,111,163,1204);
	end
end