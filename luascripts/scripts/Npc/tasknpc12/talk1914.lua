function ontalk1914(npc,event,player)
	if player:get_task_state(2) == 20 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
充足的药物补给能救你一命，而好的饰品也能
增加你在战斗中的实力，我建议你去找皇城饰
品店里面领取一些灵巧好用的首饰吧。
#&task_target#&

#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">7000</font>
#&item19004#&<font color="#28FF28">0</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
无论是激情pk还是单刷boss，都千万不要
忘了买药。
#&task_content#&

#&talk_line#&

  <u><a href='event:LINK_NPC_SHOP,411'>购买药品</a></u>

  ]]);
  end
end

function CreatureNpcFun1914(npc,event,player,funid)
	if funid == 1 then
		ontalk1914_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1914(npc,event,player,npcid)
	if npcid == 1205 then
		if player:get_task_state(2) == 20 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1914_1(npc,player)
	if player:get_task_state(2) == 20 then
		player:set_task_state(2,25);
		player:push_task_data(1,1);
		player:add_exp(7000);

		player:add_item(10037,36,1,0,0);

		player:add_gamemoney_bind(0);
		player:find_road_goto(12,110,96,1206);
	end
end