function ontalk1938(npc,event,player)
	if player:get_task_state(3) == 65 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
多谢阁下相助，可恨这里的蚁魔很快就会倾巢而
出，必须尽快杀死洞穴深处的死亡蚁后，你的实
力尚且不足，先返回传奇土城再议吧。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">2100000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10145#&<font color="#28FF28">盾牌精华(小) * 1</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
如果你能活下来，就来找我！

  ]]);
  end
end

function CreatureNpcFun1938(npc,event,player,funid)
	if funid == 1 then
		ontalk1938_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1938(npc,event,player,npcid)
	if npcid == 2805 then
		if player:get_task_state(3) == 65 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1938_1(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(3) == 65 then
		player:set_task_state(3,66);
		player:push_task_data(1,1);
		player:add_exp(2100000);

		player:add_item(10145,1,1,0,0);
		player:add_gamemoney_bind(120000);
		player:openpanel(57);
	end
end
