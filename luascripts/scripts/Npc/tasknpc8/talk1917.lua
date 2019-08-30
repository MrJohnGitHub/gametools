function ontalk1917(npc,event,player)
	if player:get_task_state(2) == 80 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
感谢你为我们送来了至关重要的消息，原来通天
塔的设计图就被刻在了机关巨兽的身上，请协助
我们消灭洞穴深处的机关巨兽。
#&task_target#&
#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">35000</font>
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

function CreatureNpcFun1917(npc,event,player,funid)
	if funid == 1 then
		ontalk1917_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1917(npc,event,player,npcid)
	if npcid == 105 then
		if player:get_task_state(2) == 80 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1917_1(npc,player)
	if player:get_task_state(2) == 80 then
		player:set_task_state(2,85);
		player:push_task_data(1,1);
		player:add_exp(35000);

		player:add_gamemoney_bind(0);
		player:openpanel(57);
	end
end