function ontalk1980(npc,event,player)
	if player:get_task_state(3) == 5 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
你表现的很不错，法师协会将全力支持你。传奇
土城是对抗魔族的前沿阵地，三圣之一的圣战阁
下也在哪里，你不妨去拜访一下。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">1700000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	elseif player:get_task_state(3) == 85 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
听说你要进无双城，哪里现在乱成一团，如果实
力不足进去恐怕会很危险，为了以防万一，先想
办法强化一下你身上的装备吧！
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">1900000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item19082#&<font color="#28FF28">豪华镖车令牌 * 1</font>

#&todoM2402,2#&talk_finish_bt#&]]);
	else
		local nitemid = 0;
		if player:get_param(301) == 1 then
			nitemid = 19016;
		elseif player:get_param(301) == 2 then
			nitemid = 19017;
		elseif player:get_param(301) == 3 then
			nitemid = 19018;
		elseif player:get_param(301) == 4 then
			nitemid = 19019;
		elseif player:get_param(301) == 5 then
			nitemid = 19020;
		end
		if player:package_item(nitemid) >= 5 then
			player:openpanel(29);
		else
			player:openpanel(33);
		end
	end
end

function CreatureNpcFun1980(npc,event,player,funid)
	if funid == 1 then
		ontalk1980_1(npc,player);
		return;
	end
	if funid == 2 then
		ontalk1980_2(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1980(npc,event,player,npcid)
end


function ontalk1980_1(npc,player)
	if player:get_task_state(3) == 5 then
		player:set_task_state(3,10);
		player:push_task_data(1,1);
		player:add_exp(1700000);

		player:add_gamemoney_bind(0);
		player:find_road_goto(17,131,160,1716);
		player:gui_high_focus(1,3,30,35,"点击npc寻路");
		-- player:gui_high_focus(107,0,48,445,"点击按钮领取奖励");
	end
end

function ontalk1980_2(npc,player)
	if player:get_task_state(3) == 85 then
		player:set_task_state(3,86);
		player:push_task_data(1,1);
		player:add_exp(1900000);

		player:add_gamemoney_bind(0);
		if player:num_bag_black() >= 1 then
			player:add_item(19082,1,1,0,0);
		else
			player:alert(10,0,0,"您的背包格子数不足1格,奖励通过邮件发送");
			player:SendSystemMail("豪华镖车令牌","您的奖励","[19082,1]","[0,0,0,0]",1);
		end
		local level = player:get_level();
		if level >= 62 then
			player:set_task_state(3,87);
			player:push_task_data(1,1);
			if player:get_task_state(10) == 0 then
				player:set_task_state(10,1);
				player:push_task_data(10,1);
				player:set_param(467,1);
			end
			player:find_road_goto(12,95,82,1214);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		else
			player:find_road_goto(17,106,142,1714);
			player:gui_high_focus(1,3,30,35,"点击npc寻路");
		end
	end
end
