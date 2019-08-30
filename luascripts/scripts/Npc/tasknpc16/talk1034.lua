function ontalk1034(npc,event,player)
	if player:get_task_state(1) == 1 then
		player:openpanel(1);
	else
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
魔族妖怪接踵而至，恐怕海角村将不得安
宁。
  ]]);
  end
end

function CreatureNpcFun1034(npc,event,player,funid)
 if funid == 2 and player:get_task_state(40) == 1 then
     player:set_task_state(40,2);    
     player:set_task_state(41,1);  
     player:push_task_data(41,1);
     player:add_exp(750000);
     player:add_gamemoney_bind(150000);
     player:add_item(12002,3,1,0,0);
	  local job = player:get_job();
	      local sex = player:GetGender();	
		  if job == 1 and sex ==1 then
			player:add_item(20305,1,1,0,0);
		  elseif job ==1 and sex ==2 then
			player:add_item(20368,1,1,0,0);
		  elseif job ==2 and sex ==1 then 
			player:add_item(20326,1,1,0,0);
		  elseif job ==2 and sex ==2 then
			player:add_item(20389,1,1,0,0);
		  elseif job == 3 and sex == 1 then 
			player:add_item(20347,1,1,0,0);
	  	  else
			player:add_item(22211,1,1,0,0);
		  end		  
     return;
 end
end

function CreatureNpcSceneNpcStatus1034(npc,event,player,npcid)
	if npcid == 1001 then
		if player:get_task_state(1) == 1 then
			player:show_npc_flags(npcid,1);
		elseif player:get_task_state(1) == 80 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end
