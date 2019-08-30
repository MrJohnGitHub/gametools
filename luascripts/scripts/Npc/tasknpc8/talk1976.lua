function ontalk1976(npc,event,player)
	if player:get_task_state(2) == 32 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
据说筑造通天塔和机关洞的是同一个人，所以洞
穴里可能藏有修复通天之塔的方法，但我派去的
人至今毫无音讯，恐怕需要你的支援。
#&task_target#&
#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">16000</font>
#&item19004#&<font color="#28FF28">0</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
我们皇城近卫军的身上肩负着守护赤月皇
城的使命。

  ]]);
  end
end

function CreatureNpcFun1976(npc,event,player,funid)
	if funid == 1 then
		ontalk1976_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1976(npc,event,player,npcid)
	if npcid == 801 then
		if player:get_task_state(2) == 32 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1976_1(npc,player)
	if player:get_task_state(2) == 32 then
		player:set_task_state(2,35);
		player:push_task_data(1,1);
		player:add_exp(16000);

		player:add_gamemoney_bind(0);
		player:autofightstart(1,33,138);
	end
end