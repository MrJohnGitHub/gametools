function ontalk1958(npc,event,player)
	if player:get_task_state(2) == 15 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		local Item = 30004;
		if player:get_gender() == 1 then
			Item = 30003;
		end
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
听说你是个很不错的年轻人，希望你的修炼之
路可以长久一些。
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">5000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item]]..Item..[[#&<font color="#28FF28">白银衣服</font>

#&todoM2402,2#&talk_finish_bt#&]]);
	else
		if player:get_task_state(3) == 106 or player:get_task_state(3) == 76 then
			player:gui_high_focus(0,2,265,355,"请点击链接");
		end
		player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
想进去瞧瞧吗？搞不好会弄到一件好装备哦。
#&task_content#&




#&talk_line#&
		说明:
		1:进入条件:<font color="#21d119">200礼金</font>.
		2:BOSS数量:10个.
		3:进入时长:60分钟.
		4:掉落装备:<font color="#21d119">60~80级</font>以下装备.
		5:特殊:中午12点10分后可通过特殊NPC进入生死道

#&talk_line#&

                   	     <u><a href='event:M2402,1'><font color="#f7ff26">进入风云谷</font></a></u>

                        进入消耗:<font color="#21d119">200礼金</font>

#&talk_line#&
  ]]);
	end
end

function CreatureNpcFun1958(npc,event,player,funid)
	if funid == 1 then
		ontalk1958_1(npc,player);
		return;
	end
	if funid == 2 then
		ontalk1958_2(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1958(npc,event,player,npcid)
	if npcid == 1219 then
		if player:get_task_state(2) == 15 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1958_1(npc,player)
	if player:get_gamemoney() >= 200 then
		player:sub_gamemoney(200);
		local level = player:get_level();
		if level >= 80 then
			player:randomthismap(84);
		elseif level >= 76 then
			player:randomthismap(115);
		elseif level >= 66 then
			player:randomthismap(116);
		else
			player:randomthismap(117);
		end
		player:autofightstart(player:GetMapId(),player:GetX(),player:GetY());
		if player:get_task_state(3) == 205 then
			player:set_task_state(3,206);
			player:push_task_data(1,1);
		end
		if player:get_task_state(3) == 106 then
			player:push_task_data(1,1);
		end	
	else
		player:alert(21,0,0,"对不起，您的礼金不足200!")
	end
end


function ontalk1958_2(npc,player)
	if player:get_task_state(2) == 15 then
		player:set_task_state(2,20);
		player:push_task_data(1,1);
		player:add_exp(5000);

		player:add_gamemoney_bind(0);
		player:find_road_goto(12,135,120,1205);
		if player:get_gender() == 1 then
			player:add_item(30003,1,1,0,0);
			player:use_item(30003);
		else
			player:add_item(30004,1,1,0,0);
			player:use_item(30004);
		end
	end
end
