function ontalk1932(npc,event,player)
	if player:get_task_state(2) == 230 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
看来你们已经找到修复通天之塔的方法，我会全
力配合此事，不过眼下要先消灭楼兰巨魔。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">1700000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
我选择相信你，是因为我同样相信命运。

  ]]);
  end
end

function CreatureNpcFun1932(npc,event,player,funid)
	if funid == 1 then
		ontalk1932_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1932(npc,event,player,npcid)
	if npcid == 1904 then
		if player:get_task_state(2) == 230 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1932_1(npc,player)
	if player:get_task_state(2) == 230 then
		player:set_task_state(2,235);
		player:push_task_data(1,1);
		player:add_exp(1700000);

		player:add_gamemoney_bind(0);
		player:openpanel(57);
	end
end