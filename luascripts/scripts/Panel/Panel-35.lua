function panel_35_0(player)
	local mapid = player:GetMapId();
	if mapid < 34 or mapid > 201 then
		return;
	end
    if player:get_gamemoney_total() < 500000 then
        player:alert(2,0,0,"金币不足, 无法鼓舞");
        local obj = {};
        obj.type = 0;
        obj.ret = 1;
        player:SendPacketToSelf(3533,0,encode(obj));        
        return;
    end

    if player:is_status(2302) then
--        player:alert(2,0,0,"鼓舞已达最高级!");
        local obj = {};
        obj.type = 0;
        obj.ret = 3;
        player:SendPacketToSelf(3533,0,encode(obj));
        return;
    end
    
    local before_money = player:get_gamemoney();
    local before_bind_money = player:get_gamemoney_bind();
    player:sub_gamemoney_total(500000);
    player:set_status(2301,180,100,0);
  --  player:alert(2,0,0,"普通鼓舞成功!");
  
    local obj = {};
    obj.type = 0;
    obj.ret = 0;
    player:SendPacketToSelf(3533,0,encode(obj));
      
    player:WriteScriptByLog(2,0, 500000, before_money, before_bind_money);
end

function panel_35_1(player)
	local mapid = player:GetMapId();
	if mapid < 34 or mapid > 201 then
		return;
	end
    if player:get_vcoin() < 100 then
        player:alert(2,0,0,"元宝不足, 无法鼓舞");
        local obj = {};
        obj.type = 1;
        obj.ret = 2;
        player:SendPacketToSelf(3533,0,encode(obj));        
        return;
    end
    
    local before_vcoin = player:get_vcoin();
    player:sub_vcoin(100);
    player:set_status(2302,180,100,0);
   -- player:alert(2,0,0,"高级鼓舞成功!");
   
    local obj = {};
    obj.type = 1;
    obj.ret = 0;
    player:SendPacketToSelf(3533,0,encode(obj)); 
    
    player:WriteScriptByLog(2,1, 100, before_vcoin);
end
