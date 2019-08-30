function ontalk1941(npc,event,player)
	if player:get_task_state(3) == 125 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
老朽在此采了十几年的药草，没见过几个活人，
如今这里成了蛇妖的巢穴，倒是一连见到好些人
闯了进去，你年纪轻轻何必进去送死。
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
自古以来，毒物栖身之地必有解毒之物，
找对了可得一线生机。

  ]]);
  end
end

function CreatureNpcFun1010(npc,event,player,funid)
  if funid == 2 and player:get_task_state(10) == 2 then
      player:set_task_state(11,1);  
      player:push_task_data(11,1);
      player:add_exp(18000);
      player:add_gamemoney_bind(10000);
      return;
  end
end
	
function CreatureNpcSceneNpcStatus1941(npc,event,player,npcid)
	if npcid == 501 then
		if player:get_task_state(3) == 125 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1941_1(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(3) == 125 then
		player:set_task_state(3,130);
		player:push_task_data(1,1);
		player:add_exp(5500000);

		player:add_item(10181,1,1,0,0);
		player:add_gamemoney_bind(0);
		player:autofightstart(5,26,81);
	end
end