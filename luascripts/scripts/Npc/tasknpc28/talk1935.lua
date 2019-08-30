function ontalk1935(npc,event,player)
	if player:get_task_state(3) == 35 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
我恐怕撑不了多久了，只可惜，此生不能亲眼
看到魔族被覆灭的那一天了！
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">1700000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10145#&<font color="#28FF28">盾牌精华(小) * 1</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
我答应过如玉，打完这场仗，就回去跟他成亲的。

  ]]);
  end
end

function CreatureNpcFun1935(npc,event,player,funid)
	if funid == 1 then
		ontalk1935_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1935(npc,event,player,npcid)
	if npcid == 2802 then
		if player:get_task_state(3) == 35 then
			player:show_npc_flags(npcid,1);
		elseif player:get_task_state(3) == 2 then
			player:show_npc_flags(npcid,2);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1935_1(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(3) == 35 then
		player:set_task_state(3,40);
		player:push_task_data(1,1);
		player:add_exp(1700000);

		player:add_item(10145,1,1,0,0);
		player:add_gamemoney_bind(0);
		player:autofightstart(28,35,103);
	end
end