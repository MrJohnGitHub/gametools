function ontalk1108(npc,event,player)
player:echo(0,npc:GetLowGUID(),
[[#&task_describe#&这里是挖矿场景,点击进入挖矿<u><a href='event:M2411,4,32,28,0'>进入挖矿</a></u> 
]]);
end

function CreatureNpcFun1108(npc,event,player,funid)
	if funid == 1 then
		ontalk1108(npc,player);
		return;
	end

  if funid == 2 and player:get_task_state(64) == 1 then
      player:set_task_state(64,2);  	
      player:set_task_state(65,1);  
      player:push_task_data(65,1);
	  player:add_gamemoney_bind(400000);
	  player:add_exp(100000);
	  local sum = player:Equipment_Num(0,0,2);
      if sum >= 1 then
      player:set_task_state(65,2);  
      else
      player:set_task_param(65,1,sum);
      end  
      player:push_task_data(65,1); 
      return;
  end

end	
		
function CreatureNpcSceneNpcStatus1108(npc,event,player,npcid)
	if npcid == 101 then
		if player:get_task_state(2) == 40 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end


