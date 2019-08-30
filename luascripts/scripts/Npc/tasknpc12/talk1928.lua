function ontalk1928(npc,event,player)
	if player:get_task_state(2) == 175 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
我们会全力协助你修复通天之塔，不过法神阁下
正在楼兰荒漠，我希望你能亲自去见他一面。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">2200000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
身为法师，我们都在用毕生的精力探索魔
法的奥秘。

  ]]);
  end
end

function CreatureNpcFun1928(npc,event,player,funid)
	if funid == 1 then
		ontalk1928_1(npc,player);
		return;
	end
	if funid == 2 then
		ontalk1928_2(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1928(npc,event,player,npcid)
	if npcid == 1210 then
		if player:get_task_state(2) == 175 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1928_1(npc,player)
	if player:get_task_state(2) == 175 then
		player:set_task_state(2,180);
		player:push_task_data(1,1);
		player:add_exp(2200000);

		player:find_road_goto(12,109,109,1215);
	end
end