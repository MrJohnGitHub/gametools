function ontalk1927(npc,event,player)
	if player:get_task_state(2) == 145 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
只要越过前面那群牛魔将军的防线，就能进入
牛魔王的老巢，我们会想尽办法缠住他们，剩
下的事情就交给你了。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">600000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	elseif player:get_task_state(2) == 155 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
只要越过前面那群牛魔将军的防线，就能进入
牛魔王的老巢，我们会想尽办法缠住他们，剩
下的事情就交给你了。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">800000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,2#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
昨晚那酒喝得可真过瘾，回头再找小王喝
几杯。

  ]]);
  end
end

function CreatureNpcFun1927(npc,event,player,funid)
	if funid == 1 then
		ontalk1927_1(npc,player);
		return;
	end
	if funid == 2 then
		ontalk1927_2(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1927(npc,event,player,npcid)
	if npcid == 204 then
		if player:get_task_state(2) == 145 then
			player:show_npc_flags(npcid,1);
		elseif player:get_task_state(2) == 155 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1927_1(npc,player)
	if player:get_task_state(2) == 145 then
		player:set_task_state(2,150);
		player:push_task_data(1,1);
		player:add_exp(600000);

		player:add_gamemoney_bind(0);
		player:autofightstart(2,33,49);
	end
end

function ontalk1927_2(npc,player)
	if player:get_task_state(2) == 155 then
		player:set_task_state(2,160);
		player:push_task_data(1,1);
		player:add_exp(800000);

		player:add_gamemoney_bind(0);
		player:openpanel(57);
	end
end
