function ontalk1957(npc,event,player)
	if player:get_task_state(2) == 16 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
皇城的军队会不惜一切代价协助你们修复通天
之塔的。
#&task_target#&

#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">5000</font>
#&item19004#&<font color="#28FF28">0</font>

#&todoM2402,6#&talk_finish_bt#&]]);
	elseif player:get_task_state(2) == 170 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
将不要的装备回收给我会得到大量的经验，是提
升实力的捷径哦。
#&task_target#&

#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">1500000</font>
#&item19004#&<font color="#28FF28">0</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	elseif player:get_task_state(3) == 1 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
你使用过的装备有利于我们开发对抗魔族的战
术，将装备回收我们皇城军队会给你发放丰厚
的奖励。
#&task_target#&

#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">1700000</font>
#&item19004#&<font color="#28FF28">0</font>

#&todoM2402,5#&talk_finish_bt#&]]);
	elseif player:get_task_state(3) == 75 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
一群流浪武士闯入无双城杀死了城主大人，还把
无双公主囚禁了起来，公主殿下人那么好，请你
一定要把她救出来。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">1900000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10192#&<font color="#28FF28">500礼金 * 1</font>

#&todoM2402,7#&talk_finish_bt#&]]);
	elseif player:get_task_state(3) == 105 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
听说你在无双城大杀四方哦，有没有爆到装备
呢？将不要的装备回收给我会得到大量的经验，
是提升实力的捷径哦。
#&task_target#&

#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">4500000</font>
#&item19004#&<font color="#28FF28">0</font>
#&item10192#&<font color="#28FF28">500礼金 * 1</font>
#&todoM2402,3#&talk_finish_bt#&]]);
	else
	player:openpanel(60);
  end
end

function CreatureNpcFun1957(npc,event,player,funid)
	if funid == 1 then
		ontalk1957_1(npc,player);
		return;
	end
	if funid == 3 then
		ontalk1957_3(npc,player);
		return;
	end
	if funid == 4 then
		ontalk1957_4(npc,player);
		return;
	end
	if funid == 5 then
		ontalk1957_5(npc,player);
		return;
	end
	if funid == 6 then
		ontalk1957_6(npc,player);
		return;
	end
	if funid == 7 then
		ontalk1957_7(npc,player);
		return;
	end
end

function CreatureNpcSceneNpcStatus1957(npc,event,player,npcid)
	local task2 = player:get_task_state(2);
	local task3 = player:get_task_state(3);

	if npcid == 1218 or npcid == 1715 then
		if task2 == 16 or task2 == 170 or task3 == 1 or task3 == 75 or task3 == 105 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1957_1(npc,player)
	if player:get_task_state(2) == 170 then
		player:set_task_state(2,171);
		player:push_task_data(1,1);
		if player:get_task_state(8) == 0 then --推送日常任务
			player:set_task_state(8,1);
			player:push_task_data(8,1);
			local a = math.random(1,100);
			if a >= 1 and a <= 10 then
				player:set_param(201,1);
			elseif a >= 11 and a <= 30 then
				player:set_param(201,2);
			elseif a >= 31 and a <= 60 then
				player:set_param(201,3);
			elseif a >= 61 and a <= 85 then
				player:set_param(201,4);
			else
				player:set_param(201,5);
			end
			player:set_param(202,5); --默认5星
		end
		player:add_exp(1500000);

		player:add_gamemoney_bind(0);
	end
	ontalk1957(npc,event,player)
end

function ontalk1957_3(npc,player)
	if player:get_task_state(3) == 105 then
		if player:Equipment_Num(0,50) >= 3 then
			player:set_task_state(3,110);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		else
			player:set_task_state(3,106);
			player:gui_high_focus(1,3,30,35,"点击前往获得装备");
		end
		player:push_task_data(3,1);
		player:add_gamemoney(500);
		player:add_exp(4500000);

		player:add_gamemoney_bind(0);
	end
end

function ontalk1957_5(npc,player)
	if player:get_task_state(3) == 1 then
		player:set_task_state(3,5);
		player:push_task_data(1,1);
		player:add_exp(1700000);

		player:add_gamemoney_bind(0);
	end
	ontalk1957(npc,event,player)
end

function ontalk1957_6(npc,player)
	if player:get_task_state(2) == 16 then
		player:set_task_state(2,20);
		player:push_task_data(1,1);
		player:add_exp(5000);

		player:add_gamemoney_bind(0);
		player:find_road_goto(12,137,121,1205);
		player:gui_high_focus(1,3,30,35,"点击npc寻路");
	end
end

function ontalk1957_7(npc,player)
	if player:get_task_state(3) == 75 then
		if player:Equipment_Num(0,50) >= 2 then
			player:set_task_state(3,80);
			player:find_road_goto(17,131,160,1716);
		else
			player:set_task_state(3,76);
			player:find_road_goto(17,118,158,1719);
		end
		player:push_task_data(1,1);
		player:add_exp(1900000);

		player:add_gamemoney(500);
		player:add_gamemoney_bind(0);
		player:gui_high_focus(1,3,30,35,"点击npc寻路");
	end
end
