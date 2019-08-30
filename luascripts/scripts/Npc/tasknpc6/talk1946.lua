function ontalk1946(npc,event,player)
	if player:get_task_state(3) == 180 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
蛇魔族的蛇王美杜莎就在洞穴深处，但是蛇魔洞
窟非常的巨大，想要找到蛇魔的巢穴恐怕需要大
量人手，你回皇城请城主派兵相助吧。
#&task_target#&
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">7000000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10181#&<font color="#28FF28">荣誉卷轴(小) * 1</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
这里的空气中都弥漫着毒液的气息，我讨
厌蛇魔这种魔物。

  ]]);
  end
end

function CreatureNpcFun1946(npc,event,player,funid)
	if funid == 1 then
		ontalk1946_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1946(npc,event,player,npcid)
	if npcid == 506 then
		if player:get_task_state(3) == 180 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1946_1(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(3) == 180 then
		local level = player:get_level();
		if level >= 70 then
			player:set_task_state(3,182);
		else
			player:set_task_state(3,181);
		end
		player:add_item(10181,1,1,0,0);
		player:push_task_data(1,1);
		player:add_exp(7000000);

		player:add_gamemoney_bind(0);
		player:openpanel(57);
	end
end