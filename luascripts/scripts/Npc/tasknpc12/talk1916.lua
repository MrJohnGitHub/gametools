function ontalk1916(npc,event,player)
	if player:get_task_state(2) == 30 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
魔族入侵前摧毁了通天塔，切断了人类和天界的
联系，因此我们要找到修复通天塔的方法，听说
线索就在皇城野外的机关洞内。
#&task_target#&

#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">14000</font>
#&item19004#&<font color="#28FF28">0</font>
#&item10233#&<font color="#28FF28">回城神石*99</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	elseif player:get_task_state(2) == 93 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
难怪我们尝试了无数种方法都未能修复通天塔，
原来需要九块独有的天界灵玉方能奏效，请将
此事转告赤月城主，并打探灵玉的下落。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">50000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,2#&talk_finish_bt#&]]);
	elseif player:get_task_state(2) == 165 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
天界灵玉果然在牛魔王的身上，只要剿灭剩下的
几个魔族天王就能修复通天之塔，我们需要更多
人的帮助。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">1000000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,3#&talk_finish_bt#&]]);
	elseif player:get_task_state(3) == 110 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
接下来的任务会更加危险，你的实力需要多加锻
炼，完成除魔任务可以快速提升你的实力。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">4500000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10181#&<font color="#28FF28">荣誉卷轴(小) * 1</font>

#&todoM2402,7#&talk_finish_bt#&]]);
	elseif player:get_task_state(3) == 190 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
听说皇城发现了上古时期的诸神战场，是众多英
雄的埋骨之地，里面埋藏着众多上古时期的神兵
利器，快去向特殊副本使者打听下吧。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">5000000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,8#&talk_finish_bt#&]]);
	else
	if player:get_level() >= 40 then
		player:openpanel(35);
		return;
	end
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
完成悬赏任务，可以获得大量的奖励。

  ]]);
	player:gui_high_focus(1,0,76,85,"点击传送");
  end
end

function CreatureNpcFun1916(npc,event,player,funid)
	local Npc1916Funid = {
	[1] =ontalk1916_1,
	[2] =ontalk1916_2,
	[3] =ontalk1916_3,
	[5] =ontalk1916_5,
	[6] =ontalk1916_6,
	[7] =ontalk1916_7,
	[8] =ontalk1916_8,
	[10] =ontalk1916_10
	};
	if Npc1916Funid[funid] ~= nil then
		Npc1916Funid[funid](npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1916(npc,event,player,npcid)
	local ntask2 = player:get_task_state(2);
	local ntask3 = player:get_task_state(3);
	if npcid == 1207 or npcid == 1714 then
		if ntask2 == 30  or ntask2 == 93 or ntask2 == 165 or ntask3 == 110 or ntask3 == 190 then
			player:show_npc_flags(npcid,1);
		elseif player:get_param(200) < 10 then
			player:show_npc_flags(npcid,3);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1916_1(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(2) == 30 then
		player:set_task_state(2,31);
		player:push_task_data(1,1);
		player:add_exp(14000);

		player:add_item(10233,99,1,0,0);
		player:add_gamemoney_bind(0);
		player:openpanel(57);
	end
end

function ontalk1916_2(npc,player)
	if player:get_task_state(2) == 93 then
		player:set_task_state(2,96);
		player:push_task_data(1,1);
		player:add_exp(50000);

		player:add_gamemoney_bind(0);
		player:find_road_goto(12,121,123,1209);
	end
end

function ontalk1916_3(npc,player)
	if player:get_task_state(2) == 165 then
		player:set_task_state(2,170);
		player:push_task_data(1,1);
		player:add_exp(1000000);

		player:add_gamemoney_bind(0);
		player:find_road_goto(12,110,133,1218);
	end
end


function ontalk1916_7(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(3) == 110 then
		player:set_task_state(3,115);
		player:push_task_data(1,1);
		player:add_exp(4500000);

		player:add_item(10181,1,1,0,0);
		player:add_gamemoney_bind(0);
		player:find_road_goto(17,131,160,1716);
	end
end

function ontalk1916_8(npc,player)
	if player:get_task_state(3) == 190 then
		player:set_task_state(3,191);
		player:push_task_data(1,1);
		player:add_exp(5000000);

		player:add_gamemoney_bind(360000);
		player:find_road_goto(17,131,160,1716);
	end
end
