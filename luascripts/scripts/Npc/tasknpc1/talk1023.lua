function ontalk1918(npc,event,player)
	if player:get_task_state(2) == 40 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
你是皇城派来的支援吧？看来皇城还没有放弃
我们，不过我们的人被困在洞穴深处，情况危
在旦夕，请你帮我们杀出一条血路前去支援。
#&task_target#&
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">20000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
我们是战士，无论什么时候都不能放弃。

  ]]);
  end
end

function CreatureNpcFun1023(npc,event,player,funid)
 
end
	
function CreatureNpcSceneNpcStatus1918(npc,event,player,npcid)
	if npcid == 101 then
		if player:get_task_state(2) == 40 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1918_1(npc,player)
	if player:get_task_state(2) == 40 then
		player:set_task_state(2,45);
		player:push_task_data(1,1);
		player:add_exp(20000);

		player:add_gamemoney_bind(0);
		player:autofightstart(1,59,145);
	end
end