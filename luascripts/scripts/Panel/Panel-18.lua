function panel_18_1(player)
    local mapid = player:GetMapId();
    local item_n = 0;
    if mapid ~= player:get_param(799) then
    	 player:alert(10,0,0,"请先击杀所有怪物!");
    	 return 0;
    end
    if g_mapaward[mapid] ~= nil then
        local nAward = #g_mapaward[mapid];
        for i=1,nAward do
            if g_mapaward[mapid][i][1] > 10000 then
                item_n = item_n + 1;
            end       
        end     

         if item_n > player:num_bag_black() then 
             player:alert(10,0,0,"背包不足，无法领取!");
             return 0; 
         end    
    end

    if g_mapaward[mapid] ~= nil then 
        local nAward = #g_mapaward[mapid];
        for i=1,nAward do
           if g_mapaward[mapid][i][1] < 10000 then
               new_add_item(player,g_mapaward[mapid][i][1],0,g_mapaward[mapid][i][2],0);
           else
               player:add_item(g_mapaward[mapid][i][1],g_mapaward[mapid][i][2],1,0,0);
           end 
        end
        player:set_param(799,0);
        player:lua_enter_map();
    end
    
    if g_mapaward_notice1[mapid] ~= nil then 
        local nNotice = #g_mapaward_notice1[mapid];
        for i=1,nNotice do
            player:alert(10,0,0,g_mapaward_notice1[mapid][i][1]);
        end   
    end
    return 1;
end

function panel_18_2(player)
    local mapid = player:GetMapId();
    local need_gold = 0;
    local item_n = 0;
    if mapid ~= player:get_param(799) then
    	player:alert(10,0,0,"请先击杀所有怪物!");
    	 return 0;
    end
    if g_mapneedgold[mapid] ~= nil then
        need_gold = g_mapneedgold[mapid][1][2];
    end
    
    if g_mapaward[mapid] ~= nil then
        local nAward = #g_mapaward[mapid];
        for i=1,nAward do
            if g_mapaward[mapid][i][1] > 10000 then
                item_n = item_n + 1;
            end       
        end     
                    
         if player:get_vcoin() < need_gold then
             player:alert(10,0,0,"元宝不足，无法领取!");
             return 0; 
         elseif item_n > player:num_bag_black() then 
             player:alert(10,0,0,"背包不足，无法领取!");
             return 0; 
         end    
         
         player:sub_vcoin(need_gold);
    end
                                           
    if g_mapaward[mapid] ~= nil then 
        local nAward = #g_mapaward[mapid];
        for i=1,nAward do
           if g_mapaward[mapid][i][1] < 10000 then
               local now_num = g_mapaward[mapid][i][2] * 2;
               new_add_item(player,g_mapaward[mapid][i][1],0,now_num,0);
           else
               player:add_item(g_mapaward[mapid][i][1],g_mapaward[mapid][i][2]*2,1,0,0);   
            end       
        end
        player:set_param(799,0);
        player:lua_enter_map();
    end
    
    if g_mapaward_notice2[mapid] ~= nil then 
        local nNotice = #g_mapaward_notice2[mapid];
        for i=1,nNotice do
            player:alert(10,0,0,g_mapaward_notice2[mapid][i][1]);
        end   
    end  
    return 1;
end
