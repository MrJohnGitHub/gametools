function ontalk1913(npc,event,player)
	if player:get_task_state(2) == 10 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		local gender = player:get_gender();
		local item = 30003;
		if gender == 2 then
			item = 30004;
		end
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
好的防具可以在危难之时救你一命
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">3500</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item]]..item..[[#&<font color="#28FF28">白银甲 * 1</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
好的防具能在混乱的战场中救你一命，要
来一件吗？

  ]]);
  end
end

function CreatureNpcFun1913(npc,event,player,funid)
	if funid == 1 then
		ontalk1913_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1913(npc,event,player,npcid)
	if npcid == 1204 then
		if player:get_task_state(2) == 10 then
			player:show_npc_flags(npcid,1);
		elseif player:get_task_state(3) == 10 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1913_1(npc,player)
	if player:get_task_state(2) == 10 then
		player:set_task_state(2,15);
		player:push_task_data(1,1);
		player:add_exp(3500);

		local gender = player:get_gender();
		if gender == 1 then
			player:add_item(30003,1,1,0,0);
		else
			player:add_item(30004,1,1,0,0);
		end
		player:add_gamemoney_bind(0);
		player:find_road_goto(12,83,140,1221);
	end
end