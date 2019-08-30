function ontalk1922(npc,event,player)
	if player:get_task_state(2) == 105 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		local job = player:get_job();
		local gender = player:get_gender();
		local item = 0;
		if job == 1 then
			if gender == 1 then
				item = 30090;
			else
				item = 30093;
			end
		elseif job == 2 then
			if gender == 1 then
				item = 30091;
			else
				item = 30094;
			end
		elseif job == 3 then
			if gender == 1 then
				item = 30092;
			else
				item = 30095;
			end
		end
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
我们是奉命来这里协助你的先遣队卫兵，请不必
替我们担心，作为一个真正的皇城士兵，即便流
尽最后一滴血，我等也绝不后退。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">100000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item]]..item..[[#&<font color="#28FF28">传奇级衣服 * 1</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	elseif player:get_task_state(3) == 86 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
这里拥有最坚固的城墙和最强大的军队，是魔族
都无法战胜的赤月皇城。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">50000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,2#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
这里拥有最坚固的城墙和最强大的军队，
是魔族都无法战胜的赤月皇城。

  ]]);
  end
end

function CreatureNpcFun1922(npc,event,player,funid)
	if funid == 1 then
		ontalk1922_1(npc,player);
		return;
	end
	if funid == 2 then
		ontalk1922_2(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1922(npc,event,player,npcid)
	if npcid == 1208 then
		if player:get_task_state(2) == 105 then
			player:show_npc_flags(npcid,1);
		elseif player:get_task_state(3) == 86 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1922_1(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(2) == 105 then
		player:set_task_state(2,110);
		player:push_task_data(1,1);
		player:add_exp(100000);

		local job = player:get_job();
		local gender = player:get_gender();
		local item = 0;
		if job == 1 then
			if gender == 1 then
				player:add_item(30090,1,1,0,0);
			else
				player:add_item(30093,1,1,0,0);
			end
		elseif job == 2 then
			if gender == 1 then
				player:add_item(30091,1,1,0,0);
			else
				player:add_item(30094,1,1,0,0);
			end
		elseif job == 3 then
			if gender == 1 then
				player:add_item(30092,1,1,0,0);
			else
				player:add_item(30095,1,1,0,0);
			end
		end
		player:add_gamemoney_bind(0);
		player:openpanel(57);
	end
end

function ontalk1922_2(npc,player)
	if player:get_task_state(3) == 86 then
		player:set_task_state(3,95);
		player:push_task_data(1,1);
		player:add_exp(50000);

		player:add_gamemoney_bind(0);
		player:openpanel(57);
	end
end

