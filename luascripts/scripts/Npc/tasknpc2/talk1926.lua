function ontalk1926(npc,event,player)
	if player:get_task_state(2) == 135 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
这些牛魔族的怪物力大无穷，他们射出的弓箭
能轻易穿透我们身上的盔甲，如果不能想办法
将打乱他们的阵型，我们的人会死伤惨重。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">400000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
昨夜跟统领大人喝醉了酒，今天醒来痔疮
就犯了，看来酒不能多喝。

  ]]);
  end
end

function CreatureNpcFun1926(npc,event,player,funid)
	if funid == 1 then
		ontalk1926_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1926(npc,event,player,npcid)
	if npcid == 203 then
		if player:get_task_state(2) == 135 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1926_1(npc,player)
	if player:get_task_state(2) == 135 then
		player:set_task_state(2,140);
		player:push_task_data(1,1);
		player:add_exp(400000);

		player:add_gamemoney_bind(0);
		player:autofightstart(2,56,72);
	end
end