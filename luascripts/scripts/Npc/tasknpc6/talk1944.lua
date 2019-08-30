function ontalk1944(npc,event,player)
	if player:get_task_state(3) == 160 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
你说得对，我不能让我姐姐和姐夫跟我一起冒
险，这样太自私了，我会跟他们回去的。但我
不相信素贞是妖怪，我还会回来这里找她的。
#&task_target#&
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">6500000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10181#&<font color="#28FF28">荣誉卷轴(小) * 1</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
娘子，我不会让你就这样离开我的！

  ]]);
  end
end

function CreatureNpcFun1944(npc,event,player,funid)
	if funid == 1 then
		ontalk1944_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1944(npc,event,player,npcid)
	if npcid == 504 then
		if player:get_task_state(3) == 160 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1944_1(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(3) == 160 then
		player:set_task_state(3,165);
		player:push_task_data(1,1);
		player:add_item(10181,1,1,0,0);
		player:add_exp(6500000);

		player:add_gamemoney_bind(0);
		player:autofightstart(5,108,87);
	end
end
