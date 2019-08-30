function ontalk1921(npc,event,player)
	if player:get_task_state(2) == 70 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
感谢你为我们送来了至关重要的消息，原来通
天塔的设计图就被刻在了机关巨兽的身上，请
帮助我们一起消灭洞穴深处的机关巨兽。
#&task_target#&
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">32000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
赤月皇城，必须靠我们的力量来守护。

  ]]);
  end
end

function CreatureNpcFun1020(npc,event,player,funid)


end
	
function CreatureNpcSceneNpcStatus1921(npc,event,player,npcid)
	if npcid == 104 then
		if player:get_task_state(2) == 70 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1921_1(npc,player)
	if player:get_task_state(2) == 70 then
		player:set_task_state(2,75);
		player:push_task_data(1,1);
		player:add_exp(32000);

		player:add_gamemoney_bind(0);
		player:autofightstart(1,115,74);
	end
end
