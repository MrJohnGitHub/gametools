function ontalk1907(npc,event,player)
	if player:get_task_state(1) == 25 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
我已经提前炼制好了一批药物，足够缓解眼前
的燃眉之急，拜托你帮我送到前线去！
#&task_target#&
#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">300</font>
#&item19004#&<font color="#28FF28">0</font>
#&item10037#&<font color="#28FF28">太阳药水</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
良药苦口利于病，忠言逆耳利于行，你今
天吃药了没？

  ]]);
  end
end

function CreatureNpcFun1907(npc,event,player,funid)
	if funid == 1 then
		ontalk1907_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1907(npc,event,player,npcid)
	if npcid == 1005 then
		if player:get_task_state(1) == 25 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1907_1(npc,player)
	if player:get_task_state(1) == 25 then
		player:set_task_state(1,30);
		player:push_task_data(1,1);
		player:add_exp(300);

		player:add_item(10037,6,1,0,0);
		player:add_gamemoney_bind(0);

		player:openpanel(66);
	end
end