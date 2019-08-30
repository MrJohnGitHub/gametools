function ontalk1956(npc,event,player)
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
有些人总喜欢把一些奇怪的东西存放在这里。
#&task_content#&
  <u><a href='event:LINK_NPC_STORE'>仓库服务</a></u>
  ]]);
end

function CreatureNpcFun1956(npc,event,player,funid)
	if funid == 1 then
		ontalk1956_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1956(npc,event,player,npcid)

end