function ontalk1966(npc,event,player)
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
在这里暗无天日好想早点回去
#&task_content#&


		<u><a href='event:M2402,1'>回到王城</a></u> 

  ]]);
end

function CreatureNpcFun1966(npc,event,player,funid)
	if funid == 1 then
		ontalk1966_1(npc,player);
		return;
	end
	if funid == 2 then
		ontalk1966_2(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1966(npc,event,player,npcid)

end

function ontalk1966_1(npc,player)
	player:enter_map(12,89,158,0);
end
