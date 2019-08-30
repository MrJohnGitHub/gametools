function ontalk1929(npc,event,player)
	if player:get_task_state(2) == 200 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
多谢相救，奴家随我夫君外出经商，经过这楼兰
城的时候突然遭到魔物的袭击，慌乱中与我夫君
走散了，求你帮我寻回我夫君。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">1400000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
钱财只是身外之物，夫君却看得比什么都
重要，奴家该怎么办？

  ]]);
  end
end

function CreatureNpcFun1929(npc,event,player,funid)
	if funid == 1 then
		ontalk1929_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1929(npc,event,player,npcid)
	if npcid == 1901 then
		if player:get_task_state(2) == 200 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1929_1(npc,player)
	if player:get_task_state(2) == 200 then
		player:set_task_state(2,205);
		player:push_task_data(1,1);
		player:add_exp(1400000);

		player:add_gamemoney_bind(0);
		player:autofightstart(19,84,65);
	end
end