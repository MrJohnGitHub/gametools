function ontalk1972(npc,event,player)
	if player:get_task_state(3) == 100 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
多谢你的相助我才得以报这杀父之仇，不过以我
的实力不足以当无双城城主，他日你若有足够的
势力，我希望你能来当这无双城之主。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">8000000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10181#&<font color="#28FF28">荣誉卷轴(小) * 1</font>

#&todoM2402,3#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
如果你的傻笑是因为我的美貌，那么我会很
高兴的。

  ]]);
  end
end

function CreatureNpcFun1972(npc,event,player,funid)
	if funid == 3 then
		ontalk1972_3(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1972(npc,event,player,npcid)
	if npcid == 11201 then
		if player:get_task_state(3) == 100 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1972_3(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(3) == 100 then
		player:set_task_state(3,105);
		player:push_task_data(3,1);
		player:add_exp(8000000);

		player:add_item(10181,1,1,0,0);
		player:add_gamemoney_bind(0);
		player:find_road_goto(17,114,152,1715);
		player:gui_high_focus(1,3,30,35,"点击npc寻路");
	end
end