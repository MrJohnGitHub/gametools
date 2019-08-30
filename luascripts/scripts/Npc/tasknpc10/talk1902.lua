function ontalk1902(npc,event,player)
	if player:get_task_state(1) == 55 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
海滩那边的情况得到了缓解是吗？实在太好
了，现在请你帮我们的士兵杀出一条血路。
#&task_target#&
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">700</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
蜡烛皮鞭，法力无边，看那家伙以后还敢
不敢不听我的话。

  ]]);
  end
end

function CreatureNpcFun1902(npc,event,player,funid)
	if funid == 1 then
		ontalk1902_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1902(npc,event,player,npcid)
	if npcid == 1003 then
		if player:get_task_state(1) == 55 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1902_1(npc,player)
	if player:get_task_state(1) == 55 then
		player:set_task_state(1,60);
		player:push_task_data(1,1);
		player:add_exp(700);

		player:add_gamemoney_bind(0);
		player:autofightstart(10,100,108);
	end
end