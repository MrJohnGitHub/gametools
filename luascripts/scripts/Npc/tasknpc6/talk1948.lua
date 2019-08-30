function ontalk1948(npc,event,player)
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
我选择相信你，是因为我同样相信命运。

  ]]);
end

function CreatureNpcFun1948(npc,event,player,funid)
	if funid == 1 then
		ontalk1948_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1948(npc,event,player,npcid)

end


function ontalk1948_1(npc,player)

end
