function ontalk1979(npc,event,player)
	if player:get_task_state(1) == 7 then
		local job = player:get_job();
		local item = 30002;
		if player:get_gender() == 1 then
			item = 30001;
		end
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
魔族突然袭击村庄，许多村民都受伤了，请协
助我们清除这些该死的怪物。
#&task_target#&
#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">140</font>
#&item19004#&<font color="#28FF28">0</font>
#&item]]..item..[[#&<font color="#28FF28">青铜衣服</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
其实一开始让我来玩这个游戏的时候，我
是拒绝的，玩了之后发现根本停不下来。

  ]]);
  end
end

function CreatureNpcFun1979(npc,event,player,funid)
	if funid == 1 then
		ontalk1979_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1979(npc,event,player,npcid)
	if npcid == 1013 then
		if player:get_task_state(1) == 7 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1979_1(npc,player)
	if player:get_task_state(1) == 7 then
		player:set_task_state(1,10);
		player:push_task_data(1,1);
		player:add_exp(140);

		player:add_gamemoney_bind(0);
		if player:get_gender() == 1 then
			player:add_item(30001,1,1,0,0);
			-- player:use_item(30001);
		else
			player:add_item(30002,1,1,0,0);
			-- player:use_item(30002);
		end
		player:autofightstart(10,56,21);
	end
end