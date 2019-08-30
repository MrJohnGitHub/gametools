function ontalk1986(npc,event,player)
	if player:get_task_state(4) == 1 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
近日来尸王洞腐朽尸气冲天，若不防范恐怕会危
及土城百姓，请助我净化尸洞消灭一些行尸。
#&task_target#&
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">5000000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	elseif player:get_task_state(4) == 25 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
近日来尸王洞腐朽尸气冲天，若不防范恐怕会危
及土城百姓
#&task_target#&
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">5000000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10243#&<font color="#28FF28">特戒碎片(中) * 1</font>

#&todoM2402,2#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
这里拥有最坚固的城墙和最强大的军队，
是魔族都无法战胜的赤月皇城。

  ]]);
  end
end

function CreatureNpcFun1986(npc,event,player,funid)
	if funid == 1 then
		ontalk1986_1(npc,player);
		return;
	end
	if funid == 2 then
		ontalk1986_2(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1986(npc,event,player,npcid)
	if npcid == 1208 then
		if player:get_task_state(4) == 1 then
			player:show_npc_flags(npcid,1);
		elseif player:get_task_state(4) == 25 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1986_1(npc,player)
	if player:get_task_state(4) == 1 then
		player:set_task_state(4,5);
		player:push_task_data(4,1);
		player:add_exp(5000000);

		player:add_gamemoney_bind(0);
		player:autofightstart(81,30,45);
	end
end

function ontalk1986_2(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(4) == 25 then
		player:set_task_state(4,26);
		player:enter_map(142,16,30,0);
		player:add_item(10243,1,1,0,0);
		player:push_task_data(1,1);
		player:add_exp(5000000);

		player:add_gamemoney_bind(0);
	end
end

