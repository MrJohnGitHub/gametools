function ontalk1904(npc,event,player)
	if player:get_task_state(1) == 75 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
是我娘让你来找我的吗？我现在不想回去，那
些怪物把我家旺财杀死了，如果没有旺财我当
时可能就跑不掉了，你会替旺财报仇的对吗？
#&task_target#&
#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">900</font>
#&item19004#&<font color="#28FF28">0</font>
#&item60001#&<font color="#28FF28">青铜手镯 * 1</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
难道大人的身上都不藏糖果的吗？
  ]]);
  end
end

function CreatureNpcFun1904(npc,event,player,funid)
	if funid == 1 then
		ontalk1904_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1904(npc,event,player,npcid)
	if npcid == 1009 then
		if player:get_task_state(1) == 75 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1904_1(npc,player)
	if player:get_task_state(1) == 75 then
		player:set_task_state(1,80);
		player:push_task_data(1,1);
		player:add_exp(900);

		player:add_item(60001,1,1,0,0);
		player:add_gamemoney_bind(0);
		player:autofightstart(10,58,123);
	end
end