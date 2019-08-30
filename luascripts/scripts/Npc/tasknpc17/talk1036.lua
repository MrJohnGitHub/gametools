function ontalk1036(npc,event,player)
	player:openpanel(61);
end

function CreatureNpcFun1036(npc,event,player,funid)
if funid == 2 and player:get_task_state(44) == 2 then
     player:set_task_state(45,1);  
     player:push_task_data(45,1);
     player:add_exp(1300000);
     player:add_gamemoney_bind(150000);
     return;
 end
end
	
function CreatureNpcSceneNpcStatus1036(npc,event,player,npcid)

end
