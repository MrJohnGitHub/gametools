function ontalk1989(npc,event,player)
	if player:get_task_state(4) == 75 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
铁血魔域的兽骑掠夺成性，手上沾满了我人族
的鲜血，请杀死一些兽骑统领让他们血债血偿。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">5000000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	elseif player:get_task_state(4) == 85 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
铁血魔域的兽骑掠夺成性，手上沾满了我人族
的鲜血
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">5000000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10182#&<font color="#28FF28">特戒碎片(中) * 1</font>


#&todoM2402,2#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
这里拥有最坚固的城墙和最强大的军队，
是魔族都无法战胜的赤月皇城。

  ]]);
  end
end

function CreatureNpcFun1989(npc,event,player,funid)
	if funid == 1 then
		ontalk1989_1(npc,player);
		return;
	end
	if funid == 2 then
		ontalk1989_2(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1989(npc,event,player,npcid)
	if npcid == 1208 then
		if player:get_task_state(4) == 75 then
			player:show_npc_flags(npcid,1);
		elseif player:get_task_state(4) == 85 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1989_1(npc,player)
	if player:get_task_state(4) == 75 then
		player:set_task_state(4,80);
		player:push_task_data(4,1);
		player:add_exp(5000000);

		player:add_gamemoney_bind(0);
		player:autofightstart(39,63,81);
	end
end

function ontalk1989_2(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(4) == 85 then
		local level = player:get_param(258);
		if level >= 5 then
			player:set_task_state(4,95);
		else
			player:set_task_state(4,90);
		end
		player:add_item(10243,1,1,0,0);
		player:push_task_data(1,1);
		player:add_exp(5000000);

		player:add_gamemoney_bind(0);
	end
end