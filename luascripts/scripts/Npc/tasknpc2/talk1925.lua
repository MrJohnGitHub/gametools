function ontalk1925(npc,event,player)
	if player:get_task_state(2) == 125 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
我们是奉命来这里协助你的先遣队卫兵，请不
必替我们担心，作为一个真正的皇城士兵，即
便流尽最后一滴血，我等也绝不后退。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">200000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
先遣队可不是送死队，能加入先遣队的都
是真正的精锐。

  ]]);
  end
end

function CreatureNpcFun1925(npc,event,player,funid)
	if funid == 1 then
		ontalk1925_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1925(npc,event,player,npcid)
	if npcid == 202 then
		if player:get_task_state(2) == 125 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1925_1(npc,player)
	if player:get_task_state(2) == 125 then
		player:set_task_state(2,130);
		player:push_task_data(1,1);
		player:add_exp(200000);

		player:add_gamemoney_bind(0);
		player:autofightstart(2,86,74);
	end
end