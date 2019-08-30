function ontalk1004(npc,event,player)
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
老夫在此一直等待你的带来
#&task_content#&
#&talk_line#&

                   	     <u><a href='event:M2402,2'><font color="#f7ff26">离开副本</font></a></u>

#&talk_line#&
  ]]);
end

	
function CreatureNpcSceneNpcStatus1004(npc,event,player,npcid)

end

function ontalk1950_2(npc,player)
	player:go_home();
end