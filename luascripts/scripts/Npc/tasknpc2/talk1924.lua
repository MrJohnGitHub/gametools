function ontalk1924(npc,event,player)
	if player:get_task_state(2) == 115 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
看来想要集齐九块天界灵玉并不容易，那些魔
族天王都不容小视，离赤月最近的牛魔王眼下
在皇城野外的牛魔祭坛，我们先从他开始吧。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">150000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
我曾经有过梦想，直到我的膝盖中了一箭。

  ]]);
  end
end

function CreatureNpcFun1924(npc,event,player,funid)
	if funid == 1 then
		ontalk1924_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1924(npc,event,player,npcid)
	if npcid == 201 then
		if player:get_task_state(2) == 115 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1924_1(npc,player)
	if player:get_task_state(2) == 115 then
		player:set_task_state(2,120);
		player:push_task_data(1,1);
		player:add_exp(150000);

		player:add_gamemoney_bind(0);
		player:autofightstart(2,86,102);
	end
end