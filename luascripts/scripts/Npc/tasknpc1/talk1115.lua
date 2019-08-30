--转生秘境
function ontalk1115(npc,event,player)
    local level = player:GetLevel()
    local zhuansheng = player:get_param(258)
    local event1 = ""
    local event2 = ""
    local event3 = ""
    local event4 = ""
    local event5 = ""
    local event6 = ""
    local event7 = ""
    local event8 = ""    
    local color1 = "8c857c"
    local color2 = "8c857c"
    local color3 = "8c857c"
    local color4 = "8c857c"
    local color5 = "8c857c"
    local color6 = "8c857c"
    local color7 = "8c857c"
    local color8 = "8c857c"
    
    if zhuansheng == 0 and level >=60 and level < 70 then
        event1 = " href='event:M2411,212,0,0'"
        color1 = "32ea00"
    elseif zhuansheng == 0 and level >= 70 then
        event2 = " href='event:M2411,213,0,0'"
        color2 = "32ea00"
    elseif zhuansheng == 1 or zhuansheng == 2 then
        event3 = " href='event:M2411,214,0,0'"
        color3 = "32ea00"
    elseif zhuansheng == 3 or zhuansheng == 4 then
        event4 = " href='event:M2411,215,0,0'"
        color4 = "32ea00"
    elseif zhuansheng == 5 or zhuansheng == 6 then
        event5 = " href='event:M2411,216,0,0'"
        color5 = "32ea00"
    elseif zhuansheng == 7 or zhuansheng == 8 then
        event6 = " href='event:M2411,217,0,0'"
        color6 = "32ea00"
    elseif zhuansheng == 9 or zhuansheng == 10 then
        event7 = " href='event:M2411,218,0,0'"
        color7 = "32ea00"
    elseif zhuansheng == 11 or zhuansheng == 12 then
        event8 = " href='event:M2411,219,0,0'"
        color8 = "32ea00"
    end

    
    local str = 
    "#&task_zhuansheng_1#&<u><a"..event1.."><font color='#"..color1.."'>"..player:get_mapname(212).."(60级~69级)</font></a></u>\n"
    .."#&task_zhuansheng_2#&<u><a"..event2.."><font color='#"..color2.."'>"..player:get_mapname(213).."(70级以上)</font></a></u>\n"
    .."#&task_zhuansheng_3#&<u><a"..event3.."><font color='#"..color3.."'>"..player:get_mapname(214).."(1转-2转)</font></a></u>\n"
    .."#&task_zhuansheng_4#&<u><a"..event4.."><font color='#"..color4.."'>"..player:get_mapname(215).."(3转-4转)</font></a></u>\n"
    .."#&task_zhuansheng_5#&<u><a"..event5.."><font color='#"..color5.."'>"..player:get_mapname(216).."(5转-6转)</font></a></u>\n"
    .."#&task_zhuansheng_6#&<u><a"..event6.."><font color='#"..color6.."'>"..player:get_mapname(217).."(7转-8转)</font></a></u>\n"
    .."#&task_zhuansheng_7#&<u><a"..event7.."><font color='#"..color7.."'>"..player:get_mapname(218).."(9转-10转)</font></a></u>\n"
    .."#&task_zhuansheng_8#&<u><a"..event8.."><font color='#"..color8.."'>"..player:get_mapname(219).."(11转-12转)</font></a></u>"
    
    
    player:echo(0,npc:GetLowGUID(),str);
end

--#&task_describe#&这里是末日168场景,点击进入<u><a href='event:M2411,34,30,50,0'>进入场景</a></u> 

function CreatureNpcFun1115(npc,event,player,funid)
    if funid == 1 then
        ontalk1115(npc,player);
        return;
    end
end
    
function CreatureNpcSceneNpcStatus1115(npc,event,player,npcid)
    if npcid == 1101 then
        if player:get_task_state(2) == 40 then
            player:show_npc_flags(npcid,1);
        else
            player:show_npc_flags(npcid,0);
        end
    end
end






