function ontalk105(npc,event,player)
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

function CreatureNpcFun1013(npc,event,player,funid)
  if funid == 2 and player:get_task_state(12) == 2 then
      player:set_task_state(13,1);  
      player:push_task_data(13,1);
      player:add_exp(100000);
      player:add_gamemoney_bind(10000);
      return;
  end
end
	
function CreatureNpcSceneNpcStatus105(npc,event,player,npcid)
	if npcid == 507 then
		if player:get_task_state(3) == 118 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

