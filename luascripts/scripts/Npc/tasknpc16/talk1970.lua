function ontalk1970(npc,event,player)
	if player:get_task_state(1) == 85 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
正所谓射人先射马，擒贼先擒王，想要彻底击
溃这群妖怪就要拿下魔族的统领，我们已经找
到魔族统领的位置，请随我来。
#&task_target#&
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">1200</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,3#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
其实一开始让我来玩这个游戏的时候，我
是拒绝的，玩了之后发现根本停不下来。

  ]]);
  end
end

function CreatureNpcFun1970(npc,event,player,funid)
	if funid == 3 then
		ontalk1970_3(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1970(npc,event,player,npcid)
	if npcid == 1010 then
		if player:get_task_state(1) == 85 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1970_3(npc,player)
	if player:get_task_state(1) == 85 then
		player:set_task_state(1,90);
		player:push_task_data(1,1);
		player:add_exp(1200);

		player:add_gamemoney_bind(0);
		-- player:find_road_goto(12,91,102,1201);
		player:openpanel(57);
	end
end