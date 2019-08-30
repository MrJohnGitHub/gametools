function ontalk1942(npc,event,player)
	if player:get_task_state(3) == 135 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
我那痴情的傻弟弟，居然为了寻那蛇妖闯了进
去，我该怎么办？我夫君追进去想寻他回来，如
今还没消息，求你一定要帮我找到他们。
#&task_target#&
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">6000000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10181#&<font color="#28FF28">荣誉卷轴(小) * 1</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
人妖殊途，我那痴情的傻弟弟，到底何时
方能醒悟过来。

  ]]);
  end
end

function CreatureNpcFun1027(npc,event,player,funid)
 if funid == 2 and player:get_task_state(27) == 2 then
      player:set_task_state(28,1);  
      player:push_task_data(28,1);
      player:add_exp(400000);
      player:add_gamemoney_bind(70000);
	    local job = player:get_job();
	    if job == 1 then
		player:add_item(20705,1,1,0,0);
	    elseif job == 2 then
		player:add_item(20726,1,1,0,0);
	    else 
		player:add_item(20747,1,1,0,0);
	    end      
    return;
  end
end
	
function CreatureNpcSceneNpcStatus1942(npc,event,player,npcid)
	if npcid == 502 then
		if player:get_task_state(3) == 135 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1942_1(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(3) == 135 then
		player:set_task_state(3,140);
		player:push_task_data(1,1);
		player:add_item(10181,1,1,0,0);
		player:add_exp(6000000);

		player:add_gamemoney_bind(0);
		player:autofightstart(5,50,77);
	end
end
