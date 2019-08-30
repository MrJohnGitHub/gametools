function mon8011(mon,event,player,type)
	mon7035(mon,event,player,type)
    local nmapid = mon:GetMapId(); 
    for k,boss_ in pairs(g_nboss) do
        if boss_[1] == mon:GetEntry() and boss_[3] == nmapid then
            --local relivetInterval = mon:GetReliveInterval() 
            --relivetInterval = math.floor(relivetInterval / 1000)
            --g_boss_oper(k, 1, boss_[1], relivetInterval);
            --return;
        end
    end
    
    for k,boss_ in pairs(g_mboss) do
        if boss_[1] == mon:GetEntry() and boss_[5] == nmapid then
            local id = k + 259; 
            if k == 107 then
            	id = 229;
            end
            local can_num = player:get_task_state(id) + 1;
            player:set_task_state(id,can_num);
            
            local obj = {};
            obj.isfinish = 0;
            if can_num == boss_[4] then 
                obj.isfinish = 1;
                player:set_param(799,nmapid);
            end
            local arra = {};
            local target = {};
            target.entry = boss_[1];
            target.isboss = 1;
            target.total_num = can_num;
            target.can_num = can_num;
            table.insert(arra,target);   

            obj.arra = arra;
            player:SendPacketToSelf(3606,0,encode(obj));
            player:set_param(id,player:get_param(id)+1);     
            player:updateDailyTask(6);
            return;
        end
    end
end

function mon8012(mon,event,player)
    local nmapid = mon:GetMapId();   
    local initTime = g_get_init_time()
    local passDay = GetTodayIsWhichDay(initTime)
    if passDay >= #g_mxiaoguai then
        passDay = #g_mxiaoguai
    end
    local conf = g_mxiaoguai[passDay]
    for k,boss_ in pairs(conf) do
        if boss_[1] == mon:GetEntry() and boss_[5] == nmapid then
            local id = k + 179; 
            local can_num = player:get_task_state(id) + 1;
            player:set_task_state(id,can_num);
            
            local t_num = 0;
            local finish_state = 0;
            local obj = {};
            if can_num >= boss_[4] or boss_[10] > 0 then 
                finish_state = 1;
                for t,xiaoguai_ in pairs(conf) do
                    local tid = t + 179; 
                    if xiaoguai_[5] == nmapid then                            
                        if player:get_task_state(tid) < xiaoguai_[4] then
                            finish_state = 0;
                            if can_num == boss_[4] and boss_[10] == 0 then
                                t_num = can_num;
                                break;
                            end
                        end
                        if boss_[10] > 0 and xiaoguai_[10] == boss_[10] then
                            t_num = t_num + player:get_task_state(tid);
                        end
                    end                                    
                end                                               
            end
            
            obj.isfinish = finish_state;
            if obj.isfinish == 1 then 
            	player:set_param(799,nmapid);
            end
            local arra = {};
            local target = {};
            target.entry = boss_[1];
            if boss_[1] >= 2510 and boss_[1] <= 2513 then
                target.entry = 2510;
            end
            
            target.isboss = 0;
            target.total_num = t_num;
            target.can_num = can_num;
            table.insert(arra,target);   

            obj.arra = arra;
            player:SendPacketToSelf(3606,0,encode(obj)); 
            if  finish_state == 1 then  
            	AddInstanceGiftActivityParamCount(player,nmapid)   
            end
            return;
        end
    end
end

function mon2294(mon,event,player)			 
    local id = 101 + 259; 			--g_mboss[101]
    local can_num = player:get_task_state(id) + 1;
    player:set_task_state(id,can_num);
    
    local obj = {};                                                   
    obj.isfinish = 1;
    local arra = {};
    local target = {};
    target.entry = 2140;
    target.isboss = 1;
    target.total_num = 1;
    target.can_num = can_num;
    table.insert(arra,target);   
    obj.arra = arra;
    player:SendPacketToSelf(3606,0,encode(obj)); 
    player:set_param(799,mon:GetMapId()); 
    player:set_param(id,player:get_param(id)+1);      
    return;
end

function mon2315(mon,event,player)			 
    local id = 102 + 259; 			--g_mboss[102]
    local can_num = player:get_task_state(id) + 1;
    player:set_task_state(id,can_num);
    
    local obj = {};                                                   
    obj.isfinish = 1;
    local arra = {};
    local target = {};
    target.entry = 2140;
    target.isboss = 1;
    target.total_num = 1;
    target.can_num = can_num;
    table.insert(arra,target);   
    obj.arra = arra;
    player:set_param(799,mon:GetMapId()); 
    player:SendPacketToSelf(3606,0,encode(obj));   
    player:set_param(id,player:get_param(id)+1);
    return;
end

function mon2520(mon,event,player)			  
    local id = 211 + 179; 			--g_mxiaoguai[211]
    local can_num = player:get_task_state(id) + 1;
    player:set_task_state(id,can_num);
    
    local obj = {};                                                   
    obj.isfinish = 1;
    player:set_param(799,mon:GetMapId()); 
    local arra = {};
    local target = {};
    target.entry = 2520;
    target.isboss = 1;
    target.total_num = 1;
    target.can_num = can_num;
    table.insert(arra,target);   
    obj.arra = arra;
    player:SendPacketToSelf(3606,0,encode(obj));     
	local mapid = player:GetMapId()
	AddInstanceGiftActivityParamCount(player,mapid)  
    return;
end

function mon8724(mon,event,player)

end

function mon8740(mon,event,player)

end

function mon4066(mon,event,player)

end

function mon4067(mon,event,player)

end

function mon4076(mon,event,player)

end

function mon4077(mon,event,player)

end

function mon4096(mon,event,player)

end

function mon4097(mon,event,player)

end

function mon4106(mon,event,player)

end

function mon4107(mon,event,player)

end

function mon4116(mon,event,player)

end

function mon4117(mon,event,player)

end

function mon4126(mon,event,player)

end

function mon4127(mon,event,player)

end

function mon2287(mon,event,player)
--[[
    player:alert(23,0,0,"持有BOSS掉落的PK宝箱可令经验增速翻三倍！抢夺宝箱，捍卫荣耀！");
    player:alert(23,0,8000,"来人了，快杀人！小心别死，死了宝箱会掉地上！");
    local imagetab = {
            {7001,19,28,41105,"<font color='#ff0000'>点击查看大图</font>",1,4000,900000,51007},
            {7002,19,29,42204,"<font color='#ff0000'>貂禅是我开的</font>",1,5000,900000,52111},
            {7003,25,35,43204,"<font color='#ff0000'>吊曲世姑大姐</font>",1,6000,900000,53007},
            {7004,25,34,41204,"<font color='#ff0000'>逗比最NB</font>",1,7000,900000,51007},
            {7005,27,42,41205,"<font color='#ff0000'>睾处不胜含</font>",1,8000,900000,51006},
            {7006,34,32,41106,"<font color='#ff0000'>孤枕思君来</font>",1,9000,900000,51005},
            {7007,15,32,41107,"<font color='#ff0000'>哈利波特别大</font>",1,10000,900000,51004}
    };
    
    local mapid = player:GetMapId(); 
    for i=1,#imagetab do
        local obj = {};
        obj[1] = mapid;
        obj[2] = imagetab[i][2];
        obj[3] = imagetab[i][3];
        obj[4] = imagetab[i][1];
        obj[5] = imagetab[i][4];
        obj[6] = imagetab[i][5];
        obj[7] = imagetab[i][6];
        obj[9] = 1; 
        obj[10] = imagetab[i][7];
        obj[11] = imagetab[i][8];  
        obj[21] = imagetab[i][9];  
        player:mon_gen(encode(obj));
    end
]]
end

function mon2017(mon,event,player)
	local notifyMsg = "【争分夺秒】真BOSS被击杀,快捡地上的精元!"
	g_broadcast(15,0,0,notifyMsg);
end


function mon2018(mon,event,player)
	local notifyMsg = "【争分夺秒】快去打另外一只,它才是真BOSS!"
	g_broadcast(15,0,0,notifyMsg);
end

function mon7097(mon,event,player)
	local num = player:get_param(213) + 1;
	player:set_param(213,num);
	OnTravelSnatch(player,0);
end