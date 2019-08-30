function ontalk1919(npc,event,player)
	if player:get_task_state(2) == 50 then
		local job = player:get_job();
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
感谢你的帮助，但是我们现在还不能离开，只
要还没找到修复通天之塔的方法，我们就一定
要继续寻找下去，我需要你帮我们寻找线索。
#&task_target#&
#&talk_line#&
#&task_award#&
#&item19005#&<font color="#28FF28">24000</font>
#&item19004#&<font color="#28FF28">0</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
只要我还活着，就不会停止战斗。

  ]]);
  end
end

function CreatureNpcFun1024(npc,event,player,funid)

  if funid == 2 and player:get_task_state(36) == 1 then
      player:set_task_state(36,2);     
      player:set_task_state(37,1);  
      player:push_task_data(37,1);
      player:add_exp(1000000);
      player:add_gamemoney_bind(100000);
      return;
  end

  if funid == 2 and player:get_task_state(49) == 1 then
      player:set_task_state(49,2);
      player:set_task_state(50,1);  
      player:push_task_data(50,1);
      player:add_exp(1000000);
      player:add_gamemoney_bind(200000);
      return;
  end

  
  if funid == 2 and player:get_task_state(65) == 2 then	
	  player:add_gamemoney_bind(400000);
	  player:add_exp(100000);

  	  local sum = player:get_task_param(66,1);
  	  if sum >= 1 then 
      	player:set_task_state(66,2);  
      else
      	player:set_task_state(66,1);
      end  
      player:push_task_data(66,1);        
      return;
  end  

 if funid == 2 and player:get_task_state(107) == 1 then
      player:set_task_state(107,2);
      player:set_task_state(108,1);  
      player:push_task_data(108,1); 
      player:add_exp(100000);
      player:add_gamemoney_bind(100000);      
      return;
  end

end
	
function CreatureNpcSceneNpcStatus1919(npc,event,player,npcid)
	if npcid == 102 then
		if player:get_task_state(2) == 50 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1919_1(npc,player)
	if player:get_task_state(2) == 50 then
		player:set_task_state(2,55);
		player:push_task_data(1,1);
		player:add_exp(24000);

		player:add_gamemoney_bind(0);
		player:autofightstart(1,94,144);
	end
end