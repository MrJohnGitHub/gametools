function ontalk1923(npc,event,player)
	if player:get_task_state(2) == 96 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
据我调查，天界灵玉被当初摧毁通天塔的九个魔
族天王瓜分了，若想修复通天塔，需将那些魔族
天王剿灭，此事恐怕要拜托传奇联盟了。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">60000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
夜观天象，可知天下之大事。
#&task_content#&           	     	     
  ]]);
  end
end
	
function CreatureNpcSceneNpcStatus1923(npc,event,player,npcid)
	if npcid == 1209 then
		if player:get_task_state(2) == 96 then
			player:show_npc_flags(npcid,1);

		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1923_1(npc,player)
	if player:get_task_state(2) == 96 then
		player:set_task_state(2,99);
		player:push_task_data(1,1);
		player:add_exp(60000);

		player:add_gamemoney_bind(0);
		player:find_road_goto(12,132,91,1220);
	end
end

function CreatureNpcFun1923(npc,event,player,funid)
	if funid == 1 then
		ontalk1923_1(npc,player);
		return;
	end
end