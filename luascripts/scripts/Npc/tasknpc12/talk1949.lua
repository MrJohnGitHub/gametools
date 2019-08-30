function ontalk1949(npc,event,player)
	if player:get_task_state(3) == 190 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
听说皇城发现了上古时期的诸神战场，是众多英
雄的埋骨之地，里面埋藏着众多上古时期的神兵
利器，快去向特殊副本使者打听下吧。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">11000000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
幸好公主殿下平安无事，否则我等难辞其
咎。

  ]]);
  end
end

function CreatureNpcFun1949(npc,event,player,funid)
	if funid == 1 then
		ontalk1949_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1949(npc,event,player,npcid)
	if npcid == 1211 then
		if player:get_task_state(3) == 190 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1949_1(npc,player)
	if player:get_task_state(3) == 190 then
		player:set_task_state(3,195);
		player:push_task_data(1,1);
		player:add_exp(11000000);

		player:add_gamemoney_bind(0);
		player:find_road_goto(12,134,140,1207);
	end
end