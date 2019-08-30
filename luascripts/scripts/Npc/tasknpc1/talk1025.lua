function ontalk1920(npc,event,player)
	if player:get_task_state(2) == 60 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
我从你收集到的机关怪物的残骸中发现了一种
奇怪的铭文，我怀疑里面记载着跟通天之塔有
关的文献，请帮我收集更多不同种类的铭文。
#&task_target#&
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">28000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
要知道，像我这样聪明的士兵可不多见。

  ]]);
  end
end

function CreatureNpcFun1025(npc,event,player,funid)


if funid == 2 and player:get_task_state(51) == 1 then
    player:set_task_state(51,2);
    player:set_task_state(52,1);  
    player:push_task_data(52,1);
    player:add_exp(600000);
	player:add_gamemoney_bind(250000);
    return;
  end

if funid == 2 and player:get_task_state(84) == 1 then
  player:set_task_state(84,2);
  player:set_task_state(85,1);  
  player:push_task_data(85,1);
  player:add_exp(100000);
  player:add_gamemoney_bind(700000);
  return;
 end
  
end
	
function CreatureNpcSceneNpcStatus1920(npc,event,player,npcid)
	if npcid == 103 then
		if player:get_task_state(2) == 60 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1920_1(npc,player)
	if player:get_task_state(2) == 60 then
		player:set_task_state(2,65);
		player:push_task_data(1,1);
		player:add_exp(28000);

		player:add_gamemoney_bind(0);
		player:autofightstart(1,114,123);
	end
end