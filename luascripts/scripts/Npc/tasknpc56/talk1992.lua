function ontalk1992(npc,event,player)
	if player:get_task_state(4) == 135 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
邪恶熔岩内的魔族准备袭击土城，我们必须要
想办法阻止他们，请协助我杀死一些熔岩战将。
#&task_target#&
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">5000000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	elseif player:get_task_state(4) == 145 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
邪恶熔岩内的魔族准备袭击土城，我们必须要
想办法阻止他们
#&task_target#&
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">5000000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10182#&<font color="#28FF28">特戒碎片(中) * 2</font>

#&todoM2402,2#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
这里拥有最坚固的城墙和最强大的军队，
是魔族都无法战胜的赤月皇城。

  ]]);
  end
end

function CreatureNpcFun1992(npc,event,player,funid)
	if funid == 1 then
		ontalk1992_1(npc,player);
		return;
	end
	if funid == 2 then
		ontalk1992_2(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1992(npc,event,player,npcid)
	if npcid == 1208 then
		if player:get_task_state(4) == 135 then
			player:show_npc_flags(npcid,1);
		elseif player:get_task_state(4) == 145 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1992_1(npc,player)
	if player:get_task_state(4) == 135 then
		player:set_task_state(4,140);
		player:push_task_data(4,1);
		player:add_exp(5000000);

		player:add_gamemoney_bind(0);
		player:autofightstart(56,30,95);
	end
end

function ontalk1992_2(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(4) == 145 then
		local level = player:get_param(258);
		if level >= 20 then
			player:set_task_state(4,155);
		else
			player:set_task_state(4,150);
		end
		player:add_item(10243,2,1,0,0);
		player:push_task_data(1,1);
		player:add_exp(5000000);

		player:add_gamemoney_bind(0);
	end
end

