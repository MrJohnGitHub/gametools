function ontalk1981(npc,event,player)
	if player:get_task_state(3) == 10 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
看来事情进行得非常顺利，你从魔族手里缴获的
装备有利于我们研究魔族的战术
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">1700000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10191#&<font color="#28FF28">200礼金 * 1</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	elseif player:get_task_state(3) == 15 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
皇城东边有一个山洞，曾经是链接风云皇城和通
天之塔的通道，最近却被蚁魔族占据了，魔族的
死亡蚁后就在里面，你去调查一下。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">1700000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10145#&<font color="#28FF28">盾牌精华(小) * 1</font>

#&todoM2402,3#&talk_finish_bt#&]]);
	elseif player:get_task_state(3) == 80 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
听闻有人闯入无双城滥杀无辜，你与无双公主相
识，公主殿下又曾协助过我们，我们理应相助。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">1900000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,4#&talk_finish_bt#&]]);
	elseif player:get_task_state(3) == 115 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
皇城东侧有一个山谷名为蛇魔谷，里面毒蛇密
布，却盛产解毒的草药，如今被蛇魔族占领了，
法神正在那里除魔，请你去协助他。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">5000000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10181#&<font color="#28FF28">荣誉卷轴(小) * 1</font>

#&todoM2402,2#&talk_finish_bt#&]]);
	else
		if player:get_param(442) >= 1 then
			player:openpanel(31);
		else
			player:openpanel(38);
			local task3 = player:get_task_state(3);
			if task3 == 191 then 
				player:gui_high_focus(9,3,200,590,"请点击进入");
			else
				player:gui_high_focus(109,3,200,590,"请点击进入");
			end
		end
	end
end

function CreatureNpcFun1981(npc,event,player,funid)
	if funid == 1 then
		ontalk1981_1(npc,player);
		return;
	end
	if funid == 2 then
		ontalk1981_2(npc,player);
		return;
	end
	if funid == 3 then
		ontalk1981_3(npc,player);
		return;
	end
	if funid == 4 then
		ontalk1981_4(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1981(npc,event,player,npcid)
end

function ontalk1981_1(npc,player)
	if player:get_task_state(3) == 10 then
		player:add_gamemoney(200);
		player:add_exp(1700000);

		player:add_gamemoney_bind(0);
		local level = player:get_level();
		if level >= 56 then
			player:set_task_state(3,15);
			player:push_task_data(1,1);
			player:openpanel(57);
		else
			player:set_task_state(3,11);
			player:push_task_data(1,1);
			player:find_road_goto(17,106,142,1714);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
end

function ontalk1981_2(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(3) == 115 then
		player:add_exp(5000000);

		player:add_gamemoney_bind(0);
		local level = player:get_level();
		if level >= 66 then
			player:set_task_state(3,118);
			player:push_task_data(1,1);
			player:openpanel(57);
		else
			player:set_task_state(3,116);
			player:push_task_data(1,1);
			player:gui_high_focus(1,3,30,35,"请提升级别!!!");
		end
		player:add_item(10181,1,1,0,0);
		-- player:find_road_goto(12,104,115,1207);
	end
end

function ontalk1981_3(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(3) == 15 then
		player:set_task_state(3,16);
		player:push_task_data(1,1);
		player:add_exp(1700000);

		player:add_item(10145,1,1,0,0);
		player:add_gamemoney_bind(0);
		player:openpanel(57);
	end
end

function ontalk1981_4(npc,player)
	if player:get_task_state(3) == 80 then
		player:set_task_state(3,85);
		player:push_task_data(1,1);
		player:add_exp(1900000);

		player:add_gamemoney_bind(0);
		player:find_road_goto(17,128,127,1713);
		player:gui_high_focus(1,3,30,35,"点击npc寻路");
		player:set_param(302,1);
		player:gui_high_focus(2,1,615,135,"点击'英雄'按钮");
	end
end
