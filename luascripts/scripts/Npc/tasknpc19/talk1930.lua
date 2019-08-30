function ontalk1930(npc,event,player)
	if player:get_task_state(2) == 210 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
我这十几年打拼下来的偌大家产，恐怕要血本无
归了，请帮我回收我丢失的货物吧。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">1400000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	elseif player:get_task_state(2) == 220 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
多谢阁下帮我挽回不少损失，前面是怪物的老
巢，你若继续前行的话要多加小心。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">1600000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,2#&talk_accept_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
甲鱼用清炖，高蟹用红烧，对付什么人，
就用什么招!

  ]]);
  end
end

function CreatureNpcFun1930(npc,event,player,funid)
	if funid == 1 then
		ontalk1930_1(npc,player);
		return;
	end
	if funid == 2 then
		ontalk1930_2(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1930(npc,event,player,npcid)
	if npcid == 1902 then
		if player:get_task_state(2) == 210 then
			player:show_npc_flags(npcid,1);
		elseif player:get_task_state(2) == 220 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1930_1(npc,player)
	if player:get_task_state(2) == 210 then
		player:set_task_state(2,215);
		player:push_task_data(1,1);
		player:add_exp(1400000);

		player:add_gamemoney_bind(0);
		player:find_road_item(19,89,46,19027);
	end
end

function ontalk1930_2(npc,player)
	if player:get_task_state(2) == 220 then
		player:set_task_state(2,225);
		player:push_task_data(1,1);
		player:add_exp(1600000);

		player:add_gamemoney_bind(0);
		player:autofightstart(19,61,48);
	end
end
