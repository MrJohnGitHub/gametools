function ontalk1934(npc,event,player)
	if player:get_task_state(3) == 25 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
你是从赤月皇城来的吧？我们是无双城的守备
军，奉无双城主之命来这里剿灭魔物，现在协
助我们剿灭蚁洞，可以获得无双城的悬赏。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">1700000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10145#&<font color="#28FF28">盾牌精华(小) * 1</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
公主殿下貌美如花，私心想着若是能得其青睐，
倒也不负恩泽，看什么看？我就不爱说人话！

  ]]);
  end
end

function CreatureNpcFun1934(npc,event,player,funid)
	if funid == 1 then
		ontalk1934_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1934(npc,event,player,npcid)
	if npcid == 2801 then
		if player:get_task_state(3) == 25 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1934_1(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(3) == 25 then
		player:set_task_state(3,30);
		player:push_task_data(1,1);
		player:add_exp(1700000);

		player:add_item(10145,1,1,0,0);
		player:add_gamemoney_bind(0);
		player:autofightstart(28,64,123);
	end
end