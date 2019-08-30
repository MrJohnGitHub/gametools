function ontalk1035(npc,event,player)
	if player:get_task_state(1) == 5 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
魔族的怪物正在村子内四处肆虐，卫队的士兵
们需要你的帮助，快去支援吧。
#&task_target#&
[已完成]
#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">70</font>
#&item19004#&<font color="#28FF28">0</font>
#&item20001#&<font color="#28FF28">青铜屠龙</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
听说过井中月吗？那可是我亲手打造的杀
猪刀。
  ]]);
  end
end

function CreatureNpcFun1035(npc,event,player,funid)
	if funid == 2  and player:get_task_state(43) == 2 then  
	  player:set_task_state(44,1);  
	  player:push_task_data(44,1);
	  player:add_exp(1200000);
	  player:add_gamemoney_bind(150000);   
	  return;
	end 
end
	
function CreatureNpcSceneNpcStatus1035(npc,event,player,npcid)
	if npcid == 1002 then
		if player:get_task_state(1) == 5 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end
