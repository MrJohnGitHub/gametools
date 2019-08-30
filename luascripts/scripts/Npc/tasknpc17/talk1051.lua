function ontalk1051(npc,event,player)
player:echo(0,npc:GetLowGUID(),
[[#&task_describe#&这里是挖矿场景,点击退出挖矿<u><a href='event:M2411,1,93,193,0'>退出挖矿</a></u> 
]]);
end

function CreatureNpcFun1051(npc,event,player,funid)

end

function CreatureNpcSceneNpcStatus1051(npc,event,player,npcid)
    if npcid == 201 then
        if player:get_task_state(2) == 115 then
            player:show_npc_flags(npcid,1);
        else
            player:show_npc_flags(npcid,0);
        end
    end
end