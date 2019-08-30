function ontalk1982(npc,event,player)
	if player:get_task_state(3) == 200 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
自古以来，毒物栖身之地必有解毒之物，找对了
可得一线生机。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">14000000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
道具奖励:
#&item10192#&<font color="#28FF28">1</font>

#&todoM2402,2#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
自古以来，毒物栖身之地必有解毒之物，找对了
可得一线生机。
#&task_content#&

           我现在提供一项新的业务，只要你给我50礼金

           我就可以让你瞬间满血，不需要在慢慢等待回血


#&talk_line#&

                         <u><a href='event:M2402,1'>恢复血量</a></u>  (50礼金)

#&talk_line#&
  ]]);
	end
end

function CreatureNpcFun1982(npc,event,player,funid)
	if funid == 1 then
		ontalk1982_1(npc,player);
		return;
	end
	if funid == 2 then
		ontalk1982_2(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1982(npc,event,player,npcid)

end


function ontalk1982_1(npc,player)
	if player:get_gamemoney() >= 50 then
		player:sub_gamemoney(50);
		player:SetHealth(player:GetMaxHealth());
	else
		player:alert(21,0,0,"对不起，您的礼金不足50");
	end
end

function ontalk1982_2(npc,player)
	if player:get_task_state(3) == 200 then
		if player:Equipment_Num(0,60) >= 3 then
			player:set_task_state(3,210);
			if player:get_level() >= 75 then
				player:set_task_state(3,215);
				player:set_task_state(4,1);
			end
		else
			player:set_task_state(3,205);
			player:find_road_goto(17,119,158,1719);
		end
		player:push_task_data(1,1);
		player:add_exp(14000000);

		player:add_gamemoney_bind(0);
		player:add_gamemoney(500);
	end
end