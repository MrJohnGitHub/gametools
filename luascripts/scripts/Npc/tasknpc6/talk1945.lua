function ontalk1945(npc,event,player)
	if player:get_task_state(3) == 170 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
法神阁下已经将蛇魔巢穴里的蛇魔大将军击败，
但是蛇女美杜莎躲进了蛇王洞窟，剩下的恐怕
要靠你和法师阁下了！
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
能追随在大法师的身边，是我们最大的荣幸。

  ]]);
  end
end

function CreatureNpcFun1945(npc,event,player,funid)
	if funid == 1 then
		ontalk1945_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1945(npc,event,player,npcid)
	if npcid == 5050 then
		if player:get_task_state(3) == 170 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end


function ontalk1945_1(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(3) == 170 then
		player:set_task_state(3,175);
		player:push_task_data(1,1);
		player:add_exp(6500000);

		player:add_item(10181,1,1,0,0);
		player:add_gamemoney_bind(0);
		player:autofightstart(5,78,28);
	end
end