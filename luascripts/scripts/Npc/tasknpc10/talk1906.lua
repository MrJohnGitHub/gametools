function ontalk1906(npc,event,player)
	if player:get_task_state(1) == 45 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
浅滩登陆的魔物越来越多，海滩这边的防线快
要崩溃了，一定要想办法杀死怪物的头领。
#&task_target#&
#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">500</font>
#&item19004#&<font color="#28FF28">0</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
我曾经梦想着当一名屠龙的勇士，直到我
的膝盖中了一箭。

  ]]);
  end
end

function CreatureNpcFun1906(npc,event,player,funid)
	if funid == 1 then
		ontalk1906_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1906(npc,event,player,npcid)
	if npcid == 1007 then
		if player:get_task_state(1) == 45 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1906_1(npc,player)
	if player:get_task_state(1) == 45 then
		player:set_task_state(1,50);
		player:push_task_data(1,1);
		player:add_exp(500);

		player:add_gamemoney_bind(0);
		-- player:find_road_item(10,37,42,19004);
		player:openpanel(57);
	end
end