function ontalk1931(npc,event,player)
	if player:get_task_state(2) == 190 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
你是来自赤月皇城的使者？法神阁下正在楼兰荒
漠的深处对抗楼兰巨魔，想要找到他恐怕并不容
易，我会尽力配合你。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">2800000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
希望我们，还能有机会再见面。

  ]]);
  end
end

function CreatureNpcFun1931(npc,event,player,funid)
	if funid == 1 then
		ontalk1931_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1931(npc,event,player,npcid)
	if npcid == 1903 then
		if player:get_task_state(2) == 190 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1931_1(npc,player)
	if player:get_task_state(2) == 190 then
		player:set_task_state(2,195);
		player:push_task_data(1,1);
		player:add_exp(2800000);

		player:add_gamemoney_bind(0);
		player:autofightstart(19,63,125);
	end
end