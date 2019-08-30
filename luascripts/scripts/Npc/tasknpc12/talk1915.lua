function ontalk1915(npc,event,player)
	if player:get_task_state(2) == 25 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
我已经为你精心挑选了几件饰品，不用多久你就
能体会到它们的好处。现在快去张天师哪里接受
任务吧，想必他已经等你很久了。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">8000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
不要以为只有女人才喜欢首饰，到我店里
来的男客人多了去了。

  ]]);
  end
end

function CreatureNpcFun1915(npc,event,player,funid)
	if funid == 1 then
		ontalk1915_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1915(npc,event,player,npcid)
	if npcid == 1206 then
		if player:get_task_state(2) == 25 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1915_1(npc,player)
	if player:get_task_state(2) == 25 then
		player:set_task_state(2,30);
		player:push_task_data(1,1);
		player:add_exp(8000);

		player:add_gamemoney_bind(0);
		player:find_road_goto(12,104,115,1207);
	end
end