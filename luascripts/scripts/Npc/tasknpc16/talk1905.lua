function ontalk1905(npc,event,player)
	if player:get_task_state(1) == 35 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
咳咳，我不行了，别管我，去救其他人。等把
那些怪物赶出村子之后，再回来找我吧，假如
没能找到我……就帮我在村头立块墓碑！
#&task_target#&
#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">400</font>
#&item19004#&<font color="#28FF28">0</font>
#&item50001#&<font color="#28FF28">青铜戒指 * 1</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
我答应过如花，打完这场仗，我就回老家
和她结婚的。

  ]]);
  end
end

function CreatureNpcFun1905(npc,event,player,funid)
	if funid == 1 then
		ontalk1905_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1905(npc,event,player,npcid)
	if npcid == 1006 then
		if player:get_task_state(1) == 35 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1905_1(npc,player)
	if player:get_task_state(1) == 35 then
		player:set_task_state(1,40);
		player:push_task_data(1,1);
		player:add_exp(400);

		player:add_item(50001,1,1,0,0);
		player:add_gamemoney_bind(0);
		player:autofightstart(10,28,84);
	end
end