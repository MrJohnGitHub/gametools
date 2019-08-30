function ontalk101(npc,event,player)
	if player:get_task_state(3) == 118 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
听说里面的蛇可不是一般的蛇，有的据说已经修
炼成了妖，你可得小心一点。
#&task_target#&
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">5500000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10181#&<font color="#28FF28">荣誉卷轴(小) * 1</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
我选择相信你，是因为我同样相信命运。

  ]]);
  end
end

function CreatureNpcFun1001(npc,event,player,funid)
  if funid == 2 and player:get_task_state(1) == 2 then
		player:set_task_state(2,1);  
		player:push_task_data(2,1);
		player:add_exp(500);
		player:add_gamemoney_bind(500);
	    local job = player:get_job();
	    if job == 1 then
		player:add_item(20101,1,1,0,0);
	    elseif job == 2 then
		player:add_item(20122,1,1,0,0);
	    else 
		player:add_item(20143,1,1,0,0);
	    end
	return;
  end	
end
	
function CreatureNpcSceneNpcStatus101(npc,event,player,npcid)
	if npcid == 507 then
		if player:get_task_state(3) == 118 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end


function ontalk1933_1(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(3) == 118 then
		player:set_task_state(3,120);
		player:push_task_data(1,1);
		player:add_exp(5500000);

		player:add_item(10181,1,1,0,0);
		player:add_gamemoney_bind(0);
		player:autofightstart(5,34,130);
	end
end
