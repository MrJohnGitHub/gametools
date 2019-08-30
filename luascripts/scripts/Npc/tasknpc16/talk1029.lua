function ontalk1029(npc,event,player)
	if player:get_task_state(1) == 65 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
怪物正在袭击村庄，我家熊儿却不见了，我该
怎么办才好呀，求求你一定要帮我找到他。
#&task_target#&
#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">800</font>
#&item19004#&<font color="#28FF28">0</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
云想衣裳花想容，春风拂槛露华浓。你觉
得这首诗跟奴家配吗？

  ]]);
  end
end

function CreatureNpcFun1029(npc,event,player,funid)
 	if funid == 2 then if player:get_task_state(29) == 2 then	
			  player:set_task_state(30,1);  
			  player:push_task_data(30,1);
			  player:add_exp(100000);
			  player:add_gamemoney_bind(80000);  		
			return;
		end  
	  end
end
	
function CreatureNpcSceneNpcStatus1029(npc,event,player,npcid)
	if npcid == 1008 then
		if player:get_task_state(1) == 65 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end
