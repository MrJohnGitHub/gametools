-- dofile("scripts\\ftiku.lua")
function ontalk1910(npc,event,player)
	if player:get_task_state(2) == 1 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
我听说了你在海角村的表现，现在很少能看到像
你这样出色的年轻人了，干的不错，快就到皇城
卫队那里报到吧！
#&task_target#&
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">3000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item19083#&<font color="#28FF28">小飞鞋 * 50</font>
#&todoM2402,1#&talk_finish_bt#&]]);
	else

	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
从哪来，往哪去，家里有几口人，人均几
亩地，地里几头牛，说！
  ]]);
	end
end

function CreatureNpcFun1910(npc,event,player,funid)
	if funid == 1 then
		ontalk1910_1(npc,player);
		return;
	end
	

	
	
end

function CreatureNpcSceneNpcStatus1910(npc,event,player,npcid)
	if npcid == 1212 then
		if player:get_task_state(2) == 1 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end


function ontalk1910_1(npc,player)
	if player:get_task_state(2) == 1 then
		player:set_task_state(2,5);
		player:push_task_data(1,1);
		player:add_exp(3000);

		player:add_gamemoney_bind(0);
		player:add_item(19083,50,1,0,0);
		-- player:enter_map(12,118,132,0);
		player:find_road_goto(12,143,151,1202);
	end
end