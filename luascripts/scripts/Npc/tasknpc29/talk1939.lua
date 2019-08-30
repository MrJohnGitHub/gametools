function ontalk1939(npc,event,player)
	if player:get_task_state(3) == 87 then
		player:openpanel(59);
	elseif player:get_task_state(3) == 90 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
公主殿下被那群匪徒挟持在皇宫里面，单凭无双
城的守备力量恐怕无法保证公主的安危，请助我
等杀出一条血路吧。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">7000000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
幸好公主殿下平安无事，否则我等难辞其咎。

  ]]);
  end
end

function CreatureNpcFun1939(npc,event,player,funid)
	if funid == 1 then
		ontalk1939_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1939(npc,event,player,npcid)
	local task3 = player:get_task_state(3);
	if npcid == 1709 then
		if task3 == 90 or task3 == 87 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1939_1(npc,player)
	if player:get_task_state(3) == 90 then
		player:set_task_state(3,95);
		player:push_task_data(1,1);
		player:add_exp(7000000);

		player:add_gamemoney_bind(0);
		player:openpanel(57);
	end
end