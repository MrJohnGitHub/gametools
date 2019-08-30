function panel_boss(player)
    local id = 0;
    local can_num = 0;
    
    local obj = {};
    local arra = {};
    local target = {};
    obj.type = 1; 
    
    for k,boss_ in pairs(g_mboss) do
        id = k + 259;
        if k == 107 then
        	id = 229;
        end
        can_num = player:get_param(id);
        target = {};
        target.id = k;
        target.can_num = can_num;
        table.insert(arra,target);   
    end
    obj.arra = arra;
    player:SendPacketToSelf(3605,0,encode(obj));
end


