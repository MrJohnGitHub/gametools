function ontalk1037(npc,event,player)
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
我选择相信你，是因为我同样相信命运。
#&talk_line#&

                   	     <u><a href='event:M2402,1'><font color="#f7ff26">开启赐福</font></a></u>

  ]]);
end

function CreatureNpcFun1037(npc,event,player,funid)
if funid == 2 and player:get_task_state(45) == 2 then  
     player:set_task_state(46,1);  
     player:push_task_data(46,1);
     player:add_exp(1400000);
     player:add_gamemoney_bind(200000);
     return;
 end
end
	
function CreatureNpcSceneNpcStatus1037(npc,event,player,npcid)

end


