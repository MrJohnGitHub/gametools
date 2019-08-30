function ontalk1943(npc,event,player)
	if player:get_task_state(3) == 145 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
我现在还不能走，娘子与我那痴情的小舅子从小
相依为命，我若不能救他出来，恐怕她会后悔终
生，请你帮我找到他。
#&task_target#&
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">6000000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10181#&<font color="#28FF28">荣誉卷轴(小) * 1</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
小舅子也是个性情中人，倘若我娘子是妖
怪，我也……

  ]]);
  end
end

function CreatureNpcFun1016(npc,event,player,funid)

  if funid == 2 and player:get_task_state(20) == 2 then 
      player:set_task_state(21,1);  
      player:push_task_data(21,1);
      player:add_exp(160000);
      player:add_gamemoney_bind(40000);
	  player:AddExperienceMount(20003,1800);
      return;
  end

if funid == 2 and player:get_task_state(38) == 1 then
      player:set_task_state(38,2);     
      player:set_task_state(39,1);  
      player:push_task_data(39,1);
      player:add_exp(1000000);
      player:add_gamemoney_bind(100000);
      return;
  end
		
end
	
function CreatureNpcSceneNpcStatus1943(npc,event,player,npcid)
	if npcid == 503 then
		if player:get_task_state(3) == 145 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end


function ontalk1943_1(npc,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(3) == 145 then
		player:set_task_state(3,155);
		player:push_task_data(1,1);
		player:add_exp(6000000);

		player:add_item(10181,1,1,0,0);
		player:add_gamemoney_bind(0);
		player:openpanel(57);
	end
end
