function UpdateSpecialItemTimes(player)
	local param438 = player:get_param(438);
	local itemtb = {10274,10275,10276,10277,10285,10286,10287,10288};
    local tar = {};
	for i=1,#itemtb do
		local item_obj= {};
	    item_obj.id = itemtb[i];
	    item_obj.times = param438;
	    table.insert(tar,item_obj);
    end
    player:SendPacketToSelf(1725,0,encode(tar));
end

function item_30606(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,10000);
        local bxtbl = {{10151,1,816,1,"魂珠碎片"},{10153,1,409,1,"宝石碎片"},{10142,1,2041,0,"碎片"},{10148,1,2449,0,"碎片"},{10186,1,3265,0,"碎片"},{31304,1,1020,0,"碎片"}};
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],1,0,0);
                if nowCfg[4] == 1 then
                    g_broadcast(15,0,0,"【疯狂挖矿】<font color='#00ccff'>"..player:GetName().."</font>运气不错，打开材料矿获得"..nowCfg[5]);
                end
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end


function item_30607(item,count,event,player)
    local n_rand = math.random(1,100);
    local bxtbl = {{19000,100000,19,0},{19000,200000,38,0},{19000,500000,38,0},{19000,1000000,5,1}};
    local nAllItemCount = #bxtbl;
    local now_gailv = 0;
    for j = 1, nAllItemCount do
        local nowCfg = bxtbl[j];
        now_gailv = now_gailv + nowCfg[3];
        if n_rand <= now_gailv then
            player:add_gamemoney_bind(nowCfg[2]);
            if nowCfg[4] == 1 then
                g_broadcast(15,0,0,"【疯狂挖矿】<font color='#00ccff'>"..player:GetName().."</font>状态正佳，打开金币矿获得"..nowCfg[2] .. "绑金");
            end
            break;
        end
    end
    return 1;
end

function item_30608(item,count,event,player)
    local n_rand = math.random(1,100);
    local bxtbl = {{19028,5,8,0},{19028,10,49,0},{19028,20,33,1},{19028,50,8,1},{19028,100,2,2}};
    local nAllItemCount = #bxtbl;
    local now_gailv = 0;
    for j = 1, nAllItemCount do
        local nowCfg = bxtbl[j];
        now_gailv = now_gailv + nowCfg[3];
        if n_rand <= now_gailv then
            player:add_vcoin_bind(nowCfg[2]);   
            if nowCfg[4] == 1 then
                g_broadcast(15,0,0,"【疯狂挖矿】<font color='#00ccff'>"..player:GetName().."</font>人品爆发，打开元宝矿获得"..nowCfg[2] .. "绑元");
            elseif nowCfg[4] == 2 then
                g_broadcast(15,0,0,"【疯狂挖矿】<font color='#00ccff'>"..player:GetName().."</font>受上天眷顾，打开元宝矿获得"..nowCfg[2] .. "绑元");
            end
            break;
        end
    end
    return 1;
end


function item_30609(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,10000);
        local bxtbl = {{20208,1,13,1,"70级装备"},{20229,1,13,1,"70级装备"},{20250,1,13,1,"70级装备"},{20408,1,13,1,"70级装备"},{20429,1,13,1,"70级装备"},{20450,1,13,1,"70级装备"},{20708,1,13,1,"70级装备"},{20729,1,13,1,"70级装备"},{20750,1,13,1,"70级装备"},{20808,1,13,1,"70级装备"},{20829,1,13,1,"70级装备"},{20850,1,13,1,"70级装备"},{21008,1,13,1,"70级装备"},{21029,1,13,1,"70级装备"},{21050,1,13,1,"70级装备"},{21108,1,13,1,"70级装备"},{21129,1,13,1,"70级装备"},{21150,1,12,1,"70级装备"},{20207,1,26,1,"60级装备"},{20228,1,26,1,"60级装备"},{20249,1,26,1,"60级装备"},{20407,1,26,1,"60级装备"},{20428,1,26,1,"60级装备"},{20449,1,26,1,"60级装备"},{20707,1,26,1,"60级装备"},{20728,1,26,1,"60级装备"},{20749,1,26,1,"60级装备"},{20807,1,26,1,"60级装备"},{20828,1,26,1,"60级装备"},{20849,1,26,1,"60级装备"},{21007,1,26,1,"60级装备"},{21028,1,26,1,"60级装备"},{21049,1,26,1,"60级装备"},{21107,1,25,1,"60级装备"},{21128,1,25,1,"60级装备"},{21149,1,25,1,"60级装备"},{20206,1,775,0,"装备"},{20406,1,775,0,"装备"},{20706,1,775,0,"装备"},{20806,1,775,0,"装备"},{21006,1,775,0,"装备"},{21106,1,776,0,"装备"},{20205,1,194,0,"装备"},{20226,1,194,0,"装备"},{20247,1,194,0,"装备"},{20405,1,194,0,"装备"},{20426,1,194,0,"装备"},{20447,1,194,0,"装备"},{20705,1,194,0,"装备"},{20726,1,194,0,"装备"},{20747,1,194,0,"装备"},{20805,1,194,0,"装备"},{20826,1,194,0,"装备"},{20847,1,194,0,"装备"},{21005,1,194,0,"装备"},{21026,1,194,0,"装备"},{21047,1,193,0,"装备"},{21105,1,193,0,"装备"},{21126,1,193,0,"装备"},{21147,1,193,0,"装备"},{20204,1,65,0,"装备"},{20225,1,65,0,"装备"},{20246,1,65,0,"装备"},{20404,1,65,0,"装备"},{20425,1,65,0,"装备"},{20446,1,65,0,"装备"},{20704,1,65,0,"装备"},{20725,1,65,0,"装备"},{20746,1,65,0,"装备"},{20804,1,65,0,"装备"},{20825,1,65,0,"装备"},{20846,1,64,0,"装备"},{21004,1,64,0,"装备"},{21025,1,64,0,"装备"},{21046,1,64,0,"装备"},{21104,1,64,0,"装备"},{21125,1,64,0,"装备"},{21146,1,64,0,"装备"}};
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                if nowCfg[4] == 1 then
                    g_broadcast(15,0,0,"【疯狂挖矿】<font color='#00ccff'>"..player:GetName().."</font>运气不错，打开装备矿获得"..nowCfg[5]);
                end
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

function item_30610(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,100);
        local bxtbl = {{20205,1,5},{20226,1,6},{20247,1,6},{20405,1,5},{20426,1,6},{20447,1,6},{20705,1,5},{20726,1,6},{20747,1,6},{20805,1,5},{20826,1,5},{20847,1,6},{21005,1,5},{21026,1,6},{21047,1,6},{21105,1,5},{21126,1,6},{21147,1,5}};
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

function item_30611(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,100);
        local bxtbl = {{20105,1,33},{20126,1,33},{20147,1,34}};
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

function item_30612(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,100);
        local bxtbl = {{20305,1,17},{20326,1,17},{20347,1,17},{20368,1,16},{20389,1,16},{22211,1,17}};
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

function item_30613(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,100);
        local bxtbl = {{20206,1,5},{20227,1,6},{20248,1,6},{20406,1,5},{20427,1,6},{20448,1,6},{20706,1,5},{20727,1,6},{20748,1,6},{20806,1,5},{20827,1,5},{20848,1,6},{21006,1,5},{21027,1,6},{21048,1,6},{21106,1,5},{21127,1,6},{21148,1,5}};
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

function item_30614(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,100);
        local bxtbl = {{20106,1,33},{20127,1,33},{20148,1,34}};
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

function item_30615(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,100);
        local bxtbl = {{20306,1,17},{20327,1,17},{20348,1,17},{20369,1,16},{20390,1,16},{22212,1,17}};
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

function item_30616(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,100);
        local bxtbl = {{20207,1,5},{20228,1,6},{20249,1,6},{20407,1,5},{20428,1,6},{20449,1,6},{20707,1,5},{20728,1,6},{20749,1,6},{20807,1,5},{20828,1,5},{20849,1,6},{21007,1,5},{21028,1,6},{21049,1,6},{21107,1,5},{21128,1,6},{21149,1,5}};
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

function item_30617(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,100);
        local bxtbl = {{20307,1,17},{20328,1,17},{20349,1,17},{20370,1,16},{20391,1,16},{22213,1,17}};
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end


function item_10004(item,count,event,player)
	player:openpanel(62);
	return 0;
end

function item_12007(item,count,event,player)
	player:set_status(113,300,100,4);
	return 1;
end

function item_12008(item,count,event,player)
	player:set_status(114,300,100,4);
	return 1;
end

function item_12009(item,count,event,player)
	player:set_status(115,300,100,4);
	return 1;
end



function item_10028(item,count,event,player)
	player:set_status(107,3600,100,5);
	--player:alert(110,0,0,"HP上限增加%4,持续时间60分钟");
	return 1;
end

function item_10029(item,count,event,player)
	player:set_status(108,3600,100,5);
	--player:alert(110,0,0,"MP上限增加%2,持续时间60分钟");
	return 1;
end

function item_10030(item,count,event,player)
	player:set_status(110,3600,100,5);
	--player:alert(110,0,0,"防御上限增加%1,持续时间60分钟");
	return 1;
end

function item_10031(item,count,event,player) --神秘魔盒
	if player:getMapFlag() == 1 then
		player:alert(21,0,0,"开启失败,安全区禁止开启魔盒");
		return 0;
	else
		player:generateLoot(8780,1);
		return 1;
	end
end

function item_10032(item,count,event,player)
	local ff = player:randomthismap(82);
	return 1;
end

function item_10033(item,count,event,player)
	player:openpanel(28);
	return 0;
end

function item_10034(item,count,event,player)
	player:set_status(102,0,100,7);
	return 1;
end

function item_10035(item,count,event,player)
	player:set_status(111,0,100,7);
	return 1;
end

function item_10036(item,count,event,player)
	player:set_status(116,0,100,7);
	return 1;
end

function item_10115(item,count,event,player) --成长礼包
	if player:num_bag_black() >= 10 then
		local njob = player:get_job();
		local nsex = player:get_gender();
		player:add_item(10241,2,0,0,0);
		player:add_item(10268,1,0,0,0);
		if njob == 1 then
			player:add_item(40012,1,0,0,5);
			player:add_item(50012,2,0,0,5);
			player:add_item(60012,2,0,0,5);
			player:add_item(70012,1,0,0,5);
			player:add_item(90012,1,0,0,5);
			player:add_item(100012,1,0,0,5);
		elseif njob == 2 then
			player:add_item(40013,1,0,0,5);
			player:add_item(50013,2,0,0,5);
			player:add_item(60013,2,0,0,5);
			player:add_item(70013,1,0,0,5);
			player:add_item(90013,1,0,0,5);
			player:add_item(100013,1,0,0,5);
		elseif njob == 3 then
			player:add_item(40014,1,0,0,5);
			player:add_item(50014,2,0,0,5);
			player:add_item(60014,2,0,0,5);
			player:add_item(70014,1,0,0,5);
			player:add_item(90014,1,0,0,5);
			player:add_item(100014,1,0,0,5);
		end
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足10格");
		return 0;
	end
end

function item_10116(item,count,event,player) --勇士礼包
	if player:num_bag_black() >= 6 then
		player:add_item(128001,1,1,0,0);
		player:add_item(10246,1,1,0,0);
		player:add_item(10249,1,1,0,0);
		player:add_item(10284,1,1,0,0);
		player:add_item(10268,2,1,0,0);
		player:add_item(10252,1,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足6格");
		return 0;
	end
end

function item_10117(item,count,event,player) --富豪礼包
	if player:num_bag_black() >= 6 then
		local njob = player:get_job();
		if njob == 1 then
			player:add_item(80001,1,0,0,0);
		elseif njob == 2 then
			player:add_item(81001,1,0,0,0);
		elseif njob == 3 then
			player:add_item(81001,1,0,0,0);
		end
		player:add_item(10241,10,1,0,0);
		player:add_item(10247,1,1,0,0);
		player:add_item(10261,1,1,0,0);
		player:add_item(10251,1,1,0,0);
		player:add_item(10268,5,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足6格");
		return 0;
	end
end

function item_10118(item,count,event,player) --传奇礼包
	if player:num_bag_black() >= 6 then
		local njob = player:get_job();
		player:add_item(10241,20,1,0,0);
		if njob == 1 then
			player:add_item(20026,1,0,0,0);
		elseif njob == 2 then
			player:add_item(20027,1,0,0,0);
		elseif njob == 3 then
			player:add_item(20028,1,0,0,0);
		end
		player:add_item(10173,1,1,0,0);
		player:add_item(10240,1,1,0,0);
		player:add_item(10268,10,1,0,0);
		player:add_item(10239,1,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足6格");
		return 0;
	end
end

function item_10057(item,count,event,player)    --传送石
    player:echo(0,114,[[
title^chuansongy|
image^anquanquyu|
line|
text^<u><a href='event:M2411,1,73,85'><font color="#54bb34">神武王城</font></a></u>^前往神武王城|
text^<u><a href='event:M2411,272,27,45'><font color="#54bb34">天 羽 村</font></a></u>^前往天羽村|
text^<u><a href='event:M2411,17,106,135'><font color="#54bb34">天 星 城</font></a></u>^前往天星城|
|
image^jipinzhuanbei|
line|
text^<u><a href='event:M2411,1,89,104,task_track_link_npc,1,89,105,129'><font color="#54bb34">八大禁地</font></a></u>^前往八大禁地|
text^<u><a href='event:M2411,1,92,100,task_track_link_npc,1,93,99,151'><font color="#54bb34">末日168</font></a></u>^前往末日168|
text^<u><a href='event:M2411,1,85,99,task_track_link_npc,1,85,101,128'><font color="#54bb34">地狱18层</font></a></u>^前往地狱18层|
text^<u><a href='event:M2411,1,84,92,task_track_link_npc,1,85,92,123'><font color="#54bb34">打宝副本</font></a></u>^前往打宝|
|

image^fengfuhuodong|
line|
text^<u><a href='event:M2411,1,76,122,task_track_link_npc,1,77,120,124'><font color="#54bb34">谁与争锋</font></a></u>^前往谁与争锋|
text^<u><a href='event:M2411,1,74,113,task_track_link_npc,1,75,113,135'><font color="#54bb34">奔跑兄弟</font></a></u>^前往奔跑兄弟|
text^<u><a href='event:M2411,1,63,117,task_track_link_npc,1,65,117,117'><font color="#54bb34">PK泡点</font></a></u>^前往PK泡点|
text^<u><a href='event:M2411,1,68,122,task_track_link_npc,1,66,122,118'><font color="#54bb34">夺宝奇兵</font></a></u>^前往夺宝奇兵|
|
text^<u><a href='event:M2411,1,75,89,task_track_link_npc,1,76,88,125'><font color="#54bb34">膜拜城主</font></a></u>^前往膜拜城主|
text^<u><a href='event:M2411,1,72,126,task_track_link_npc,1,73,125,121'><font color="#54bb34">疯狂挖矿</font></a></u>^前往疯狂挖矿|
text^<u><a href='event:M2411,1,80,116,task_track_link_npc,1,80,118,130'><font color="#54bb34">群雄争霸</font></a></u>^前往群雄争霸|
text^<u><a href='event:M2411,17,151,166'><font color="#54bb34">攻城激战</font></a></u>^前往攻城战|
|
text^<u><a href='event:M2411,1,64,76,task_track_link_npc,1,63,76,163'><font color="#54bb34">神羽秘境</font></a></u>^前往神羽秘境|
text^<u><a href='event:M2411,1,63,72,task_track_link_npc,1,62,72,162'><font color="#54bb34">宝石秘境</font></a></u>^前往宝石秘境|
text^<u><a href='event:M2411,1,60,73,task_track_link_npc,1,60,74,164'><font color="#54bb34">魂珠秘境</font></a></u>^前往魂珠秘境|
text^<u><a href='event:M2411,1,65,73,task_track_link_npc,1,65,73,161'><font color="#54bb34">血玉秘境</font></a></u>^前往血玉秘境|
|

image^qiangboss|
line|
text^<u><a href='event:M2411,1,88,86,task_track_link_npc,1,89,86,134'><font color="#54bb34">神威魔狱</font></a></u>^前往神威狱|
text^<u><a href='event:M2411,1,88,96,task_track_link_npc,1,89,96,133'><font color="#54bb34">BOSS之家</font></a></u>^前往BOSS之家|
text^<u><a href='event:M2411,1,79,96,task_track_link_npc,1,80,96,126'><font color="#54bb34">转生秘境</font></a></u>^前往转生秘境|
|

image^xiuxianguaji|
line|
text^<u><a href='event:M2411,1,73,76,task_track_link_npc,1,72,76,145'><font color="#54bb34">挂机传送</font></a></u>^前往挂机传送|
|

]]);
    return 1;
end


function item_10058(item,count,event,player) --公会礼包
	if player:GetGuildId() == 0 then
		player:alert(21,0,0,"加入公会即可开启礼包获得大礼");
		return 0;
	end
    if player:num_bag_black() >= 2 then
        player:add_item(10287,5,1,0,0);
        player:add_item(12014,5,1,0,0);

        return 1;
    else
        player:alert(10,0,0,"您的背包空间不足2格");
        return 0;
    end
end

function item_10075(item,count,event,player) --勇士初级礼包
    if player:num_bag_black() >= 2 then
        player:add_item(10151,2,1,0,0);
        player:add_item(10159,1,1,0,0);
        return 1;
    else
        player:alert(10,0,0,"您的背包空间不足2格");
        return 0;
    end
end

function item_10076(item,count,event,player) --王者初级礼包
    if player:num_bag_black() >= 2 then
        player:add_item(10151,2,1,0,0);
        player:add_item(10159,2,1,0,0);
        return 1;
    else
        player:alert(10,0,0,"您的背包空间不足2格");
        return 0;
    end
end

function item_10077(item,count,event,player) --霸主初级礼包
    if player:num_bag_black() >= 2 then
        player:add_item(12021,5,0,0,0);
        player:add_item(10159,5,0,0,0);
        return 1;
    else
        player:alert(10,0,0,"您的背包空间不足2格");
        return 0;
    end
end

function item_10078(item,count,event,player) --勇士中级礼包
    if player:num_bag_black() >= 2 then
        player:add_item(10246,1,1,0,0);
        player:add_item(10160,1,1,0,0);
        return 1;
    else
        player:alert(10,0,0,"您的背包空间不足2格");
        return 0;
    end
end

function item_10079(item,count,event,player) --王者中级礼包
    if player:num_bag_black() >= 2 then
        player:add_item(10246,2,1,0,0);
        player:add_item(10160,2,1,0,0);
        return 1;
    else
        player:alert(10,0,0,"您的背包空间不足2格");
        return 0;
    end
end

function item_10080(item,count,event,player) --霸主中级礼包
    if player:num_bag_black() >= 2 then
        player:add_item(12022,5,0,0,0);
        player:add_item(10160,10,0,0,0);
        return 1;
    else
        player:alert(10,0,0,"您的背包空间不足2格");
        return 0;
    end
end

function item_10081(item,count,event,player) --勇者高级礼包
    if player:num_bag_black() >= 2 then
        player:add_item(10154,1,1,0,0);
        player:add_item(10161,1,1,0,0);
        return 1;
    else
        player:alert(10,0,0,"您的背包空间不足2格");
        return 0;
    end
end

function item_10082(item,count,event,player) --王者高级礼包
    if player:num_bag_black() >= 2 then
        player:add_item(10154,2,1,0,0);
        player:add_item(10161,2,1,0,0);
        return 1;
    else
        player:alert(10,0,0,"您的背包空间不足2格");
        return 0;
    end
end

function item_10083(item,count,event,player) --霸主高级礼包
    if player:num_bag_black() >= 2 then
        player:add_item(12023,2,0,0,0);
        player:add_item(10161,5,0,0,0);
        return 1;
    else
        player:alert(10,0,0,"您的背包空间不足2格");
        return 0;
    end
end

function item_10084(item,count,event,player) --70级装备福袋
    if player:num_bag_black() < 1 then
       player:alert(10,0,0,"您的背包空间不足");
       return 0;
   end
    local x = math.random(0,9996);
    local job = player:get_job();
    if job == 1 then
        if x <= 1282 then
        player:add_item(20206,1,1,0,0);
        elseif x <= 2564 then
        player:add_item(20406,1,1,0,0);
        elseif x <= 3846 then
        player:add_item(20706,1,1,0,0);
        elseif x <= 5128 then
        player:add_item(20806,1,1,0,0);
        elseif x <= 6410 then
        player:add_item(21006,1,1,0,0);
        elseif x <= 7692 then
        player:add_item(21106,1,1,0,0);
        elseif x <= 7948 then
        player:add_item(20207,1,1,0,0);
        elseif x <= 8204 then
        player:add_item(20407,1,1,0,0);
        elseif x <= 8460 then
        player:add_item(20707,1,1,0,0);
        elseif x <= 8716 then
        player:add_item(20807,1,1,0,0);
        elseif x <= 8972 then
        player:add_item(21007,1,1,0,0);
        elseif x <= 9228 then
        player:add_item(21107,1,1,0,0);
        elseif x <= 9356 then
        player:add_item(20208,1,1,0,0);
        elseif x <= 9484 then
        player:add_item(20408,1,1,0,0);
        elseif x <= 9612 then
        player:add_item(20708,1,1,0,0);
        elseif x <= 9740 then
        player:add_item(20808,1,1,0,0);
        elseif x <= 9868 then
        player:add_item(21008,1,1,0,0);
        else
        player:add_item(21108,1,1,0,0);
        end
        return 1;
    end
    if job == 2 then
        if x <= 1282 then
        player:add_item(20206,1,1,0,0);
        elseif x <= 2564 then
        player:add_item(20406,1,1,0,0);
        elseif x <= 3846 then
        player:add_item(20706,1,1,0,0);
        elseif x <= 5128 then
        player:add_item(20806,1,1,0,0);
        elseif x <= 6410 then
        player:add_item(21006,1,1,0,0);
        elseif x <= 7692 then
        player:add_item(21106,1,1,0,0);
        elseif x <= 7948 then
        player:add_item(20228,1,1,0,0);
        elseif x <= 8204 then
        player:add_item(20428,1,1,0,0);
        elseif x <= 8460 then
        player:add_item(20728,1,1,0,0);
        elseif x <= 8716 then
        player:add_item(20828,1,1,0,0);
        elseif x <= 8972 then
        player:add_item(21028,1,1,0,0);
        elseif x <= 9228 then
        player:add_item(21128,1,1,0,0);
        elseif x <= 9356 then
        player:add_item(20229,1,1,0,0);
        elseif x <= 9484 then
        player:add_item(20429,1,1,0,0);
        elseif x <= 9612 then
        player:add_item(20729,1,1,0,0);
        elseif x <= 9740 then
        player:add_item(20829,1,1,0,0);
        elseif x <= 9868 then
        player:add_item(21029,1,1,0,0);
        else
        player:add_item(21129,1,1,0,0);
        end
        return 1;
    end
        if job == 3 then
        if x <= 1282 then
        player:add_item(20206,1,1,0,0);
        elseif x <= 2564 then
        player:add_item(20406,1,1,0,0);
        elseif x <= 3846 then
        player:add_item(20706,1,1,0,0);
        elseif x <= 5128 then
        player:add_item(20806,1,1,0,0);
        elseif x <= 6410 then
        player:add_item(21006,1,1,0,0);
        elseif x <= 7692 then
        player:add_item(21106,1,1,0,0);
        elseif x <= 7948 then
        player:add_item(20249,1,1,0,0);
        elseif x <= 8204 then
        player:add_item(20449,1,1,0,0);
        elseif x <= 8460 then
        player:add_item(20749,1,1,0,0);
        elseif x <= 8716 then
        player:add_item(20849,1,1,0,0);
        elseif x <= 8972 then
        player:add_item(21049,1,1,0,0);
        elseif x <= 9228 then
        player:add_item(21149,1,1,0,0);
        elseif x <= 9356 then
        player:add_item(20250,1,1,0,0);
        elseif x <= 9484 then
        player:add_item(20450,1,1,0,0);
        elseif x <= 9612 then
        player:add_item(20750,1,1,0,0);
        elseif x <= 9740 then
        player:add_item(20850,1,1,0,0);
        elseif x <= 9868 then
        player:add_item(21050,1,1,0,0);
        else
        player:add_item(21150,1,1,0,0);
        end
        return 1;
    end
end

function item_10085(item,count,event,player)
if player:num_bag_black() < 1 then
   player:alert(10,0,0,"您的背包空间不足");
   return 0;
end
local x = math.random(0,100);
local y = math.random(0,18);
if x <= 30 then
  if y <= 1 then
  player:add_item(20206,1,0,0,0,0);
  elseif y<= 2 then
  player:add_item(20206,1,0,0,0,0);
  elseif y<= 3 then
  player:add_item(20206,1,0,0,0,0);
  elseif y<= 4 then
  player:add_item(20406,1,0,0,0,0);
  elseif y<= 5 then
  player:add_item(20406,1,0,0,0,0);
  elseif y<= 6 then
  player:add_item(20406,1,0,0,0,0);
  elseif y<= 7 then
  player:add_item(20706,1,0,0,0,0);
  elseif y<= 8 then
  player:add_item(20706,1,0,0,0,0);
  elseif y<= 9 then
  player:add_item(20706,1,0,0,0,0);
  elseif y<= 10 then
  player:add_item(20806,1,0,0,0,0);
  elseif y<= 11 then
  player:add_item(20806,1,0,0,0,0);
  elseif y<= 12 then
  player:add_item(20806,1,0,0,0,0);
  elseif y<= 13 then
  player:add_item(21006,1,0,0,0,0);
  elseif y<= 14 then
  player:add_item(21006,1,0,0,0,0);
  elseif y<= 15 then
  player:add_item(21006,1,0,0,0,0);
  elseif y<= 16 then
  player:add_item(21106,1,0,0,0,0);
  elseif y<= 17 then
  player:add_item(21106,1,0,0,0,0);
  else
  player:add_item(21106,1,0,0,0,0);
  end
  return 1;
elseif x <= 70 then
  if y <= 1 then
  player:add_item(20207,1,0,0,0,0);
  elseif y<= 2 then
  player:add_item(20228,1,0,0,0,0);
  elseif y<= 3 then
  player:add_item(20249,1,0,0,0,0);
  elseif y<= 4 then
  player:add_item(20407,1,0,0,0,0);
  elseif y<= 5 then
  player:add_item(20428,1,0,0,0,0);
  elseif y<= 6 then
  player:add_item(20449,1,0,0,0,0);
  elseif y<= 7 then
  player:add_item(20707,1,0,0,0,0);
  elseif y<= 8 then
  player:add_item(20728,1,0,0,0,0);
  elseif y<= 9 then
  player:add_item(20749,1,0,0,0,0);
  elseif y<= 10 then
  player:add_item(20807,1,0,0,0,0);
  elseif y<= 11 then
  player:add_item(20828,1,0,0,0,0);
  elseif y<= 12 then
  player:add_item(20849,1,0,0,0,0);
  elseif y<= 13 then
  player:add_item(21007,1,0,0,0,0);
  elseif y<= 14 then
  player:add_item(21028,1,0,0,0,0);
  elseif y<= 15 then
  player:add_item(21049,1,0,0,0,0);
  elseif y<= 16 then
  player:add_item(21107,1,0,0,0,0);
  elseif y<= 17 then
  player:add_item(21128,1,0,0,0,0);
  else
  player:add_item(21149,1,0,0,0,0);
  end
  return 1;
elseif x <= 90 then
  if y <= 1 then
  player:add_item(20208,1,0,0,0,0);
  elseif y<= 2 then
  player:add_item(20229,1,0,0,0,0);
  elseif y<= 3 then
  player:add_item(20250,1,0,0,0,0);
  elseif y<= 4 then
  player:add_item(20408,1,0,0,0,0);
  elseif y<= 5 then
  player:add_item(20429,1,0,0,0,0);
  elseif y<= 6 then
  player:add_item(20450,1,0,0,0,0);
  elseif y<= 7 then
  player:add_item(20708,1,0,0,0,0);
  elseif y<= 8 then
  player:add_item(20729,1,0,0,0,0);
  elseif y<= 9 then
  player:add_item(20750,1,0,0,0,0);
  elseif y<= 10 then
  player:add_item(20808,1,0,0,0,0);
  elseif y<= 11 then
  player:add_item(20829,1,0,0,0,0);
  elseif y<= 12 then
  player:add_item(20850,1,0,0,0,0);
  elseif y<= 13 then
  player:add_item(21008,1,0,0,0,0);
  elseif y<= 14 then
  player:add_item(21029,1,0,0,0,0);
  elseif y<= 15 then
  player:add_item(21050,1,0,0,0,0);
  elseif y<= 16 then
  player:add_item(21108,1,0,0,0,0);
  elseif y<= 17 then
  player:add_item(21129,1,0,0,0,0);
  else
  player:add_item(21150,1,0,0,0,0);
  end
  return 1;
else
  if y <= 1 then
  player:add_item(20210,1,0,0,0,0);
  elseif y<= 2 then
  player:add_item(20231,1,0,0,0,0);
  elseif y<= 3 then
  player:add_item(20252,1,0,0,0,0);
  elseif y<= 4 then
  player:add_item(20410,1,0,0,0,0);
  elseif y<= 5 then
  player:add_item(20431,1,0,0,0,0);
  elseif y<= 6 then
  player:add_item(20452,1,0,0,0,0);
  elseif y<= 7 then
  player:add_item(20710,1,0,0,0,0);
  elseif y<= 8 then
  player:add_item(20731,1,0,0,0,0);
  elseif y<= 9 then
  player:add_item(20752,1,0,0,0,0);
  elseif y<= 10 then
  player:add_item(20810,1,0,0,0,0);
  elseif y<= 11 then
  player:add_item(20831,1,0,0,0,0);
  elseif y<= 12 then
  player:add_item(20852,1,0,0,0,0);
  elseif y<= 13 then
  player:add_item(21010,1,0,0,0,0);
  elseif y<= 14 then
  player:add_item(21031,1,0,0,0,0);
  elseif y<= 15 then
  player:add_item(21052,1,0,0,0,0);
  elseif y<= 16 then
  player:add_item(21110,1,0,0,0,0);
  elseif y<= 17 then
  player:add_item(21131,1,0,0,0,0);
  else
  player:add_item(21152,1,0,0,0,0);
  end
  return 1;
end


end

function item_10059(item,count,event,player)

end

function item_10060(item,count,event,player) --6转礼包1
    if player:num_bag_black() < 1 then
       player:alert(10,0,0,"您的背包空间不足");
       return 0;
   end
    local x = math.random(0,6);
    local job = player:get_job();
    if job == 1 then
        if x <= 1 then
        player:add_item(20215,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20415,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20715,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20815,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21015,1,0,0,0);
        else
        player:add_item(21115,1,0,0,0);
        end
        return 1;
    end
    if job == 2 then
        if x <= 1 then
        player:add_item(20236,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20436,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20736,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20836,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21036,1,0,0,0);
        else
        player:add_item(21136,1,0,0,0);
        end
        return 1;
    end
    if job == 3 then
        if x <= 1 then
        player:add_item(20257,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20457,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20757,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20857,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21057,1,0,0,0);
        else
        player:add_item(21157,1,0,0,0);
        end
        return 1;
    end
end


function item_10061(item,count,event,player) --4转礼包1
    if player:num_bag_black() < 1 then
       player:alert(10,0,0,"您的背包空间不足");
       return 0;
   end
    local x = math.random(0,6);
    local job = player:get_job();
    if job == 1 then
        if x <= 1 then
        player:add_item(20213,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20413,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20713,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20813,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21013,1,0,0,0);
        else
        player:add_item(21113,1,0,0,0);
        end
        return 1;
    end
    if job == 2 then
        if x <= 1 then
        player:add_item(20234,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20434,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20734,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20834,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21034,1,0,0,0);
        else
        player:add_item(21134,1,0,0,0);
        end
        return 1;
    end
    if job == 3 then
        if x <= 1 then
        player:add_item(20255,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20455,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20755,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20855,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21055,1,0,0,0);
        else
        player:add_item(21155,1,0,0,0);
        end
        return 1;
    end
end

function item_10062(item,count,event,player) --2转礼包1
    if player:num_bag_black() < 1 then
       player:alert(10,0,0,"您的背包空间不足");
       return 0;
   end
    local x = math.random(0,6);
    local job = player:get_job();
    if job == 1 then
        if x <= 1 then
        player:add_item(20211,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20411,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20711,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20811,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21011,1,0,0,0);
        else
        player:add_item(21111,1,0,0,0);
        end
        return 1;
    end
    if job == 2 then
        if x <= 1 then
        player:add_item(20232,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20432,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20732,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20832,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21032,1,0,0,0);
        else
        player:add_item(21132,1,0,0,0);
        end
        return 1;
    end
    if job == 3 then
        if x <= 1 then
        player:add_item(20253,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20453,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20753,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20853,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21053,1,0,0,0);
        else
        player:add_item(21153,1,0,0,0);
        end
        return 1;
    end
end


function item_10063(item,count,event,player) --6转礼包2
    if player:num_bag_black() < 1 then
       player:alert(10,0,0,"您的背包空间不足");
       return 0;
   end
    local x = math.random(0,6);
    local job = player:get_job();
    if job == 1 then
        if x <= 1 then
        player:add_item(20215,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20415,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20715,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20815,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21015,1,0,0,0);
        else
        player:add_item(21115,1,0,0,0);
        end
        return 1;
    end
    if job == 2 then
        if x <= 1 then
        player:add_item(20236,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20436,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20736,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20836,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21036,1,0,0,0);
        else
        player:add_item(21136,1,0,0,0);
        end
        return 1;
    end
    if job == 3 then
        if x <= 1 then
        player:add_item(20257,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20457,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20757,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20857,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21057,1,0,0,0);
        else
        player:add_item(21157,1,0,0,0);
        end
        return 1;
    end
end


function item_10064(item,count,event,player) --4转礼包2
    if player:num_bag_black() < 1 then
       player:alert(10,0,0,"您的背包空间不足");
       return 0;
   end
    local x = math.random(0,6);
    local job = player:get_job();
    if job == 1 then
        if x <= 1 then
        player:add_item(20213,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20413,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20713,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20813,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21013,1,0,0,0);
        else
        player:add_item(21113,1,0,0,0);
        end
        return 1;
    end
    if job == 2 then
        if x <= 1 then
        player:add_item(20234,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20434,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20734,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20834,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21034,1,0,0,0);
        else
        player:add_item(21134,1,0,0,0);
        end
        return 1;
    end
    if job == 3 then
        if x <= 1 then
        player:add_item(20255,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20455,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20755,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20855,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21055,1,0,0,0);
        else
        player:add_item(21155,1,0,0,0);
        end
        return 1;
    end
end

function item_10065(item,count,event,player) --2转礼包2
    if player:num_bag_black() < 1 then
       player:alert(10,0,0,"您的背包空间不足");
       return 0;
   end
    local x = math.random(0,6);
    local job = player:get_job();
    if job == 1 then
        if x <= 1 then
        player:add_item(20211,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20411,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20711,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20811,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21011,1,0,0,0);
        else
        player:add_item(21111,1,0,0,0);
        end
        return 1;
    end
    if job == 2 then
        if x <= 1 then
        player:add_item(20232,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20432,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20732,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20832,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21032,1,0,0,0);
        else
        player:add_item(21132,1,0,0,0);
        end
        return 1;
    end
    if job == 3 then
        if x <= 1 then
        player:add_item(20253,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20453,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20753,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20853,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21053,1,0,0,0);
        else
        player:add_item(21153,1,0,0,0);
        end
        return 1;
    end
end

function item_10066(item,count,event,player) --6转礼包3
    if player:num_bag_black() < 1 then
       player:alert(10,0,0,"您的背包空间不足");
       return 0;
   end
    local x = math.random(0,6);
    local job = player:get_job();
    if job == 1 then
        if x <= 1 then
        player:add_item(20215,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20415,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20715,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20815,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21015,1,0,0,0);
        else
        player:add_item(21115,1,0,0,0);
        end
        return 1;
    end
    if job == 2 then
        if x <= 1 then
        player:add_item(20236,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20436,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20736,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20836,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21036,1,0,0,0);
        else
        player:add_item(21136,1,0,0,0);
        end
        return 1;
    end
    if job == 3 then
        if x <= 1 then
        player:add_item(20257,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20457,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20757,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20857,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21057,1,0,0,0);
        else
        player:add_item(21157,1,0,0,0);
        end
        return 1;
    end
end


function item_10067(item,count,event,player) --4转礼包3
    if player:num_bag_black() < 1 then
       player:alert(10,0,0,"您的背包空间不足");
       return 0;
   end
    local x = math.random(0,6);
    local job = player:get_job();
    if job == 1 then
        if x <= 1 then
        player:add_item(20213,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20413,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20713,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20813,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21013,1,0,0,0);
        else
        player:add_item(21113,1,0,0,0);
        end
        return 1;
    end
    if job == 2 then
        if x <= 1 then
        player:add_item(20234,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20434,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20734,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20834,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21034,1,0,0,0);
        else
        player:add_item(21134,1,0,0,0);
        end
        return 1;
    end
    if job == 3 then
        if x <= 1 then
        player:add_item(20255,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20455,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20755,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20855,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21055,1,0,0,0);
        else
        player:add_item(21155,1,0,0,0);
        end
        return 1;
    end
end

function item_10068(item,count,event,player) --2转礼包2
    if player:num_bag_black() < 1 then
       player:alert(10,0,0,"您的背包空间不足");
       return 0;
   end
    local x = math.random(0,6);
    local job = player:get_job();
    if job == 1 then
        if x <= 1 then
        player:add_item(20211,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20411,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20711,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20811,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21011,1,0,0,0);
        else
        player:add_item(21111,1,0,0,0);
        end
        return 1;
    end
    if job == 2 then
        if x <= 1 then
        player:add_item(20232,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20432,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20732,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20832,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21032,1,0,0,0);
        else
        player:add_item(21132,1,0,0,0);
        end
        return 1;
    end
    if job == 3 then
        if x <= 1 then
        player:add_item(20253,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20453,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20753,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20853,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21053,1,0,0,0);
        else
        player:add_item(21153,1,0,0,0);
        end
        return 1;
    end
end

function item_10069(item,count,event,player) --6转礼包4
    if player:num_bag_black() < 1 then
       player:alert(10,0,0,"您的背包空间不足");
       return 0;
   end
    local x = math.random(0,6);
    local job = player:get_job();
    if job == 1 then
        if x <= 1 then
        player:add_item(20215,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20415,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20715,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20815,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21015,1,0,0,0);
        else
        player:add_item(21115,1,0,0,0);
        end
        return 1;
    end
    if job == 2 then
        if x <= 1 then
        player:add_item(20236,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20436,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20736,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20836,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21036,1,0,0,0);
        else
        player:add_item(21136,1,0,0,0);
        end
        return 1;
    end
    if job == 3 then
        if x <= 1 then
        player:add_item(20257,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20457,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20757,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20857,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21057,1,0,0,0);
        else
        player:add_item(21157,1,0,0,0);
        end
        return 1;
    end
end


function item_10070(item,count,event,player) --4转礼包4
    if player:num_bag_black() < 1 then
       player:alert(10,0,0,"您的背包空间不足");
       return 0;
   end
    local x = math.random(0,6);
    local job = player:get_job();
    if job == 1 then
        if x <= 1 then
        player:add_item(20213,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20413,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20713,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20813,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21013,1,0,0,0);
        else
        player:add_item(21113,1,0,0,0);
        end
        return 1;
    end
    if job == 2 then
        if x <= 1 then
        player:add_item(20234,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20432,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20734,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20834,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21034,1,0,0,0);
        else
        player:add_item(21134,1,0,0,0);
        end
        return 1;
    end
    if job == 3 then
        if x <= 1 then
        player:add_item(20255,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20455,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20755,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20855,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21055,1,0,0,0);
        else
        player:add_item(21155,1,0,0,0);
        end
        return 1;
    end
end

function item_10071(item,count,event,player) --2转礼包4
    if player:num_bag_black() < 1 then
       player:alert(10,0,0,"您的背包空间不足");
       return 0;
   end
    local x = math.random(0,6);
    local job = player:get_job();
    if job == 1 then
        if x <= 1 then
        player:add_item(20211,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20411,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20711,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20811,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21011,1,0,0,0);
        else
        player:add_item(21111,1,0,0,0);
        end
        return 1;
    end
    if job == 2 then
        if x <= 1 then
        player:add_item(20232,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20432,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20732,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20832,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21032,1,0,0,0);
        else
        player:add_item(21132,1,0,0,0);
        end
        return 1;
    end
    if job == 3 then
        if x <= 1 then
        player:add_item(20253,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20453,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20753,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20853,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21053,1,0,0,0);
        else
        player:add_item(21153,1,0,0,0);
        end
        return 1;
    end
end

function item_10072(item,count,event,player) --6转礼包5
    if player:num_bag_black() < 1 then
       player:alert(10,0,0,"您的背包空间不足");
       return 0;
   end
    local x = math.random(0,6);
    local job = player:get_job();
    if job == 1 then
        if x <= 1 then
        player:add_item(20215,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20415,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20715,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20815,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21015,1,0,0,0);
        else
        player:add_item(21115,1,0,0,0);
        end
        return 1;
    end
    if job == 2 then
        if x <= 1 then
        player:add_item(20236,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20436,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20736,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20836,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21036,1,0,0,0);
        else
        player:add_item(21136,1,0,0,0);
        end
        return 1;
    end
    if job == 3 then
        if x <= 1 then
        player:add_item(20257,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20457,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20757,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20857,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21057,1,0,0,0);
        else
        player:add_item(21157,1,0,0,0);
        end
        return 1;
    end
end


function item_10073(item,count,event,player) --4转礼包5
    if player:num_bag_black() < 1 then
       player:alert(10,0,0,"您的背包空间不足");
       return 0;
   end
    local x = math.random(0,6);
    local job = player:get_job();
    if job == 1 then
        if x <= 1 then
        player:add_item(20213,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20413,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20713,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20813,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21013,1,0,0,0);
        else
        player:add_item(21113,1,0,0,0);
        end
        return 1;
    end
    if job == 2 then
        if x <= 1 then
        player:add_item(20234,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20432,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20734,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20834,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21034,1,0,0,0);
        else
        player:add_item(21134,1,0,0,0);
        end
        return 1;
    end
    if job == 3 then
        if x <= 1 then
        player:add_item(20255,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20455,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20755,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20855,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21055,1,0,0,0);
        else
        player:add_item(21155,1,0,0,0);
        end
        return 1;
    end
end

function item_10074(item,count,event,player) --2转礼包5
    if player:num_bag_black() < 1 then
       player:alert(10,0,0,"您的背包空间不足");
       return 0;
   end
    local x = math.random(0,6);
    local job = player:get_job();
    if job == 1 then
        if x <= 1 then
        player:add_item(20211,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20411,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20711,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20811,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21011,1,0,0,0);
        else
        player:add_item(21111,1,0,0,0);
        end
        return 1;
    end
    if job == 2 then
        if x <= 1 then
        player:add_item(20232,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20432,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20732,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20832,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21032,1,0,0,0);
        else
        player:add_item(21132,1,0,0,0);
        end
        return 1;
    end
    if job == 3 then
        if x <= 1 then
        player:add_item(20253,1,0,0,0);
        elseif x <= 2 then
        player:add_item(20453,1,0,0,0);
        elseif x <= 3 then
        player:add_item(20753,1,0,0,0);
        elseif x <= 4 then
        player:add_item(20853,1,0,0,0);
        elseif x <= 5 then
        player:add_item(21053,1,0,0,0);
        else
        player:add_item(21153,1,0,0,0);
        end
        return 1;
    end
end

function item_12011(item,count,event,player)--金砖小

end

function item_12012(item,count,event,player)--金砖中

end

function item_10142(item,count,event,player) --神盾碎片(小)
	local nItem = 1000 * count;
	player:set_param(248,player:get_param(248) + nItem,item:GetName(),count);
	player:FinishFeats(16,count);
	player:alert(10,0,0,"神盾碎片 + ".. nItem .. "，当前数量" .. player:get_param(248))
	return count;
end

function item_10143(item,count,event,player) --神盾精华
	local nItem = 50000 * count;
	player:set_param(248,player:get_param(248) + nItem,item:GetName(),count);
	player:FinishFeats(16,count);
	player:alert(10,0,0,"神盾碎片 + ".. nItem .. "，当前数量" .. player:get_param(248))
	return count;
end

function item_10144(item,count,event,player) --神盾碎片(中)
	local nItem = 5000 * count;
	player:set_param(248,player:get_param(248) + nItem,item:GetName(),count);
	player:FinishFeats(16,count);
	player:alert(10,0,0,"神盾碎片 + ".. nItem .. "，当前数量" .. player:get_param(248))
	return count;
end

function item_10145(item,count,event,player) --神盾碎片(大)
	local nItem = 10000 * count;
	player:set_param(248,player:get_param(248) + nItem,item:GetName(),count);
	player:FinishFeats(16,count);
	player:alert(10,0,0,"神盾碎片 + ".. nItem .. "，当前数量" .. player:get_param(248))
	return count;
end

function item_10146(item,count,event,player) --血玉精华
	local nItem = 1000 * count;
	player:set_param(250,player:get_param(250) + nItem,item:GetName(),count);
	player:FinishFeats(15,count);
	player:alert(10,0,0,"血玉碎片 + ".. nItem .. "，当前数量" .. player:get_param(250))
	return count;
end


function item_10147(item,count,event,player) --血玉碎片
	local nItem = 10 * count;
	player:set_param(250,player:get_param(250) + nItem,item:GetName(),count);
	player:FinishFeats(15,count);
	player:alert(10,0,0,"血玉碎片 + ".. nItem .. "，当前数量" .. player:get_param(250))
	return count;
end

function item_10148(item,count,event,player) --血玉碎片（中）
	local nItem = 20 * count;
	player:set_param(250,player:get_param(250) + nItem,item:GetName(),count);
	player:FinishFeats(15,count);
	player:alert(10,0,0,"血玉碎片 + ".. nItem .. "，当前数量" .. player:get_param(250))
	return count;
end

function item_10149(item,count,event,player) --风云谷卷轴
	player:randomthismap(116);
	return 1;
end

function item_10150(item,count,event,player)
	local nrandom = math.random(1,100);
	local nrandomnum = 0;
	if nrandom >25 then
		nrandomnum = math.random(2,10);
	else
		nrandomnum = math.random(11,20);
	end
	player:alert(10,0,0,"恭喜获得血玉碎片大 * " .. nrandomnum);
	player:add_item(10186,nrandomnum,1,0,0);
	return 1;
end

function item_40102(item,count,event,player)
	local nrandom = math.random(1,100);
	local nrandomnum = 0;
	if nrandom >15 then
		nrandomnum = math.random(2,10);
	else
		nrandomnum = math.random(11,20);
	end
	player:alert(10,0,0,"恭喜获得羽毛 * " .. nrandomnum);
	player:add_item(40101,nrandomnum,1,0,0);
	return 1;
end

function item_10151(item,count,event,player) --魂珠碎片（小）
    local nvip = player:get_player_type();
    local itemUseLimit = VipLimit.itemUseLimit
    local itemid = item:GetEntryId()
    local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
    local now_times = player:get_param(610);
    if now_times >= maxtimes then
        player:alert(10,0,0,"今日使用次数已达到上限，请提升VIP等级")
        return;
    end
    if maxtimes - now_times < count then
        count = maxtimes - now_times;
    end
	local nItem = 1;
	nItem = nItem * count
	player:set_param(247,player:get_param(247) + nItem,item:GetName(),count);
	player:FinishFeats(18, count)
    now_times = now_times + count;
    player:set_param(610,now_times);
    local x = maxtimes - now_times;
    player:alert(10,0,0,"魂珠碎片 + "..nItem.."，当前数量"..player:get_param(247).."，今日剩余可使用次数："..x.."次!")

    local item_obj = {};
    item_obj.id = 10151;
    item_obj.times = now_times;
    player:SendPacketToSelf(1726,0,encode(item_obj));
	return count;
end

function item_10152(item,count,event,player) --魂珠碎片（中）
    local nvip = player:get_player_type();
    local itemUseLimit = VipLimit.itemUseLimit
    local itemid = item:GetEntryId()
    local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
    local now_times = player:get_param(611);
    if now_times >= maxtimes then
        player:alert(10,0,0,"今日使用次数已达到上限，请提升VIP等级")
        return;
    end
    if maxtimes - now_times < count then
        count = maxtimes - now_times;
    end
	local nItem = 10 * count;
	player:set_param(247,player:get_param(247) + nItem,item:GetName(),count);
	player:FinishFeats(18, count)
    now_times = now_times + count;
    player:set_param(611,now_times);
    local x = maxtimes - now_times;
    player:alert(10,0,0,"魂珠碎片 + "..nItem.."，当前数量"..player:get_param(247).."，今日剩余可使用次数："..x.."次!")

    local item_obj = {};
    item_obj.id = 10152;
    item_obj.times = now_times;
    player:SendPacketToSelf(1726,0,encode(item_obj));
	return count;
end

function item_10153(item,count,event,player) --宝石碎片（小）
    local nvip = player:get_player_type();
    local itemUseLimit = VipLimit.itemUseLimit
    local itemid = item:GetEntryId()
    local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
    local now_times = player:get_param(612);
    if now_times >= maxtimes then
        player:alert(10,0,0,"今日使用次数已达到上限，请提升VIP等级")
        return;
    end
    if maxtimes - now_times < count then
        count = maxtimes - now_times;
    end
	local nItem = 2 * count;
	player:set_param(208,player:get_param(208) + nItem,item:GetName(),count);
	player:FinishFeats(17, count)
    now_times = now_times + count;
    player:set_param(612,now_times);
    local x = maxtimes - now_times;
    player:alert(10,0,0,"宝石碎片 + "..nItem.."，当前数量"..player:get_param(208).."，今日剩余可使用次数："..x.."次!")

    local item_obj = {};
    item_obj.id = 10153;
    item_obj.times = now_times;
    player:SendPacketToSelf(1726,0,encode(item_obj));
	return count;
end

function item_10154(item,count,event,player) --宝石碎片（中）
    local nvip = player:get_player_type();
    local itemUseLimit = VipLimit.itemUseLimit
    local itemid = item:GetEntryId()
    local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
    local now_times = player:get_param(613);
    if now_times >= maxtimes then
        player:alert(10,0,0,"今日使用次数已达到上限，请提升VIP等级")
        return;
    end
    if maxtimes - now_times < count then
        count = maxtimes - now_times;
    end
	local nItem = 20 * count;
	player:set_param(208,player:get_param(208) + nItem,item:GetName(),count);
	player:FinishFeats(17, count)
    now_times = now_times + count;
    player:set_param(613,now_times);
    local x = maxtimes - now_times;
    player:alert(10,0,0,"宝石碎片 + "..nItem.."，当前数量"..player:get_param(208).."，今日剩余可使用次数："..x.."次!")

    local item_obj = {};
    item_obj.id = 10154;
    item_obj.times = now_times;
    player:SendPacketToSelf(1726,0,encode(item_obj));
	return count;
end

function item_10155(item,count,event,player) --宝石碎片（大）
	local nItem = 200 * count;
	player:set_param(208,player:get_param(208) + nItem,item:GetName(),count);
	player:FinishFeats(17, count)
    player:alert(10,0,0,"宝石碎片 + "..nItem.."，当前数量"..player:get_param(208))
	return count;
end

function item_10156(item,count,event,player) --宝石碎片（超大）
	local nItem = 400 * count;
	player:set_param(208,player:get_param(208) + nItem,item:GetName(),count);
	player:FinishFeats(17, count)
    player:alert(10,0,0,"宝石碎片 + "..nItem.."，当前数量"..player:get_param(208))
	return count;
end

function item_10157(item,count,event,player) --宝石碎片
	local nItem = 800 * count;
	player:set_param(208,player:get_param(208) + nItem,item:GetName(),count);
	player:alert(10,0,0,"宝石碎片 + ".. nItem .. "，当前数量" .. player:get_param(208))
	player:FinishFeats(17, count)
	return count;
end

function item_10158(item,count,event,player) --盾牌精华(大)
	local nItem = 37500 * count;
	player:set_param(248,player:get_param(248) + nItem,item:GetName(),count);
	player:FinishFeats(16,count);
	player:alert(10,0,0,"盾牌碎片 + ".. nItem .. "，当前数量" .. player:get_param(248))
	return count;
end

function item_10159(item,count,event,player)
	local Expr = 2000000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_10160(item,count,event,player)
	local Expr = 5000000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_10161(item,count,event,player)
	local Expr = 10000000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_10162(item,count,event,player)
	local Expr = 50000000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_10169(item,count,event,player)
	--权重,物品id,数量,绑定标记
	local config = {
		{12,40641,1,0},
		{9,40642,1,0},
		{9,40643,1,0},
		{7,40644,1,0},
		{7,40645,1,0},
		{4,40646,1,0},
		{2,40647,1,0},
		{1,40648,1,0}
	};
	local maxweight = 0;
	for i = 1,#config do
		maxweight = maxweight + config[i][1];
	end
	local nrandom = math.random(1,maxweight);
	for i = 1,#config do
		if nrandom <= config[i][1] then
			player:add_item(config[i][2],config[i][3],config[i][4],0,0);
			return 1;
		else
			nrandom = nrandom - config[i][1]
		end
	end
	return 0;
end

function item_10042(item,count,event,player)		--疗伤药(包)
	if player:num_bag_black() >= 6 then
		player:add_item(10038,6,0,0,0);
		return 1;
	else
		player:alert(10,0,0,"背包不足6格,无法解包");
		return 0;
	end
end

function item_10180(item,count,event,player) --赎罪药水
	if player:get_pk_value() >= 300 then
		player:set_pk_value(player:get_pk_value() - 300);
	else
		player:set_pk_value(0);
	end
	player:alert(20,0,0,"已经减少了300点pk值");
	return 1;
end

function item_10181(item,count,event,player) --荣誉卷轴小
end
function item_10182(item,count,event,player) --荣誉卷轴中
end
function item_10183(item,count,event,player) --荣誉卷轴大
end

function item_10184(item,count,event,player) --天罡首饰礼盒
	local nrandom = math.random(1,6);
	local njob = player:get_job();
	local itemid = 0;
	local nitem = {
	[1]=4,
	[2]=5;
	[3]=6;
	[4]=7;
	[5]=9;
	[6]=10;
	}
	if player:num_bag_black() >= 1 then
		if njob == 1 then
			itemid = nitem[nrandom] * 10000 + 15;
			player:add_item(itemid,1,0,0,0);
		elseif njob == 2 then
			itemid = nitem[nrandom] * 10000 + 16;
			player:add_item(itemid,1,0,0,0);
		elseif njob == 3 then
			itemid = nitem[nrandom] * 10000 + 17;
			player:add_item(itemid,1,0,0,0);
		end
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足1格");
		return 0;
	end
end

function item_10185(item,count,event,player) --地煞首饰礼盒
	local nrandom = math.random(1,6);
	local njob = player:get_job();
	local itemid = 0;
	local nitem = {
	[1]=4,
	[2]=5;
	[3]=6;
	[4]=7;
	[5]=9;
	[6]=10;
	}
	if player:num_bag_black() >= 1 then
		if njob == 1 then
			itemid = nitem[nrandom] * 10000 + 18;
			player:add_item(itemid,1,0,0,0);
		elseif njob == 2 then
			itemid = nitem[nrandom] * 10000 + 19;
			player:add_item(itemid,1,0,0,0);
		elseif njob == 3 then
			itemid = nitem[nrandom] * 10000 + 20;
			player:add_item(itemid,1,0,0,0);
		end
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足1格");
		return 0;
	end
end

function item_10186(item,count,event,player) --血玉碎片（大）
	local nItem = 40 * count;
	player:set_param(250,player:get_param(250) + nItem,item:GetName(),count);
	player:FinishFeats(15,count);
	player:alert(10,0,0,"血玉碎片 + ".. nItem .. "，当前数量" .. player:get_param(250))
	return count;
end

function item_10187(item,count,event,player)
	local nItem = 5 * count
	player:add_gamemoney(nItem);
	player:alert(10,0,0,"金币 + "..nItem.."，当前数量"..player:get_gamemoney());
	return count;
end

function item_10188(item,count,event,player)
	local nItem = 10 * count
	player:add_gamemoney(nItem);
    player:alert(10,0,0,"金币 + "..nItem.."，当前数量"..player:get_gamemoney());
	return count;
end

function item_10189(item,count,event,player)
	local nItem = 20 * count
	player:add_gamemoney(nItem);
    player:alert(10,0,0,"金币 + "..nItem.."，当前数量"..player:get_gamemoney());
	return count;
end

function item_10190(item,count,event,player)
	local nItem = 50 * count
	player:add_gamemoney(nItem);
    player:alert(10,0,0,"金币 + "..nItem.."，当前数量"..player:get_gamemoney());
	return count;
end

function item_10191(item,count,event,player)
	local nItem = 100 * count
	player:add_gamemoney(nItem);
    player:alert(10,0,0,"金币 + "..nItem.."，当前数量"..player:get_gamemoney());
	return count;
end

function item_10192(item,count,event,player)
	local nItem = 500 * count
	player:add_gamemoney(nItem);
    player:alert(10,0,0,"金币 + "..nItem.."，当前数量"..player:get_gamemoney());
	return count;
end

function item_10193(item,count,event,player)
	local nItem = 1000 * count
	player:add_gamemoney(nItem);
    player:alert(10,0,0,"金币 + "..nItem.."，当前数量"..player:get_gamemoney());
	return count;
end

function item_10194(item,count,event,player)
	local nItem = 5000 * count
	player:add_gamemoney(nItem);
    player:alert(10,0,0,"金币 + "..nItem.."，当前数量"..player:get_gamemoney());
	return count;
end

function item_12010(item,count,event,player)	--祝福油
	if player:check_euqip(-4) == false then
		player:alert(10,0,0,"请穿戴武器后再进行祝福");
		return 0;
	end
	local lucktab = {{100,0,0},{95,0,5},{75,10,15},{50,10,40},{25,10,65},{10,10,80},{5,10,85},{0,10,90},{1,10,89},{0,100,0}};	--{升级概率，不变概率，掉级概率}
	local rand = math.random(1,100);
	local luck = player:get_weapon_luck() + 1;

	if rand <= lucktab[luck][1] then
		if luck > 9 then
			player:alert(10,0,0,"祝福无效，幸运值不变");
			return 1;
		end
		player:alert(10,0,0,"祝福成功，武器幸运值提升");
	elseif rand <= lucktab[luck][1] + lucktab[luck][2] then
		luck = luck - 1;
		player:alert(10,0,0,"祝福无效，幸运值不变");
	else
		luck = luck - 1;
		if luck <= 0 then
			player:alert(10,0,0,"祝福无效，幸运值不变");
			return 1;
		else
			luck = luck - 1;
			player:alert(10,0,0,"祝福失败，武器受诅咒幸运下降");
		end
	end
	player:set_weapon_luck(luck);
	return 1;
end

function item_12024(item,count,event,player)	--超级祝福油
	if player:check_euqip(-4) == false then
		player:alert(10,0,0,"请穿戴武器后再进行祝福");
		return 0;
	end
	local luck = player:get_weapon_luck();
	if luck >= 7 then
		player:alert(10,0,0,"你的武器已被高度祝福，不能使用超级祝福油");
		return 0;
	end
	g_broadcast(13,0,0,"<font color='#00ccff'>"..player:GetName().."</font>使用超级祝福油，武器幸运值大幅提升！");
	player:set_weapon_luck(7);
	return 1;
end


function item_10197(item,count,event,player)
	local nItem = 100 * count
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_10198(item,count,event,player)
	local nItem = 200 * count
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_10199(item,count,event,player)
	local nItem = 300 * count
	player:add_vcoin(nItem);
	player:alert(10,0,0,"元宝 + "..nItem.."，当前数量"..player:get_vcoin());
	return count;
end

function item_10200(item,count,event,player)
	local nItem = 500 * count
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_10201(item,count,event,player)
	local nItem = 500 * count
	player:add_vcoin(nItem);
	player:alert(10,0,0,"元宝 + "..nItem.."，当前数量"..player:get_vcoin());
	return count;
end

function item_10202(item,count,event,player)
    local nItem = 1000 * count
    player:add_vcoin(nItem);
    player:alert(10,0,0,"元宝 + "..nItem.."，当前数量"..player:get_vcoin());
    return count;
end

function item_10203(item,count,event,player)
    local nItem = 100 * count
    player:add_vcoin(nItem);
    player:alert(10,0,0,"元宝 + "..nItem.."，当前数量"..player:get_vcoin());
    return count;
end

function item_10204(item,count,event,player)
    local nItem = 10 * count
    player:add_vcoin(nItem);
    player:alert(10,0,0,"元宝 + "..nItem.."，当前数量"..player:get_vcoin());
    return count;
end

function item_10205(item,count,event,player)
	local nItem = 1 * count
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_10319(item,count,event,player)
	local nItem = 1 * count
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_10206(item,count,event,player)
	local nItem = 5 * count
	player:add_vcoin(nItem);
	player:alert(10,0,0,"元宝 + "..nItem.."，当前数量"..player:get_vcoin());
	return count;
end

function item_10207(item,count,event,player)
	local nItem = 10 * count
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_10208(item,count,event,player)
	local nItem = 20 * count
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_10209(item,count,event,player)
	local nItem = 50 * count
	player:add_vcoin(nItem);
	player:alert(10,0,0,"元宝 + "..nItem.."，当前数量"..player:get_vcoin());
	return count;
end

function item_10210(item,count,event,player)
    local nItem = 1000 * count
    player:add_vcoin_bind(nItem);
    player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
    return count;
end


function item_10274(item,count,event,player)
	count = 1;
	local nvip = player:get_player_type();
    local itemUseLimit = VipLimit.itemUseLimit
    local itemid = item:GetEntryId()
    local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
    local now_times = player:get_param(438);
    if now_times >= maxtimes then
        player:alert(10,0,0,"今日使用次数已达到上限，请提升VIP等级")
        return;
    end
    if maxtimes - now_times < count then
        count = maxtimes - now_times;
    end
    local nItem = 100 * count;
	player:add_gamemoney_bind(nItem);
    now_times = now_times + count;
    player:set_param(438,now_times);
    local x = maxtimes - now_times;
    player:alert(10,0,0,"绑定金币 + "..nItem.."，当前数量"..player:get_gamemoney_bind() - player:get_gamemoney().."，今日剩余可使用次数："..x.."次!");

    UpdateSpecialItemTimes(player);
	return 1;
end

function item_10275(item,count,event,player)
	count = 1;
	local nvip = player:get_player_type();
    local itemUseLimit = VipLimit.itemUseLimit
    local itemid = item:GetEntryId()
    local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
    local now_times = player:get_param(438);
    if now_times >= maxtimes then
        player:alert(10,0,0,"今日使用次数已达到上限，请提升VIP等级")
        return;
    end
    if maxtimes - now_times < count then
        count = maxtimes - now_times;
    end
    local nItem = 500 * count;
	player:add_gamemoney_bind(nItem);
    now_times = now_times + count;
    player:set_param(438,now_times);
    local x = maxtimes - now_times;
    player:alert(10,0,0,"绑定金币 + "..nItem.."，当前数量"..player:get_gamemoney_bind() - player:get_gamemoney().."，今日剩余可使用次数："..x.."次!");

    UpdateSpecialItemTimes(player);
	return 1;
end

function item_10276(item,count,event,player)
	count = 1;
	local nvip = player:get_player_type();
    local itemUseLimit = VipLimit.itemUseLimit
    local itemid = item:GetEntryId()
    local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
    local now_times = player:get_param(438);
    if now_times >= maxtimes then
        player:alert(10,0,0,"今日使用次数已达到上限，请提升VIP等级")
        return;
    end
    if maxtimes - now_times < count then
        count = maxtimes - now_times;
    end
    local nItem = 1000 * count;
	player:add_gamemoney_bind(nItem);
    now_times = now_times + count;
    player:set_param(438,now_times);
    local x = maxtimes - now_times;
    player:alert(10,0,0,"绑定金币 + "..nItem.."，当前数量"..player:get_gamemoney_bind() - player:get_gamemoney().."，今日剩余可使用次数："..x.."次!");

    UpdateSpecialItemTimes(player);
	return 1;
end

function item_10277(item,count,event,player)
	count = 1;
	local nvip = player:get_player_type();
    local itemUseLimit = VipLimit.itemUseLimit
    local itemid = item:GetEntryId()
    local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
    local now_times = player:get_param(438);
    if now_times >= maxtimes then
        player:alert(10,0,0,"今日使用次数已达到上限，请提升VIP等级")
        return;
    end
    if maxtimes - now_times < count then
        count = maxtimes - now_times;
    end
    local nItem = 10000 * count;
	player:add_gamemoney_bind(nItem);
    now_times = now_times + count;
    player:set_param(438,now_times);
    local x = maxtimes - now_times;
    player:alert(10,0,0,"绑定金币 + "..nItem.."，当前数量"..player:get_gamemoney_bind() - player:get_gamemoney().."，今日剩余可使用次数："..x.."次!");

    UpdateSpecialItemTimes(player);
	return 1;
end

function item_10285(item,count,event,player)
--	count = 1;
	local nvip = player:get_player_type();
    local itemUseLimit = VipLimit.itemUseLimit
    local itemid = item:GetEntryId()
    local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
    local now_times = player:get_param(438);
    if now_times >= maxtimes then
        player:alert(10,0,0,"今日使用次数已达到上限，请提升VIP等级")
        return;
    end
    if maxtimes - now_times < count then
        count = maxtimes - now_times;
    end
    local nItem = 500000 * count;
	player:add_gamemoney_bind(nItem);
    now_times = now_times + count;
    player:set_param(438,now_times);
    local x = maxtimes - now_times;
    player:alert(10,0,0,"绑定金币 + "..nItem.."，当前数量"..player:get_gamemoney_bind() - player:get_gamemoney().."，今日剩余可使用次数："..x.."次!");

    UpdateSpecialItemTimes(player);
	return count;
end
function item_10286(item,count,event,player)
--	count = 1;
	local nvip = player:get_player_type();
    local itemUseLimit = VipLimit.itemUseLimit
    local itemid = item:GetEntryId()
    local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
    local now_times = player:get_param(438);
    if now_times >= maxtimes then
        player:alert(10,0,0,"今日使用次数已达到上限制，请提升VIP等级")
        return;
    end
    if maxtimes - now_times < count then
        count = maxtimes - now_times;
    end
    local nItem = 1000000 * count;
	player:add_gamemoney_bind(nItem);
    now_times = now_times + count;
    player:set_param(438,now_times);
    local x = maxtimes - now_times;
    player:alert(10,0,0,"绑定金币 + "..nItem.."，当前数量"..player:get_gamemoney_bind() - player:get_gamemoney().."，今日剩余可使用次数："..x.."次!");

    UpdateSpecialItemTimes(player);
	return count;
end
function item_10287(item,count,event,player)
--	count = 1;
	local nvip = player:get_player_type();
    local itemUseLimit = VipLimit.itemUseLimit
    local itemid = item:GetEntryId()
    local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
    local now_times = player:get_param(438);
    if now_times >= maxtimes then
        player:alert(10,0,0,"今日使用次数已达到上限制，请提升VIP等级")
        return;
    end
    if maxtimes - now_times < count then
        count = maxtimes - now_times;
    end
    local nItem = 3000000 * count;
	player:add_gamemoney_bind(nItem);
    now_times = now_times + count;
    player:set_param(438,now_times);
    local x = maxtimes - now_times;
    player:alert(10,0,0,"绑定金币 + "..nItem.."，当前数量"..player:get_gamemoney_bind() - player:get_gamemoney().."，今日剩余可使用次数："..x.."次!");

    UpdateSpecialItemTimes(player);
	return count;
end
function item_10288(item,count,event,player)
--  count = 1;
    local nvip = player:get_player_type();
    local itemUseLimit = VipLimit.itemUseLimit
    local itemid = item:GetEntryId()
    local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
    local now_times = player:get_param(438);
    if now_times >= maxtimes then
        player:alert(10,0,0,"今日使用次数已达到上限制，请提升VIP等级")
        return;
    end
    if maxtimes - now_times < count then
        count = maxtimes - now_times;
    end
    local nItem = 5000000 * count;
    player:add_gamemoney_bind(nItem);
    now_times = now_times + count;
    player:set_param(438,now_times);
    local x = maxtimes - now_times;
    player:alert(10,0,0,"绑定金币 + "..nItem.."，当前数量"..player:get_gamemoney_bind() - player:get_gamemoney().."，今日剩余可使用次数："..x.."次!");

    UpdateSpecialItemTimes(player);
    return count;
end

function item_12033(item,count,event,player) ---100W金币
   local gold = 1000000 * count;
   player:add_gamemoney(gold);
   player:alert(10,0,0,"金币 + "..gold.."，当前数量"..player:get_gamemoney() );
   return count;
end





function item_10195(item,count,event,player) --修炼石
	local nItem = 500 * count;
	player:set_param(276,player:get_param(276) + nItem);
	player:alert(10,0,0,"修炼石碎片 + "..nItem.."，当前数量"..player:get_param(276).."颗");
	return count;
end

function item_10196(item,count,event,player) --公会礼包
	if player:num_bag_black() >= 3 then
		player:add_item(10064,1,1,0,0);
		player:add_item(10160,1,1,0,0);
		player:add_item(10271,1,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足3格");
		return 0;
	end
end

function item_10213(item,count,event,player) --低级悬赏
	if player:get_param(292) < 5 then
		if player:get_param(291) == 0 then
			player:set_param(291,1);
			player:get_param(292,player:get_param(292) + 1);
			player:set_param(293,500);
			player:set_param(294,0);
			player:set_task_state(101,1);
			player:push_task_data(1,1);
			return 1;
		else
			player:alert(19,0,0,"对不起，一次只允许接一种悬赏任务");
			return 0;
		end
	else
		player:alert(19,0,0,"对不起，您今日不可在接受悬赏任务了")
		return 0;
	end
end

function item_10214(item,count,event,player) --中级悬赏
	if player:get_param(292) < 5 then
		if player:get_param(291) == 0 then
			player:set_param(291,1);
			player:get_param(292,player:get_param(292) + 1);
			player:set_param(293,750);
			player:set_param(294,0);
			player:set_task_state(101,1);
			player:push_task_data(1,1);
			return 1;
		else
			player:alert(19,0,0,"对不起，一次只允许接一种悬赏任务");
			return 0;
		end
	else
		player:alert(19,0,0,"对不起，您今日不可在接受悬赏任务了")
		return 0;
	end
end

function item_10215(item,count,event,player) --高级悬赏
	if player:get_param(292) < 5 then
		if player:get_param(291) == 0 then
			player:set_param(291,1);
			player:get_param(292,player:get_param(292) + 1);
			player:set_param(293,1000);
			player:set_param(294,0);
			player:set_task_state(101,1);
			player:push_task_data(1,1);
			return 1;
		else
			player:alert(19,0,0,"对不起，一次只允许接一种悬赏任务");
			return 0;
		end
	else
		player:alert(19,0,0,"对不起，您今日不可在接受悬赏任务了")
		return 0;
	end
end

function item_10216(item,count,event,player) --英雄礼包
	if player:get_param(324) == 0 then
		if player:get_level() >= 80 then
			player:alert(20,0,0,"恭喜，成功开启了一次英雄礼包，剩余开启次数2次!")
			player:set_param(324,player:get_param(324) + 1);
		end
		return 0;
	elseif player:get_param(324) == 1 then
		if player:get_level() >= 85 then
			player:alert(20,0,0,"恭喜，成功开启了一次英雄礼包，剩余开启次数1次!")
			player:set_param(324,player:get_param(324) + 1);
		end
		return 0;
	elseif player:get_param(324) == 2 then
		if player:get_param(258) >= 2 then
			player:alert(20,0,0,"恭喜，成功开启了一次英雄礼包，剩余开启次数0次!")
			player:set_param(324,player:get_param(324) + 1);
			return 1;
		else
			return 0;
		end
	else
		player:alert(19,0,0,"对不起，您的礼包已经达到开启上限，已被回收！")
		return 1;
	end
end

function item_10217(item,count,event,player) --攻城礼盒
	local nItem = 100;
	local Expr = 20000000;
	player:add_gamemoney(nItem);
	player:alert(20,0,0,"金币 + "..nItem);
	player:add_exp(Expr);
	--player:alert(10,0,0,"经验值 + "..Expr);
	return count;
end

function item_10219(item,count,event,player) --周六攻城礼包
	local nItem = 5000 * count
	player:add_vcoin(nItem);
	player:alert(10,0,0,"元宝 + "..nItem.."，当前持有："..player:get_vcoin());
	return count;
end

function item_10228(item,count,event,player)--神秘钥匙(串)
	if player:num_bag_black() >= 1 then
		player:add_item(10068,3,1,0,0);     			 --神秘钥匙
		-- player:alert(10,0,0,"获得【神秘钥匙】 * 3");
		return 1;
	else
		player:alert(10,0,0,"您的背包空间不足1格");
		return 0;
	end
end

function item_10229(item,count,event,player)--封神守卫令
	if player:GetMapId() == 26 then
		for i=1,15 do
			if bitget(player:get_param(461),i) == 0 then
				player:set_param(463,player:get_param(463) + 1);
				local obj = {};
				obj.count = player:get_param(463);
				player:SendPacketToSelf(1815,0,encode(obj));
				player:alert(20,0,0,"封神守卫可召唤数量+1");
				return 1;
			end
		end
		player:alert(21,0,0,"对不起,当前封神台已经没有位置了");
		return 0;
	else
		player:alert(21,0,0,"只有在封神台地图才可以使用");
		return 0;
	end
end

function item_10230(item,count,event,player)--神兽卷轴
	if player:get_job() == 3 then
		if player:gen_has(7001) > 0 or player:gen_has(7002) > 0 or player:gen_has(7003) > 0 or player:gen_has(7004) > 0 or player:gen_has(7005) > 0 or player:gen_has(7006) > 0 or player:gen_has(7007) > 0 then
			if player:has_skill(30) >= 5 then
				player:SummonLevelUp(9);
				return 1;
			elseif player:has_skill(30) >= 4 then
				player:SummonLevelUp(8);
				return 1;
			elseif player:has_skill(30) >= 3 then
				player:SummonLevelUp(7);
				return 1;
			elseif player:has_skill(30) >= 2 then
				player:SummonLevelUp(6);
				return 1;
			elseif player:has_skill(30) >= 1 then
				player:SummonLevelUp(5);
				return 1;
			else
				player:alert(21,0,0,"对不起,您还没有学会召唤神兽!");
				return 0;
			end
		else
			player:alert(21,0,0,"对不起,您还没有召唤神兽");
			return 0;
		end
	else
		player:alert(21,0,0,"对不起,只有道士职业才可使用");
		return 0;
	end
end

function item_10231(item,count,event,player)--投资礼盒
	if player:num_bag_black() >= 3 then
		player:add_item(10241,1,1,0,0);
		player:add_item(10162,1,1,0,0);
		player:add_item(10273,1,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足3格,无法领取奖励!");
		return 0;
	end
end

function item_10232(item,count,event,player)--四品财宝箱
	return 1;
end

function item_10233(item,count,event,player)--回城神石
	player:go_home();
	return 1;
end

function item_10234(item,count,event,player)--随机传送石
	if player:gen_has(5100) > 0 then
		player:alert(21,0,0,"对不起,押镖期间禁止使用随机传送石!")
		return 0;
	else
	    local ff = player:randomthismap(0);
        if ff then
            return 1;
        else
            return 0;
        end
	end
end


function item_12013(item,count,event,player) --金砖大

end


function item_10242(item,count,event,player) --魂珠碎片(大)
	local nItem = 100 * count;
	player:set_param(247,player:get_param(247) + nItem,item:GetName(),count);
	player:FinishFeats(18, count)
    player:alert(10,0,0,"魂珠碎片 + "..nItem.."，当前数量"..player:get_param(247))
	return count;
end

function item_10243(item,count,event,player)  --魂珠碎片(中)
	local nItem = 200 * count;
	player:set_param(247,player:get_param(247) + nItem,item:GetName(),count);
	player:FinishFeats(18, count)
    player:alert(10,0,0,"魂珠碎片 + "..nItem.."，当前数量"..player:get_param(247))
	return count;
end

function item_10244(item,count,event,player) --魂珠碎片(大)
	local nItem = 400 * count;
	player:set_param(247,player:get_param(247) + nItem,item:GetName(),count);
	player:alert(10,0,0,"魂珠碎片 + ".. nItem .. "，当前数量" .. player:get_param(247))
	player:FinishFeats(18, count)
    player:alert(10,0,0,"魂珠碎片 + "..nItem.."，当前数量"..player:get_param(247))
	return count;
end

function item_10302(item,count,event,player) --转生等级经验玉(小)
    local nNewValue = count*5;
    if player:get_level() >= 70 then
        player:set_param(259,player:get_param(259) + nNewValue,item:GetName(),count);
        player:alert(10,0,0,"修为值 + ".. nNewValue .. "，当前修为值" .. player:get_param(259))
        player:SendZhuanShengInfo();
        return count;
    else
        player:alert(21,0,0,"对不起，您的级别不足70无法使用!!!")
        return 0;
    end
end

function item_10245(item,count,event,player) --转生等级经验玉(小)
    local nNewValue = 10000 * count;
    if player:get_level() >= 70 then
        player:set_param(259,player:get_param(259) + nNewValue,item:GetName(),count);
        player:alert(10,0,0,"修为值 + ".. nNewValue .. "，当前修为值" .. player:get_param(259))
        player:SendZhuanShengInfo();
        return count;
    else
        player:alert(21,0,0,"对不起，您的级别不足70无法使用!!!")
        return 0;
    end
end

function item_10246(item,count,event,player) --转生等级经验玉(中)
    local nvip = player:get_player_type();
    local itemUseLimit = VipLimit.itemUseLimit
    local itemid = item:GetEntryId()
    local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
    local now_times = player:get_param(619);
    if now_times >= maxtimes then
        player:alert(10,0,0,"今日使用次数已达到上限，请提升VIP等级")
        return;
    end
    if maxtimes - now_times < count then
        count = maxtimes - now_times;
    end
    local nNewValue = 50000 * count;
    if player:get_level() >= 70 then
        player:set_param(259,player:get_param(259) + nNewValue,item:GetName(),count);
        player:SendZhuanShengInfo();
        now_times = now_times + count;
        player:set_param(619,now_times);
        local x = maxtimes - now_times;
        player:alert(10,0,0,"修为值 + "..nNewValue.."，当前修为值" .. player:get_param(259).."，今日剩余可使用次数："..x.."次!")

        local item_obj = {};
        item_obj.id = 10246;
        item_obj.times = now_times;
        player:SendPacketToSelf(1726,0,encode(item_obj));
        return count;
    else
        player:alert(21,0,0,"对不起，您的级别不足70无法使用!!!")
        return 0;
    end
end

function item_10247(item,count,event,player) --转生等级经验玉(大)
    local nvip = player:get_player_type();
    if nvip <= 8 then
        local itemUseLimit = VipLimit.itemUseLimit
        local itemid = item:GetEntryId()
        local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
        local now_times = player:get_param(620);
        if now_times >= maxtimes then
            player:alert(10,0,0,"今日使用次数已达到上限，请提升VIP等级")
            return;
        end
        if maxtimes - now_times < count then
            count = maxtimes - now_times;
        end
        local nNewValue = 500000 * count;
        if player:get_level() >= 70 then
            player:set_param(259,player:get_param(259) + nNewValue,item:GetName(),count);
            player:SendZhuanShengInfo();
            now_times = now_times + count;
            player:set_param(620,now_times);
            local x = maxtimes - now_times;
            player:alert(10,0,0,"修为值 + "..nNewValue.."，当前修为值" .. player:get_param(259).."，今日剩余可使用次数："..x.."次!")

            local item_obj = {};
            item_obj.id = 10247;
            item_obj.times = now_times;
            player:SendPacketToSelf(1726,0,encode(item_obj));
            return count;
        else
            player:alert(21,0,0,"对不起，您的级别不足70无法使用!!!")
            return 0;
        end
    else
        local nNewValue = 500000 * count;
        if player:get_level() >= 70 then
            player:set_param(259,player:get_param(259) + nNewValue,item:GetName(),count);
            player:SendZhuanShengInfo();
            player:alert(10,0,0,"修为值 + "..nNewValue.."，当前修为值" .. player:get_param(259))
            return count;
        else
            player:alert(21,0,0,"对不起，您的级别不足70无法使用!!!")
            return 0;
        end
    end
end

function item_12025(item, count, event, player) --神级转生丹
    local nvip = player:get_player_type();
    local maxtimes = 0;
    local nNewValue = 1000000 * count
    if player:get_level() >= 70 then
        player:set_param(259,player:get_param(259) + nNewValue,item:GetName(),count)
 --     player:alert(10,0,0,"修为值 + ".. nNewValue .. "，当前修为值" .. player:get_param(259))
        player:SendZhuanShengInfo()
        player:alert(10,0,0,"修为值 + "..nNewValue.."，当前修为值" .. player:get_param(259))
        return count
    else
        player:alert(21,0,0,"对不起，您的级别不足70无法使用!!!")
        return 0
    end
end

function item_10248(item,count,event,player) --极品封魔卡
	local itemtable = {
	[1]={17000,"青铜兽"},
	[2]={17001,"钨钢锤手"},
	[3]={17002,"刀斧铜人"},
	[4]={17003,"弩弓射手"},
	[5]={17004,"变异青铜兽"},
	[6]={17005,"金刚人"},
	[7]={17006,"机关巨兽"},
	[8]={17014,"牛魔将军"},
	[9]={17015,"牛魔战将"},
	[10]={17016,"牛头魔"},
	[11]={17017,"牛魔弓箭手"},
	[12]={17018,"变异牛魔将军"},
	[13]={17019,"牛魔长老"},
	[14]={17020,"牛魔王"},
	[15]={17028,"楼兰骨魔"},
	[16]={17029,"楼兰镰刀手"},
	[17]={17030,"楼兰沙蝎"},
	[18]={17031,"楼兰骨弓"},
	[19]={17032,"变异楼兰护卫"},
	[20]={17033,"楼兰毒龙"},
	[21]={17034,"楼兰巨魔王"},
	[22]={17042,"工兵蚂蚁"},
	[23]={17043,"剧毒蚂蚁"},
	[24]={17044,"蚂蚁战士"},
	[25]={17045,"飞天蚂蚁"},
	[26]={17046,"变异蚂蚁战士"},
	[27]={17047,"蚁皇"},
	[28]={17048,"死亡蚁后"},
	[29]={17056,"红蛇妖"},
	[30]={17057,"黑蛇妖"},
	[31]={17058,"蛇魔护卫"},
	[32]={17059,"蛇魔祭祀"},
	[33]={17060,"变异蛇魔卫士"},
	[34]={17061,"蛇魔将军"},
	[35]={17062,"美杜莎"},
	[36]={17070,"通天战士"},
	[37]={17071,"夺魄鸟"},
	[38]={17072,"招魂使"},
	[39]={17073,"兽骑统领"},
	[40]={17074,"变异烈焰使"},
	[41]={17075,"摘星将军"},
	[42]={17076,"通天教主"},
	[43]={17084,"英雄战士"},
	[44]={17085,"英雄蛮王"},
	[45]={17086,"英雄之力"},
	[46]={17087,"英雄祭祀"},
	[47]={17088,"变异远古魔像"},
	[48]={17089,"齐天大圣"},
	[49]={17090,"纳什男爵"},
	[50]={17098,"铁血猛魔锤手"},
	[51]={17099,"铁血兽兵"},
	[52]={17100,"铁血兽骑统领"},
	[53]={17101,"铁血兽骑弓手"},
	[54]={17102,"变异嗜血小鬼"},
	[55]={17103,"幽影将军"},
	[56]={17104,"铁血魔君"},
	[57]={17112,"修罗战士"},
	[58]={17113,"修罗女巫"},
	[59]={17114,"修罗战将"},
	[60]={17115,"修罗枪兵"},
	[61]={17116,"变异阿修罗"},
	[62]={17117,"修罗长老"},
	[63]={17118,"天之阿修罗神"},
	[64]={17126,"熔浆火焰花"},
	[65]={17127,"熔岩巨人"},
	[66]={17128,"熔岩战将"},
	[67]={17129,"熔岩射手"},
	[68]={17130,"变异熔岩人"},
	[69]={17131,"熔岩工匠"},
	[70]={17132,"邪恶熔岩魔头"},
	[71]={17140,"雪域魔人"},
	[72]={17141,"雪域冰魔"},
	[73]={17142,"雪域冰凤凰"},
	[74]={17143,"雪域冰精灵"},
	[75]={17144,"变异冰魔守护"},
	[76]={17145,"雪域魔王"},
	[77]={17146,"天之雪域魔王"}
	};
	local nrandom = math.random(1,77);
	player:add_item(itemtable[nrandom][1],1,1,0,0);
	player:alert(20,0,0,"恭喜你获得了"..itemtable[nrandom][2]);
	return 1;
end

function item_12026(item,count,event,player) --直升一级丹
	if player:get_level() > 75 then
		local Expr = 20000000;
		player:add_exp(Expr);
	else
		player:set_level(player:get_level() + 1);
		player:alert(10,0,0,"恭喜你的级别提升了一级!");
	end
	return 1;
end

function item_12032(item,count,event,player) --普通直升一级丹
    if player:get_level() > 65 then
        local Expr = 10000000;
        player:add_exp(Expr);
    else
        player:set_level(player:get_level() + 1);
        player:alert(10,0,0,"恭喜你的级别提升了一级!");
    end
    return 1;
end


function item_10250(item,count,event,player) --修炼卷轴(小)
	local nItem = 500 * count;
	player:set_param(256,player:get_param(256) + nItem);
	player:alert(10,0,0,"修炼值 + "..nItem.."，当前数量"..player:get_param(256).."颗");
	return count;
end

function item_10251(item,count,event,player) --8888元宝
	local nItem = 8888 * count;
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_10252(item,count,event,player) --高级BOSS召唤令
    local MapId = player:GetMapId();
    if MapId ~= 17 then
       player:alert(10,0,0,"BOSS召唤令仅能在天星城使用!");
       return 0
    end
    local nX = player:GetX();
    local ny = player:GetY();
    local GetName = player:GetName();

	local tMonList = {
			--ID,概率,名字,模型ID
			{2147,8,"拜火教徒",9038},
			{2148,12,"幽冥使者",9032},
			{2149,16,"食尸将军",9040},
			{2150,40,"移山魔王",9031},
			{2151,16,"魔狱公爵",9035},
			{2152,8,"尸毒傀儡",9017},
	}

    local nTotalRate = 0
    local nMonsterCount = #tMonList
    for i = 1, nMonsterCount do
        nTotalRate = nTotalRate + tMonList[i][2]
    end
    local nNowRate = math.random(1,nTotalRate)
    local nMonsterID
    local tNowMonster
    for i = 1, nMonsterCount do
        tNowMonster = tMonList[i]
        if nNowRate < tNowMonster[2] then
            break
        end
        nNowRate = nNowRate - tNowMonster[2]
    end
    local obj = {};
    obj[2] = nX;
    obj[3] = ny;
    --obj[4] = 8796;
    obj[4] = tNowMonster[1];
    obj[5] = tNowMonster[4];
    obj[6] = tNowMonster[3];
    obj[7] = 1;
    obj[19] = 4;
    player:mon_gen(encode(obj));
    g_broadcast(13,0,0,"嘛咪嘛咪轰！<font color='#00ccff'>"..GetName.."</font>在<font color='#00ccff'>"..player:get_mapname(MapId)
                           .."</font>召唤出了BOSS【<font color='#ff0000'>"..tNowMonster[3].."</font>】！！");
    return 1;
end
function item_10253(item,count,event,player) --超级BOSS召唤令
    local MapId = player:GetMapId();
    if MapId ~= 17 then
       player:alert(10,0,0,"BOSS召唤令仅能在天星城使用!");
       return 0
    end
    local nX = player:GetX();
    local ny = player:GetY();
    local GetName = player:GetName();

	local tMonList = {
				--ID,概率,名字,模型ID
		{2153,35,"驭雷鹰王",9039},
		{2154,12,"吞月凶兽",9044},
		{2155,12,"阴烛魔王",9029},
		{2156,15,"裁火朱雀",9043},
		{2157,14,"诛神者",9034},
		{2158,3,"刑天魂",9024},
		{2159,3,"殉道者",9014},
		{2160,2,"上古牛魔神",9015},
		{2161,2,"嗜血大祭司",9016},
		{2162,1,"踏炎金晶兽",9021},
	}
    local nTotalRate = 0
    local nMonsterCount = #tMonList
    for i = 1, nMonsterCount do
        nTotalRate = nTotalRate + tMonList[i][2]
    end
    local nNowRate = math.random(1,nTotalRate)
    local nMonsterID
    local tNowMonster
    for i = 1, nMonsterCount do
        tNowMonster = tMonList[i]
        if nNowRate < tNowMonster[2] then
            break
        end
        nNowRate = nNowRate - tNowMonster[2]
    end
    local obj = {};
    obj[2] = nX;
    obj[3] = ny;
    --obj[4] = 8796;
    obj[4] = tNowMonster[1];
    obj[5] = tNowMonster[4];
    obj[6] = tNowMonster[3];
    obj[7] = 1;
    obj[19] = 4;
    player:mon_gen(encode(obj));
    g_broadcast(13,0,0,"嘛咪嘛咪嘛咪轰！<font color='#00ccff'>"..GetName.."</font>在<font color='#00ccff'>"..player:get_mapname(MapId)
                           .."</font>召唤出了超级BOSS【<font color='#ff0000'>"..tNowMonster[3].."</font>】！！");
    return 1;
end


function item_10256(item,count,event,player)
	local nItem = 1 * count;
	player:set_param(217,player:get_param(217) + nItem);
	player:alert(10,0,0,"符文碎片 + "..nItem.."，当前数量"..player:get_param(217).."颗");
	return count;
end

function item_10258(item,count,event,player)
	player:set_status(101,14400,200,7);
	player:alert(10,0,0,"获得4小时双倍经验时间");
	return 1;
end

function item_10259(item,count,event,player)
	player:set_status(101,28800,200,7);
	player:alert(10,0,0,"获得8小时双倍经验时间");
	return 1;
end

function item_10260(item,count,event,player)
	player:set_status(101,14400,300,7);
	player:alert(10,0,0,"获得4小时三倍经验时间");
	return 1;
end

function item_10261(item,count,event,player)
	player:set_status(101,28800,300,7);
	player:alert(10,0,0,"获得8小时三倍经验时间");
	return 1;
end

function item_10262(item,count,event,player)
	player:set_status(101,7200,200,7);
	player:alert(10,0,0,"获得2小时双倍经验时间");
	return 1;
end

function item_10263(item,count,event,player)
	player:set_status(101,7200,300,7);
	player:alert(10,0,0,"获得2小时三倍经验时间");
	return 1;
end

function item_12027(item,count,event,player)
    player:set_status(101,7200,800,7);
    player:alert(10,0,0,"获得2小时八倍经验时间");
    return 1;
end

function item_10264(item,count,event,player) -- 100绑定元宝
	local nItem = 100 * count;
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_10265(item,count,event,player) -- 200绑定元宝
	local nItem = 200 * count;
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_10266(item,count,event,player) -- 500绑定元宝
	local nItem = 500 * count;
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_10267(item,count,event,player) -- 1000绑定元宝
	local nItem = 1000 * count;
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_12020(item,count,event,player) -- 1000绑定元宝
	local nItem = 1 * count;
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_10268(item,count,event,player) --挖宝钥匙
	--player:openpanel(54);
	return 0;
end

function item_10269(item,count,event,player) --屠龙礼包
	local nItem = math.random(2000,5000);
	local job = player:get_job();
	player:add_vcoin(nItem);
	player:set_status(112,0,100,5);
	player:alert(20,0,0,"恭喜你激活屠龙勇士称号");
	return 1;
end


function item_10278(item,count,event,player) --10000绑定元宝
	local nItem = 10000 * count
	player:add_vcoin_bind(nItem);
	return count;
end


function item_10280(item,count,event,player) -- 10绑定元宝
	local nItem = 10*count;
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_10281(item,count,event,player) -- 50绑定元宝
	local nItem = 50*count;
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end


function item_10283(item,count,event,player) --英雄之魂宝箱
	local target = {};
	local arr = {};
	local obj = {};
	obj.type = 0;

	target = {};
	target.index = 1;
	target.itemId = 10316;
	target.count = 5;
	table.insert(arr,target);

	target = {};
	target.index = 2;
	target.itemId = 10318;
	target.count = 5;
	table.insert(arr,target);

	obj.list = arr;
	player:SendPacketToSelf(3211,0,encode(obj));
	print(encode(obj))
	-- player:openpanel(114);
end


function item_10284(item,count,event,player) -- 2888绑定元宝
	local nItem = 2888 * count;
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_10320(item,count,event,player) --金鸡雕像
	if player:num_bag_black(0) < 1 then
        player:alert(21,0,0,"背包空间不足，请及时清理");  
        return 0;
    end
	--类型（0物品1金币2绑金3经验29boss积分100绑元101元宝，奖励id，数量，权重,绑定（1绑定0非绑),公告标记,公告字符串)
	local bxtbl = {{0,10152,1,593,1,1,"魂珠碎片(中)"},{0,10165,1,74,1,1,"特戒碎片(中)"},{0,10246,1,889,1,1,"高级转生丹"},{0,10154,1,593,1,1,"宝石碎片(中)"},{0,40101,20,1185,1,0,"羽毛"},{0,40902,10,1185,1,1,"坐骑丹"},{0,10319,200,1185,1,0,"绑元"},{0,10186,20,1185,1,0,"血玉碎片(大)"},{0,10287,1,889,1,0,"金砖(大)"},{0,40901,1,1111,1,0,"熔炼石"},{0,12014,1,1111,1,0,"副本卷轴"}};
	local n_rand = math.random(1,10000);
	
	local nAllItemCount = #bxtbl;
    local now_gailv = 0;
    for j = 1, nAllItemCount do
    	local nowCfg = bxtbl[j];
        now_gailv = now_gailv + nowCfg[4];
        if n_rand <= now_gailv then
        	new_add_item(player,nowCfg[1],nowCfg[2],nowCfg[3],nowCfg[5]);
        	player:alert(10,0,0,"获得"..nowCfg[7] .. "x" .. nowCfg[3]);  
            if nowCfg[6] == 1 then
            	g_broadcast(15,0,0,"【欢度元旦】<font color='#00ccff'>"..player:GetName().."</font>运气不错，打开金鸡获得"..nowCfg[7]);
            end
            return 1
        end
    end
    return 0
end

function item_10321(item,count,event,player) --银鸡雕像
	if player:num_bag_black(0) < 1 then
        player:alert(21,0,0,"背包空间不足，请及时清理");  
        return 0;
    end
	--类型（0物品1金币2绑金3经验29boss积分100绑元101元宝，奖励id，数量，权重,绑定（1绑定0非绑),公告标记,公告字符串)
	local bxtbl = {{0,10153,1,732,1,0,"宝石碎片(小)"},{0,10151,1,976,1,0,"魂珠碎片(小)"},{0,10302,99,1220,1,0,"转生修为丹"},{0,10287,1,1829,1,0,"金砖(大)"},{0,40901,1,976,1,0,"熔炼石"},{0,12014,1,1220,1,0,"副本卷轴"},{0,10186,1,1220,1,0,"血玉碎片(大)"},{0,10148,1,976,1,0,"血玉碎片(中)"},{0,40101,5,732,1,0,"羽毛"},{0,40902,1,122,1,0,"坐骑丹"}};
	local n_rand = math.random(1,10000);
	
	local nAllItemCount = #bxtbl;
    local now_gailv = 0;
    for j = 1, nAllItemCount do
    	local nowCfg = bxtbl[j];
        now_gailv = now_gailv + nowCfg[4];
        if n_rand <= now_gailv then
        	new_add_item(player,nowCfg[1],nowCfg[2],nowCfg[3],nowCfg[5]);
            player:alert(10,0,0,"获得"..nowCfg[7] .. "x" .. nowCfg[3]); 
            if nowCfg[6] == 1 then
            	g_broadcast(15,0,0,"【欢度元旦】<font color='#00ccff'>"..player:GetName().."</font>运气不错，打开银鸡获得"..nowCfg[7]);
            end
            return 1
        end
    end
    return 0
end

function item_12059(item,count,event,player) --元宵
	if player:num_bag_black(0) < 1 then
        player:alert(21,0,0,"背包空间不足，请及时清理");  
        return 0;
    end
	--类型（0物品1金币2绑金3经验29boss积分100绑元101元宝，奖励id，数量，权重,绑定（1绑定0非绑),公告标记,公告字符串)
	local bxtbl = {{0,10411,1,10,1,1,"高级转生丹"},{0,10408,1,5,1,1,"魂珠碎片(中)"},{0,10410,1,8,1,1,"宝石碎片(中)"},{0,10165,1,1,1,1,"特戒碎片(中)"},{0,10413,1,12,1,1,"BOSS积分精魄"},{0,10267,1,5,1,1,"1000绑元"},{0,10266,1,15,1,0,"500绑元"},{0,10262,1,20,1,0,"双倍经验(2小时)"},{0,40902,10,5,1,0,"坐骑丹"},{0,40101,10,15,1,0,"羽毛"},{0,10287,1,8,1,0,"金砖(大)"},{0,12014,1,5,1,0,"副本卷轴"},{0,40901,1,10,1,0,"熔炼石"}};
	local n_rand = math.random(1,119);
	
	local nAllItemCount = #bxtbl;
    local now_gailv = 0;
    for j = 1, nAllItemCount do
    	local nowCfg = bxtbl[j];
        now_gailv = now_gailv + nowCfg[4];
        if n_rand <= now_gailv then
        	new_add_item(player,nowCfg[1],nowCfg[2],nowCfg[3],nowCfg[5]);
        	player:alert(10,0,0,"获得"..nowCfg[7] .. "x" .. nowCfg[3]);  
            if nowCfg[6] == 1 then
            	g_broadcast(15,0,0,"【欢庆元宵节】<font color='#00ccff'>"..player:GetName().."</font>运气不错，打开元宵获得"..nowCfg[7]);
            end
            return 1
        end
    end
    return 0
end

function item_12060(item,count,event,player) --巧克力
	if player:num_bag_black(0) < 1 then
        player:alert(21,0,0,"背包空间不足，请及时清理");  
        return 0;
    end
	--类型（0物品1金币2绑金3经验29boss积分100绑元101元宝，奖励id，数量，权重,绑定（1绑定0非绑),公告标记,公告字符串)
	local bxtbl = {{0,10411,1,10,1,1,"高级转生丹"},{0,10408,1,5,1,1,"魂珠碎片(中)"},{0,10410,1,8,1,1,"宝石碎片(中)"},{0,10165,1,1,1,1,"特戒碎片(中)"},{0,10413,1,12,1,1,"BOSS积分精魄"},{0,10267,1,5,1,1,"1000绑元"},{0,10266,1,15,1,0,"500绑元"},{0,10262,1,20,1,0,"双倍经验(2小时)"},{0,40902,10,5,1,0,"坐骑丹"},{0,40101,10,15,1,0,"羽毛"},{0,10287,1,8,1,0,"金砖(大)"},{0,12014,1,5,1,0,"副本卷轴"},{0,40901,1,10,1,0,"熔炼石"}};
	local n_rand = math.random(1,119);
	
	local nAllItemCount = #bxtbl;
    local now_gailv = 0;
    for j = 1, nAllItemCount do
    	local nowCfg = bxtbl[j];
        now_gailv = now_gailv + nowCfg[4];
        if n_rand <= now_gailv then
        	new_add_item(player,nowCfg[1],nowCfg[2],nowCfg[3],nowCfg[5]);
        	player:alert(10,0,0,"获得"..nowCfg[7] .. "x" .. nowCfg[3]);  
            if nowCfg[6] == 1 then
            	g_broadcast(15,0,0,"【情人节快乐】<font color='#00ccff'>"..player:GetName().."</font>运气不错，打开情人节巧克力获得"..nowCfg[7]);
            end
            return 1
        end
    end
    return 0
end

function item_10324(item,count,event,player) --高级轮回丹
	local now_fen = player:get_param(775);
	local add_fen = 300000 * count;
	now_fen = now_fen + add_fen;
	player:set_param(775, now_fen,item:GetName(),count);
	player:alert(10,0,0,"轮回修为 + "..add_fen.."，当前修为" .. player:get_param(775))
	return count;
end

function item_10325(item,count,event,player) --超级级轮回丹
	local now_fen = player:get_param(775);
	local add_fen = 3000000 * count;
	now_fen = now_fen + add_fen;
	player:set_param(775, now_fen,item:GetName(),count);
	player:alert(10,0,0,"轮回修为 + "..add_fen.."，当前修为" .. player:get_param(775))
	return count;
end

function item_10326(item,count,event,player) --神级轮回丹
	local now_fen = player:get_param(775);
	local add_fen = 6000000 * count;
	now_fen = now_fen + add_fen;
	player:set_param(775, now_fen,item:GetName(),count);
	player:alert(10,0,0,"轮回修为 + "..add_fen.."，当前修为" .. player:get_param(775))
	return count;
end

function item_10327(item,count,event,player) --85战力礼包
	local level = player:GetLevel();
	if level < 85 then
		player:alert(21,0,0,"85级时可以使用，请继续加油升级");
		return 0;
	end
	if player:num_bag_black() >= 3 then
	   player:add_item(40101,200,1,0,0);
	   player:add_item(10413,1,1,0,0);
	   player:add_item(10303,1,1,0,0);
	   return 1;
	else
		player:alert(21,0,0,"您的背包空间不足");
		return 0; 
	end   
end

function item_10328(item,count,event,player) --95战力礼包
	local level = player:GetLevel();
	if level < 95 then
		player:alert(21,0,0,"95级时可以使用，请继续加油升级");
		return 0;
	end
	if player:num_bag_black() >= 2 then
	   player:add_item(40902,75,1,0,0);
	   player:add_item(10413,1,1,0,0);
	   return 1;
	else
		player:alert(21,0,0,"您的背包空间不足");
		return 0; 
	end   
end

function item_10329(item,count,event,player) --神秘宝箱
	if player:num_bag_black(0) < 2 then
        player:alert(21,0,0,"背包空间不足，请及时清理");  
        return 0;
    end
	--类型（0物品1金币2绑金3经验29boss积分100绑元101元宝，奖励id，数量，权重,绑定（1绑定0非绑),公告标记(无用),公告字符串)
	local bxtbl = {{0,40960,1,18,1,"万能翼魂丹"},{0,10266,1,2,1,"500绑元"},{0,10264,1,5,1,"100绑元"},{0,10281,1,10,1,"50绑元"},{0,10280,1,20,1,"10绑元"}};
	local n_rand = math.random(1,55);
	
	local nAllItemCount = #bxtbl;
    local now_gailv = 0;
    for j = 1, nAllItemCount do
    	local nowCfg = bxtbl[j];
        now_gailv = now_gailv + nowCfg[4];
        if n_rand <= now_gailv then
        	new_add_item(player,nowCfg[1],nowCfg[2],nowCfg[3],nowCfg[5]);
        	player:alert(10,0,0,"获得"..nowCfg[6] .. "x" .. nowCfg[3]);  
			new_add_item(player,0,40960,3,1);
        	player:alert(10,0,0,"获得万能翼魂丹x3"); 
            return 1
        end
    end
    return 0
end

function item_10330(item,count,event,player) --禁地令牌
    player:alert(10,0,0,"可消耗令牌进入八大禁地");
    return 0;
end

function item_10331(item,count,event,player)
    local nItem = 1 * count;
    player:set_param(784,player:get_param(784) + nItem,item:GetName(),count);
    player:alert(10,0,0,"魔玉碎片 + ".. nItem .. "，当前数量" .. player:get_param(784))
    return count;
end

function item_10332(item,count,event,player)
    local nItem = 10 * count;
    player:set_param(784,player:get_param(784) + nItem,item:GetName(),count);
    player:alert(10,0,0,"魔玉碎片 + ".. nItem .. "，当前数量" .. player:get_param(784))
    return count;
end

function item_10333(item,count,event,player)
    local nItem = 100 * count;
    player:set_param(784,player:get_param(784) + nItem,item:GetName(),count);
    player:alert(10,0,0,"魔玉碎片 + ".. nItem .. "，当前数量" .. player:get_param(784))
    return count;
end

function item_10334(item,count,event,player)
    local nItem = 1 * count;
    player:set_param(785,player:get_param(785) + nItem,item:GetName(),count);
    player:alert(10,0,0,"魔盾碎片 + ".. nItem .. "，当前数量" .. player:get_param(785))
    return count;
end

function item_10335(item,count,event,player)
    local nItem = 10 * count;
    player:set_param(785,player:get_param(785) + nItem,item:GetName(),count);
    player:alert(10,0,0,"魔盾碎片 + ".. nItem .. "，当前数量" .. player:get_param(785))
    return count;
end

function item_10336(item,count,event,player)
    local nItem = 100 * count;
    player:set_param(785,player:get_param(785) + nItem,item:GetName(),count);
    player:alert(10,0,0,"魔盾碎片 + ".. nItem .. "，当前数量" .. player:get_param(785))
    return count;
end

function item_10337(item,count,event,player) --70战力礼包
	local level = player:GetLevel();
	if level < 70 then
		player:alert(21,0,0,"70级时可以使用，请继续加油升级");
		return 0;
	end
	if player:num_bag_black() >= 2 then
	   player:add_item(10409,5,1,0,0);
	   player:add_item(10407,3,1,0,0);
	   return 1;
	else
		player:alert(21,0,0,"您的背包空间不足");
		return 0; 
	end   
end

function item_10338(item,count,event,player) --转生修为丹(大)
    local nNewValue = count*5000;
    if player:get_level() >= 70 then
        player:set_param(259,player:get_param(259) + nNewValue,item:GetName(),count);
        player:alert(10,0,0,"修为值 + ".. nNewValue .. "，当前修为值" .. player:get_param(259))
        player:SendZhuanShengInfo();
        return count;
    else
        player:alert(21,0,0,"对不起，您的级别不足70无法使用!!!")
        return 0;
    end
end


function item_10339(item,count,event,player) --七折礼包
    local level = player:GetLevel();
    if level < 70 then
        player:alert(21,0,0,"70级时可以使用，请继续加油升级");
        return 0;
    end
    if player:num_bag_black() >= 4 then
       player:add_item(10411,1,1,0,0);
       player:add_item(10410,1,1,0,0);
       player:add_item(10408,1,1,0,0);
       player:add_item(10413,1,1,0,0);
       return 1;
    else
        player:alert(21,0,0,"您的背包空间不足");
        return 0; 
    end  
end

function item_10340(item,count,event,player) --五折礼包
    local level = player:GetLevel();
    if level < 70 then
        player:alert(21,0,0,"70级时可以使用，请继续加油升级");
        return 0;
    end
    if player:num_bag_black() >= 4 then
       player:add_item(10247,1,1,0,0);
       player:add_item(10155,1,1,0,0);
       player:add_item(10242,1,1,0,0);
       player:add_item(31302,1,1,0,0);
       return 1;
    else
        player:alert(21,0,0,"您的背包空间不足");
        return 0; 
    end  
end

function item_10341(item,count,event,player) --VIP15礼包
	if player:num_bag_black() >= 4 then
		player:add_item(10241,20,1,0,0);
		player:add_item(10324,3,1,0,0);
		player:add_item(10267,100,1,0,0);
		player:add_item(10268,100,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10342(item,count,event,player) --积分令牌（铜）
    local old = player:get_param(216);
    local nItem = 5;
    player:set_param(216,old + nItem);
    player:alert(10,0,0,"宝藏积分 + "..nItem.."，当前数量"..nItem + old);
    return 1;
end

function item_10343(item,count,event,player) --70级武器宝箱
    local itemtb = {{20108,20129,20150},{20108,20129,20150}};
    if player:num_bag_black() < 1 then
        player:alert(21,0,0,"背包不足,无法开启礼包");
        return 0;
    end
    local job = player:GetClass();
    local gen = player:GetGender();
    if itemtb[gen][job] ~= nil then
        player:add_item(itemtb[gen][job],1,0,0,0);
        return 1;
    end
    return 0;
end

function item_10344(item,count,event,player) --转1武器宝箱
    local itemtb = {{20110,20131,20152},{20110,20131,20152}};
    if player:num_bag_black() < 1 then
        player:alert(21,0,0,"背包不足,无法开启礼包");
        return 0;
    end
    local job = player:GetClass();
    local gen = player:GetGender();
    if itemtb[gen][job] ~= nil then
        player:add_item(itemtb[gen][job],1,0,0,0);
        return 1;
    end
    return 0;
end

function item_10345(item,count,event,player) --转2戒指宝箱
    local itemtb = {{20811,20832,20853},{20811,20832,20853}};
    if player:num_bag_black() < 1 then
        player:alert(21,0,0,"背包不足,无法开启礼包");
        return 0;
    end
    local job = player:GetClass();
    local gen = player:GetGender();
    if itemtb[gen][job] ~= nil then
        player:add_item(itemtb[gen][job],1,0,0,0);
        return 1;
    end
    return 0;
end

function item_10346(item,count,event,player) --转4戒指宝箱
    local itemtb = {{20813,20834,20855},{20813,20834,20855}};
    if player:num_bag_black() < 1 then
        player:alert(21,0,0,"背包不足,无法开启礼包");
        return 0;
    end
    local job = player:GetClass();
    local gen = player:GetGender();
    if itemtb[gen][job] ~= nil then
        player:add_item(itemtb[gen][job],1,0,0,0);
        return 1;
    end
    return 0;
end

function item_10347(item,count,event,player) --魂魄丹（小）
    local now_fen = player:get_param(810);
	local add_fen = 10 * count;
	now_fen = now_fen + add_fen;
	player:set_param(810, now_fen,item:GetName(),count);
	player:alert(10,0,0,"魂力 + "..add_fen.."，当前魂力" .. player:get_param(810))
    return count;
end

function item_10348(item,count,event,player) --魂魄丹（中）
    local now_fen = player:get_param(810);
	local add_fen = 100 * count;
	now_fen = now_fen + add_fen;
	player:set_param(810, now_fen,item:GetName(),count);
	player:alert(10,0,0,"魂力 + "..add_fen.."，当前魂力" .. player:get_param(810))
    return count;
end

function item_10349(item,count,event,player) --魂魄丹（大）
    local now_fen = player:get_param(810);
	local add_fen = 1000 * count;
	now_fen = now_fen + add_fen;
	player:set_param(810, now_fen,item:GetName(),count);
	player:alert(10,0,0,"魂力 + "..add_fen.."，当前魂力" .. player:get_param(810))
    return count;
end

function item_10350(item,count,event,player) --500万金币
	local nItem = 5000000 * count;
	player:add_gamemoney_bind(nItem);
	player:alert(10,0,0,"绑定金币 + "..nItem.."，当前数量 "..player:get_gamemoney_bind());
	return count;
end

function item_10351(item,count,event,player) --每日50元礼包1
	if player:num_bag_black() >= 4 then
		player:add_item(10182,2,1,0,0);
		player:add_item(10283,2,1,0,0);
		player:add_item(10186,5,1,0,0);
		player:add_item(19081,2,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10352(item,count,event,player) --每日150元礼包1
	if player:num_bag_black() >= 4 then
		player:add_item(10182,3,1,0,0);
		player:add_item(10283,3,1,0,0);
		player:add_item(10186,8,1,0,0);
		player:add_item(19012,2,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10353(item,count,event,player) --每日350元礼包1
	if player:num_bag_black() >= 4 then
		player:add_item(10182,3,1,0,0);
		player:add_item(10283,3,1,0,0);
		player:add_item(10186,10,1,0,0);
		player:add_item(10268,3,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10354(item,count,event,player) --每日850元礼包1
	if player:num_bag_black() >= 4 then
		player:add_item(10182,5,1,0,0);
		player:add_item(10283,5,1,0,0);
		player:add_item(10186,15,1,0,0);
		player:add_item(10268,4,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10355(item,count,event,player) --每日1500元礼包1
	if player:num_bag_black() >= 4 then
		player:add_item(10183,1,1,0,0);
		player:add_item(10283,8,1,0,0);
		player:add_item(10186,20,1,0,0);
		player:add_item(10268,5,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10356(item,count,event,player) --每日2500元礼包1
	if player:num_bag_black() >= 4 then
		player:add_item(10183,2,1,0,0);
		player:add_item(10283,10,1,0,0);
		player:add_item(10186,30,1,0,0);
		player:add_item(10268,8,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10357(item,count,event,player) --每日10元礼包2
	if player:num_bag_black() >= 4 then
		player:add_item(10143,1,1,0,0);
		player:add_item(10248,1,1,0,0);
		player:add_item(10221,10,1,0,0);
		player:add_item(19080,2,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10358(item,count,event,player) --每日50元礼包2
	if player:num_bag_black() >= 4 then
		player:add_item(10143,2,1,0,0);
		player:add_item(10248,2,1,0,0);
		player:add_item(10221,15,1,0,0);
		player:add_item(19081,2,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10359(item,count,event,player) --每日150元礼包2
	if player:num_bag_black() >= 4 then
		player:add_item(10143,3,1,0,0);
		player:add_item(10248,3,1,0,0);
		player:add_item(10221,20,1,0,0);
		player:add_item(19012,2,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10360(item,count,event,player) --每日350元礼包2
	if player:num_bag_black() >= 4 then
		player:add_item(10143,3,1,0,0);
		player:add_item(10248,3,1,0,0);
		player:add_item(10064,25,1,0,0);
		player:add_item(10268,3,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10361(item,count,event,player) --每日850元礼包2
	if player:num_bag_black() >= 4 then
		player:add_item(10143,5,1,0,0);
		player:add_item(10248,4,1,0,0);
		player:add_item(10064,30,1,0,0);
		player:add_item(10268,4,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10362(item,count,event,player) --每日1500元礼包2
	if player:num_bag_black() >= 4 then
		player:add_item(10145,1,1,0,0);
		player:add_item(10248,5,1,0,0);
		player:add_item(10064,40,1,0,0);
		player:add_item(10268,5,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10363(item,count,event,player) --每日2500元礼包2
	if player:num_bag_black() >= 4 then
		player:add_item(10145,2,1,0,0);
		player:add_item(10248,6,1,0,0);
		player:add_item(10241,15,1,0,0);
		player:add_item(10268,8,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10364(item,count,event,player) --每日10元礼包3
	if player:num_bag_black() >= 4 then
		player:add_item(10246,1,1,0,0);
		player:add_item(10241,1,1,0,0);
		player:add_item(10268,1,1,0,0);
		player:add_item(19080,2,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10365(item,count,event,player) --每日50元礼包3
	if player:num_bag_black() >= 4 then
		player:add_item(10246,2,1,0,0);
		player:add_item(10241,1,1,0,0);
		player:add_item(10182,2,1,0,0);
		player:add_item(10256,5,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10366(item,count,event,player) --每日150元礼包3
	if player:num_bag_black() >= 4 then
		player:add_item(10246,3,1,0,0);
		player:add_item(10243,3,1,0,0);
		player:add_item(10143,3,1,0,0);
		player:add_item(10279,1,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10367(item,count,event,player) --每日350元礼包3
	if player:num_bag_black() >= 4 then
		player:add_item(10182,4,1,0,0);
		player:add_item(10243,4,1,0,0);
		player:add_item(10143,4,1,0,0);
		player:add_item(10193,2,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10368(item,count,event,player) --每日850元礼包3
	if player:num_bag_black() >= 4 then
		player:add_item(10247,1,1,0,0);
		player:add_item(10243,4,1,0,0);
		player:add_item(10241,4,1,0,0);
		player:add_item(10193,4,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10369(item,count,event,player) --每日1500元礼包3
	if player:num_bag_black() >= 4 then
		player:add_item(10183,1,1,0,0);
		player:add_item(10244,1,1,0,0);
		player:add_item(10143,5,1,0,0);
		player:add_item(19012,3,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_10370(item,count,event,player) --每日2500元礼包3
	if player:num_bag_black() >= 4 then
		player:add_item(10247,1,1,0,0);
		player:add_item(10244,1,1,0,0);
		player:add_item(10145,1,1,0,0);
		player:add_item(10183,1,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0;
	end
end

function item_31302(item,count,event,player)
    local now_fen = player:get_param(510);
	local add_fen = 600000 * count;
	now_fen = now_fen + add_fen;
	player:set_param(510, now_fen,item:GetName(),count);
	player:alert(10,0,0,"BOSS积分 + "..add_fen.."，当前BOSS积分" .. player:get_param(510))
    return count;
end

function item_31303(item,count,event,player)
    local now_fen = player:get_param(510);
	local add_fen = 120000 * count;
	now_fen = now_fen + add_fen;
	player:set_param(510, now_fen,item:GetName(),count);
	player:alert(10,0,0,"BOSS积分 + "..add_fen.."，当前BOSS积分" .. player:get_param(510))
    return count;
end

function item_31304(item,count,event,player)
    local now_fen = player:get_param(510);
	local add_fen = 600 * count;
	now_fen = now_fen + add_fen;
	player:set_param(510, now_fen,item:GetName(),count);
	player:alert(10,0,0,"BOSS积分 + "..add_fen.."，当前BOSS积分" .. player:get_param(510))
    return count;
end

function item_12021(item,count,event,player)
    local nvip = player:get_player_type();
    local itemUseLimit = VipLimit.itemUseLimit
    local itemid = item:GetEntryId()
    local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
    local now_times = player:get_param(621);
    if now_times >= maxtimes then
        player:alert(10,0,0,"今日使用次数已达到上限，请提升VIP等级")
        return;
    end
    if maxtimes - now_times < count then
        count = maxtimes - now_times;
    end
	local now_fen = player:get_param(231);
    add_fen = 10 * count;
	now_fen = now_fen + add_fen;
	player:set_param(231, now_fen,item:GetName(),count);
    now_times = now_times + count;
    player:set_param(621,now_times);
    local x = maxtimes - now_times;
    player:alert(10,0,0,"修炼值 +"..add_fen.."，当前数量"..player:get_param(231).."，今日剩余可使用次数："..x.."次!")

    local item_obj = {};
    item_obj.id = 12021;
    item_obj.times = now_times;
    player:SendPacketToSelf(1726,0,encode(item_obj));
    return count;
end

function item_12022(item,count,event,player)
    local nvip = player:get_player_type();
    if nvip <=5 then
        local itemUseLimit = VipLimit.itemUseLimit
        local itemid = item:GetEntryId()
        local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
	    local now_times = player:get_param(622);
	    if now_times >= maxtimes then
	        player:alert(10,0,0,"今日使用次数已达到上限，请提升VIP等级")
	        return;
	    end
	    if maxtimes - now_times < count then
	        count = maxtimes - now_times;
	    end
		local now_fen = player:get_param(231);
	    add_fen = 100 * count;
		now_fen = now_fen + add_fen;
		player:set_param(231, now_fen,item:GetName(),count);
	    now_times = now_times + count;
	    player:set_param(622,now_times);
	    local x = maxtimes - now_times;
	    player:alert(10,0,0,"修炼值 +"..add_fen.."，当前数量"..player:get_param(231).."，今日剩余可使用次数："..x.."次!")

	    local item_obj = {};
	    item_obj.id = 12022;
	    item_obj.times = now_times;
	    player:SendPacketToSelf(1726,0,encode(item_obj));
	    return count;
	else
	    local now_fen = player:get_param(231);
	    add_fen = 100 * count;
	    now_fen = now_fen + add_fen;
	    player:set_param(231, now_fen,item:GetName(),count);
	    player:alert(10,0,0,"修炼值 +1"..add_fen.."，当前数量"..player:get_param(231))
	    return count;
	end
end

function item_12023(item,count,event,player)
	local now_fen = player:get_param(231);
    add_fen = 1000 * count;
	now_fen = now_fen + add_fen;
	player:set_param(231, now_fen,item:GetName(),count);
    player:alert(10,0,0,"修炼值 +"..add_fen.."，当前数量"..player:get_param(231))
    return count;
end


function item_10279(item,count,event,player) --经验盒子
    local nvip = player:get_player_type();
    local itemUseLimit = VipLimit.itemUseLimit
    local itemid = item:GetEntryId()
    local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
    count = 1;
    local now_times = player:get_param(439);
    if now_times >= maxtimes then
        player:alert(10,0,0,"今日使用次数已达到上限，请提升VIP等级")
        return;
    end
    if maxtimes - now_times < count then
        count = maxtimes - now_times;
    end
    now_times = now_times + count;
    local x = maxtimes - now_times;
    local Expr = 0;
    local rand = math.random(0,7);
    local n = 0;
    if rand <= 6 then
        n = math.random(50000,90000);
    else
        n = math.random(90000,120000);
    end
    Expr = n * 100 * count;
    
    local item40301 = player:package_item(40301);
	local ngold = 500;
	if item40301 >= 1 then
		player:remove_item(40301,1,0);
	else
	    if player:get_vcoin_bind() >= ngold then
			player:sub_vcoin_bind(ngold);
		else
			if player:get_vcoin() >= ngold then
				player:sub_vcoin(ngold);
			else
				player:alert(21,0,0,"开启道具不足，开启失败")
				return 0;
			end
		end
	end
    player:set_param(439,now_times);
	player:add_exp(Expr,1);
    player:alert(10,0,0, "经验 + "..Expr.."，今日剩余可使用次数："..x.."次！")
    player:FinishFeats(23, 1);

    local item_obj = {};
    item_obj.id = 10279;
    item_obj.times = now_times;
    player:SendPacketToSelf(1726,0,encode(item_obj));
	return count;
end

function item_10282(item,count,event,player) --经验药水
    local total = 0;
    for i=1,count do
    local Expr = 0;
    local n =math.random(6000,10000);
    Expr = n * 100;
    total = total + Expr;
    end
    player:add_exp(total,1);
	player:alert(10,0,0,"使用"..count.."个经验药水，".."经验 + "..total)
    return count;
end

function item_10289(item,count,event,player) --经验药水新手
	player:add_exp(800000,1);
	player:alert(10,0,0,"经验 + "..800000)
	return count;
end

function item_10290(item,count,event,player) --经验盒子新手
    local item40301 = player:package_item(40301);
    local ngold = 500;
    if item40301 >= 1 then
        player:remove_item(40301,1,0);
    else
        if player:get_vcoin_bind() >= ngold then
            player:sub_vcoin_bind(ngold);
        else
            if player:get_vcoin() >= ngold then
                player:sub_vcoin(ngold);
            else
                player:alert(21,0,0,"开启道具不足，开启失败")
                return 0
            end
        end
    end
	player:add_exp(5000000,1);
	player:alert(10,0,0,"经验 + 5000000");
	player:FinishFeats(23, 1);
	return 1;
end

function item_10296(item,count,event,player,type)
	local tb = {
		[1] = {[1] = {20211,"两仪战盔"},[2] = {20411,"两仪战链"},[3] = {20711,"两仪战镯"},[4] = {20811,"两仪战戒"}},
		[2] = {[1] = {20232,"两仪法冠"},[2] = {20432,"两仪法链"},[3] = {20732,"两仪法镯"},[4] = {20832,"两仪法戒"}},
		[3] = {[1] = {20253,"两仪道冠"},[2] = {20453,"两仪道链"},[3] = {20753,"两仪道镯"},[4] = {20853,"两仪道戒"}}
	};
	local mclass = player:GetClass();
	if tb[mclass][type] == nil then
		return 0;
	end
--	player:alert(2,0,0,"位置："..type)
    if player:num_bag_black(0) >= 1 then
        player:alert(10,0,0,"成功获得"..tb[mclass][type][2]);
        player:add_item(tb[mclass][type][1],1,0,0,0,1);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

function item_10297(item,count,event,player,type)
    local tb = {
[1] = {[1] ={20213,"四象战盔"},[2] = {20413,"四象战链"},[3] = {20713,"四象战镯"},[4] = {20813,"四象战戒"}},
[2] = {[1] = {20234,"四象法冠"},[2] = {20434,"四象法链"},[3] = {20734,"四象法镯"},[4] = {20834,"四象法戒"}},
[3] = {[1] = {20255,"四象道冠"},[2] = {20455,"四象道链"},[3] = {20755,"四象道镯"},[4] = {20855,"四象道戒"}}
    };
    local mclass = player:GetClass();
    if tb[mclass][type] == nil then
        return 0;
    end
--  player:alert(2,0,0,"位置："..type)
    if player:num_bag_black(0) >= 1 then
        player:alert(10,0,0,"成功获得"..tb[mclass][type][2]);
        player:add_item(tb[mclass][type][1],1,0,0,0,1);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

function item_10298(item,count,event,player,type)
    local tb = {
[1] = {[1] ={20215,"天罡六合战盔"},[2] = {20415,"天罡六合战链"},[3] = {20715,"天罡六合战镯"},[4] = {20815,"天罡六合战戒"}},
[2] = {[1] = {20236,"天罡六合法冠"},[2] = {20436,"天罡六合法链"},[3] = {20736,"天罡六合法镯"},[4] = {20836,"天罡六合法戒"}},
[3] = {[1] = {20257,"天罡六合道冠"},[2] = {20457,"天罡六合道链"},[3] = {20757,"天罡六合道镯"},[4] = {20857,"天罡六合道戒"}}
    };
    local mclass = player:GetClass();
    if tb[mclass][type] == nil then
        return 0;
    end
--  player:alert(2,0,0,"位置："..type)
    if player:num_bag_black(0) >= 1 then
        player:alert(10,0,0,"成功获得"..tb[mclass][type][2]);
        player:add_item(tb[mclass][type][1],1,0,0,0,1);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

function item_10299(item,count,event,player,type)
    local tb = {
[1] = {[1] ={20217,"乾坤八卦战盔"},[2] = {20417,"乾坤八卦战链"},[3] = {20717,"乾坤八卦战镯"},[4] = {20817,"乾坤八卦战戒"}},
[2] = {[1] = {20238,"乾坤八卦法冠"},[2] = {20438,"乾坤八卦法链"},[3] = {20738,"乾坤八卦法镯"},[4] = {20838,"乾坤八卦法戒"}},
[3] = {[1] = {20259,"乾坤八卦道冠"},[2] = {20459,"乾坤八卦道链"},[3] = {20759,"乾坤八卦道镯"},[4] = {20859,"乾坤八卦道戒"}}
    };
    local mclass = player:GetClass();
    if tb[mclass][type] == nil then
        return 0;
    end
--  player:alert(2,0,0,"位置："..type)
    if player:num_bag_black(0) >= 1 then
        player:alert(10,0,0,"成功获得"..tb[mclass][type][2]);
        player:add_item(tb[mclass][type][1],1,0,0,0,1);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

function item_12047(item,count,event,player,type)
    local tb = {
[1] = {[1] ={20219,"十方无量战盔"},[2] = {20419,"十方无量战链"},[3] = {20719,"十方无量战镯"},[4] = {20819,"十方无量战戒"}},
[2] = {[1] = {20240,"十方无量法冠"},[2] = {20440,"十方无量法链"},[3] = {20740,"十方无量法镯"},[4] = {20840,"十方无量法戒"}},
[3] = {[1] = {20261,"十方无量道冠"},[2] = {20461,"十方无量道链"},[3] = {20761,"十方无量道镯"},[4] = {20861,"十方无量道戒"}}
    };
    local mclass = player:GetClass();
    if tb[mclass][type] == nil then
        return 0;
    end
--  player:alert(2,0,0,"位置："..type)
    if player:num_bag_black(0) >= 1 then
        player:alert(10,0,0,"成功获得"..tb[mclass][type][2]);
        player:add_item(tb[mclass][type][1],1,0,0,0,1);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

function item_31502(item,count,event,player) --夺宝奇兵
    local format_time = tonumber(os.date("%H%M",os.time()));
    for i=1,#activity_duobaoqibing do
       -- if (format_time >= activity_duobaoqibing[i][2] - 2) and (format_time <= activity_duobaoqibing[i][2]) then
       --      if player:num_bag_black(0) >= 1 then
       --          g_broadcast(14,0,0,"<font color='#00ccff'>"..player:GetName().."</font>玩家打开宝箱，获得500元宝");
       --          player:add_vcoin(500);
       --          return 1;
       --      else
       --          player:alert(21,0,0,"您的背包空间不足");
       --          return 0;
       --      end
       -- end
       if (format_time >= activity_duobaoqibing[i][1]) and (format_time <= activity_duobaoqibing[i][2]) then
            --在活动期间内
            local t = os.time() + 30
            local val =  tonumber(os.date("%H%M",t))
            if val >= activity_duobaoqibing[i][2] then
                if player:num_bag_black(0) >= 1 then
                    g_broadcast(15,0,0,"<font color='#00ccff'>"..player:GetName().."</font>玩家打开宝箱，获得500元宝")
                    player:add_vcoin(500)
                    return 1
                else
                    player:alert(21,0,0,"您的背包空间不足")
                    return 0
                end
            else
                player:alert(21,0,0,"未到开启时间")
            end
       end
    end
    player:alert(21,0,0,"未到开启时间")
    return 0
end


function item_12002(item,count,event,player)		--金疮药(包)
	if player:num_bag_black(0) >= 6 then
		player:add_item(10038,6,0,0,0,1);
		return 1;
	else
		player:alert(21,0,0,"背包不足6格,无法解包");
		return 0;
	end
end

function item_12004(item,count,event,player)		--万年雪参(包)
	if player:num_bag_black(0) >= 6 then
		player:add_item(10039,6,0,0,0,1);
		return 1;
	else
		player:alert(21,0,0,"背包不足6格,无法解包");
		return 0;
	end
end

function item_12005(item,count,event,player)		--治疗神水(包)
	if player:num_bag_black(0) >= 6 then
		player:add_item(10040,6,0,0,0,1);
		return 1;
	else
		player:alert(21,0,0,"背包不足6格,无法解包");
		return 0;
	end
end

function item_12006(item,count,event,player)		--大还丹(包)
	if player:num_bag_black(0) >= 6 then
		player:add_item(10037,6,0,0,0,1);
		return 1;
	else
		player:alert(21,0,0,"背包不足6格,无法解包");
		return 0;
	end
end

function item_40201(item,count,event,player)
	player:alert(10,0,0,"快把我扔掉，收留我背包迟早爆炸");
	return 0;
end


function item_12028(item, count, event, player) --战士神器宝箱
    local bx_setting = {
        --宝箱配置， id是加的物品id, count是表示这个物品加的个数
        [1] = {id = 21303, count = 1},
        [2] = {id = 21403, count = 1},
        [3] = {id = 21503, count = 1},
        [4] = {id = 21603, count = 1},
    }
    local addCount = #bx_setting
    if addCount > 0 then
        if player:num_bag_black(0) >= 1 then
            local index = math.random(1, addCount)
            local id = bx_setting[index] and bx_setting[index].id
            local count =  bx_setting[index] and bx_setting[index].count or 1
            if id then
                 player:add_item(id,count,0,0,0,1)
                return 1
            end
        else
            player:alert(21,0,0,"背包已满");
            return 0
        end
    end

    return 0
end

function item_12029(item, count, event, player) --法师神器宝箱
    local bx_setting = {
        --宝箱配置， id是加的物品id, count是表示这个物品加的个数
        [1] = {id = 21308, count = 1},
        [2] = {id = 21408, count = 1},
        [3] = {id = 21508, count = 1},
        [4] = {id = 21608, count = 1},
    }
    local addCount = #bx_setting
    if addCount > 0 then
        if player:num_bag_black(0) >= 1 then
         local index = math.random(1, addCount)
            local id = bx_setting[index] and bx_setting[index].id
            local count =  bx_setting[index] and bx_setting[index].count or 1
            if id then
                 player:add_item(id,count,0,0,0,1)
                return 1
            end
        else
            player:alert(21,0,0,"背包已满");
            return 0
        end
    end

    return 0
end

function item_12030(item, count, event, player) --道士神器宝箱
    local bx_setting = {
        --宝箱配置， id是加的物品id, count是表示这个物品加的个数
        [1] = {id = 21313, count = 1},
        [2] = {id = 21413, count = 1},
        [3] = {id = 21513, count = 1},
        [4] = {id = 21613, count = 1},
    }
    local addCount = #bx_setting
    if addCount > 0 then
        if player:num_bag_black(0) >= 1 then
            local index = math.random(1, addCount)
            local id = bx_setting[index] and bx_setting[index].id
            local count =  bx_setting[index] and bx_setting[index].count or 1
            if id then
                 player:add_item(id,count,0,0,0,1)
                return 1
            end
        else
            player:alert(21,0,0,"背包已满");
            return 0
        end
    end

    return 0
end

function item_12031(item, count, event, player) --超级神器礼包
    local bx_setting = {
        --宝箱配置， id是加的物品id, count是表示这个物品加的个数
        [1] = {id = 21303, count = 1},
        [2] = {id = 21403, count = 1},
        [3] = {id = 21503, count = 1},
        [4] = {id = 21603, count = 1},
        [5] = {id = 21308, count = 1},
        [6] = {id = 21408, count = 1},
        [7] = {id = 21508, count = 1},
        [8] = {id = 21608, count = 1},
        [9] = {id = 21313, count = 1},
        [10] = {id = 21413, count = 1},
        [11] = {id = 21513, count = 1},
        [12] = {id = 21613, count = 1},

    }
    local addCount = #bx_setting
    if addCount > 0 then
        if player:num_bag_black(0) >= 1 then
            local index = math.random(1, addCount)
            local id = bx_setting[index] and bx_setting[index].id
            local count =  bx_setting[index] and bx_setting[index].count or 1
            if id then
                 player:add_item(id,count,0,0,0,1)
                return 1
            end
        else
            player:alert(21,0,0,"背包已满");
            return 0
        end
    end

    return 0
end


function item_10291(item, count, event, player)
    local giftBoxSetting = {
        money = 10,
        itemsList = {
            --1 gold 2 bindGold 100 bindvcoin 101 vcoin
            [1] = {itemId = 101, count = 100, bind = 1},
            [2] = {itemId = 40101, count = 30, bind = 1},
            [3] = {itemId = 1, count = 10000, bind = 1},
            [4] = {itemId = 10145, count = 1, bind = 1},
        }
    }
    local itemsList = giftBoxSetting.itemsList
    local addCount = #itemsList
    if addCount > 0 then
        if player:num_bag_black(0) >= addCount then
            local need = giftBoxSetting.money
            local has = player:get_vcoin()
            if has < need then
                 player:alert(21,0,0,"赶紧凑凑钱，过了时间就没机会买了")
                 return 0
            end
            player:sub_vcoin(need)
            local fly = 0
            local optType = 242
            local consumeType = 70
            for k, v in ipairs(itemsList) do
                player:NewAddItem(v.itemId, v.count, optType, consumeType, fly, v.bind)
            end

            return 1

        else
            player:alert(21,0,0,"背包已满")
            return 0
        end
    end

    return 0
end

function item_10167(item,count,event,player)
	local level = player:GetLevel();
	if level < 60 then
		player:alert(21,0,0,"图鉴系统在60级开启，请继续加油升级~");
		return 0;
	end
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,10000);
        --格式 道具id,数量，权重，绑定标记，名字
        local bxtbl_1 = {{40628,5,1880,0,"普通怪物碎片"},{40629,5,1573,0,"中级怪物碎片"},{40630,5,929,0,"高级怪物碎片"},{40601,1,1472,0,"牛魔战士碎片"},{40602,1,824,0,"拜火教徒碎片"},{40603,1,771,0,"幽冥使者碎片"},{40604,1,710,0,"食尸将军碎片"},{40605,1,657,0,"移山魔王碎片"},{40631,1,469,0,"中级移山魔王碎片"},{40632,1,280,0,"中级魔狱公爵碎片"},{40633,1,285,0,"中级尸毒傀儡碎片"},{40641,1,100,0,"超级阴烛魔王碎片"},{40642,1,50,0,"超级裁火朱雀碎片"}};
        local bxtbl_2 = {{40628,5,1410,0,"普通怪物碎片"},{40629,5,2310,0,"中级怪物碎片"},{40630,5,1364,0,"高级怪物碎片"},{40601,1,541,0,"牛魔战士碎片"},{40602,1,302,0,"拜火教徒碎片"},{40603,1,283,0,"幽冥使者碎片"},{40604,1,261,0,"食尸将军碎片"},{40605,1,241,0,"移山魔王碎片"},{40631,1,207,0,"中级移山魔王碎片"},{40632,1,124,0,"中级魔狱公爵碎片"},{40633,1,125,0,"中级尸毒傀儡碎片"},{40641,1,99,0,"超级阴烛魔王碎片"},{40642,1,49,0,"超级裁火朱雀碎片"},{40606,1,245,0,"魔狱公爵碎片"},{40607,1,235,0,"尸毒傀儡碎片"},{40608,1,212,0,"驭雷鹰王碎片"},{40609,1,190,0,"吞月凶兽碎片"},{40634,1,124,0,"中级驭雷鹰王碎片"},{40635,1,120,0,"中级吞月凶兽碎片"},{40636,1,131,0,"中级阴烛魔王碎片"},{40643,1,42,0,"超级诛神者碎片"},{40644,1,33,0,"超级刑天魂碎片"}};
        local bxtbl_3 = {{40628,5,4290,0,"普通怪物碎片"},{40629,5,3590,0,"中级怪物碎片"},{40630,5,2120,0,"高级怪物碎片"},{40601,1,3360,0,"牛魔战士碎片"},{40602,1,1880,0,"拜火教徒碎片"},{40603,1,1760,0,"幽冥使者碎片"},{40604,1,1620,0,"食尸将军碎片"},{40605,1,1500,0,"移山魔王碎片"},{40631,1,1070,0,"中级移山魔王碎片"},{40632,1,640,0,"中级魔狱公爵碎片"},{40633,1,650,0,"中级尸毒傀儡碎片"},{40641,1,231,0,"超级阴烛魔王碎片"},{40642,1,114,0,"超级裁火朱雀碎片"},{40606,1,1520,0,"魔狱公爵碎片"},{40607,1,1460,0,"尸毒傀儡碎片"},{40608,1,1320,0,"驭雷鹰王碎片"},{40609,1,1180,0,"吞月凶兽碎片"},{40634,1,640,0,"中级驭雷鹰王碎片"},{40635,1,620,0,"中级吞月凶兽碎片"},{40636,1,680,0,"中级阴烛魔王碎片"},{40643,1,99,0,"超级诛神者碎片"},{40644,1,78,0,"超级刑天魂碎片"},{40649,1,1120,0,"至尊青龙碎片"},{40610,1,1020,0,"阴烛魔王碎片"},{40611,1,920,0,"裁火朱雀碎片"},{40612,1,480,0,"诛神者碎片"},{40637,1,440,0,"中级裁火朱雀碎片"},{40638,1,90,0,"中级诛神者碎片"},{40645,1,99,0,"超级殉道者碎片"}};
        local bxtbl_4 = {{40628,5,1163,0,"普通怪物碎片"},{40629,5,973,0,"中级怪物碎片"},{40630,5,575,0,"高级怪物碎片"},{40601,1,911,0,"牛魔战士碎片"},{40602,1,509,0,"拜火教徒碎片"},{40603,1,477,0,"幽冥使者碎片"},{40604,1,439,0,"食尸将军碎片"},{40605,1,407,0,"移山魔王碎片"},{40631,1,290,0,"中级移山魔王碎片"},{40632,1,173,0,"中级魔狱公爵碎片"},{40633,1,176,0,"中级尸毒傀儡碎片"},{40641,1,63,0,"超级阴烛魔王碎片"},{40642,1,31,0,"超级裁火朱雀碎片"},{40606,1,412,0,"魔狱公爵碎片"},{40607,1,396,0,"尸毒傀儡碎片"},{40608,1,358,0,"驭雷鹰王碎片"},{40609,1,320,0,"吞月凶兽碎片"},{40634,1,173,0,"中级驭雷鹰王碎片"},{40635,1,168,0,"中级吞月凶兽碎片"},{40636,1,184,0,"中级阴烛魔王碎片"},{40643,1,27,0,"超级诛神者碎片"},{40644,1,21,0,"超级刑天魂碎片"},{40610,1,304,0,"阴烛魔王碎片"},{40611,1,276,0,"裁火朱雀碎片"},{40612,1,249,0,"诛神者碎片"},{40637,1,130,0,"中级裁火朱雀碎片"},{40638,1,119,0,"中级诛神者碎片"},{40645,1,24,0,"超级殉道者碎片"},{40646,1,27,0,"超级上古牛魔神碎片"},{40613,1,195,0,"刑天魂碎片"},{40614,1,168,0,"殉道者碎片"},{40639,1,114,0,"中级刑天魂碎片"},{40640,1,98,0,"中级殉道者碎片"},{40647,1,27,0,"超级嗜血大祭司碎片"},{40648,1,23,0,"超级踏炎金晶兽碎片"}};
        local bxtbl_5 = {{40628,5,1163,0,"普通怪物碎片"},{40629,5,973,0,"中级怪物碎片"},{40630,5,575,0,"高级怪物碎片"},{40601,1,911,0,"牛魔战士碎片"},{40602,1,509,0,"拜火教徒碎片"},{40603,1,477,0,"幽冥使者碎片"},{40604,1,439,0,"食尸将军碎片"},{40605,1,407,0,"移山魔王碎片"},{40631,1,290,0,"中级移山魔王碎片"},{40632,1,173,0,"中级魔狱公爵碎片"},{40633,1,176,0,"中级尸毒傀儡碎片"},{40641,1,63,0,"超级阴烛魔王碎片"},{40642,1,31,0,"超级裁火朱雀碎片"},{40606,1,412,0,"魔狱公爵碎片"},{40607,1,396,0,"尸毒傀儡碎片"},{40608,1,358,0,"驭雷鹰王碎片"},{40609,1,320,0,"吞月凶兽碎片"},{40634,1,173,0,"中级驭雷鹰王碎片"},{40635,1,168,0,"中级吞月凶兽碎片"},{40636,1,184,0,"中级阴烛魔王碎片"},{40643,1,27,0,"超级诛神者碎片"},{40644,1,21,0,"超级刑天魂碎片"},{40610,1,304,0,"阴烛魔王碎片"},{40611,1,276,0,"裁火朱雀碎片"},{40612,1,249,0,"诛神者碎片"},{40637,1,130,0,"中级裁火朱雀碎片"},{40638,1,119,0,"中级诛神者碎片"},{40645,1,24,0,"超级殉道者碎片"},{40646,1,27,0,"超级上古牛魔神碎片"},{40613,1,195,0,"刑天魂碎片"},{40614,1,168,0,"殉道者碎片"},{40639,1,114,0,"中级刑天魂碎片"},{40640,1,98,0,"中级殉道者碎片"},{40647,1,27,0,"超级嗜血大祭司碎片"},{40648,1,23,0,"超级踏炎金晶兽碎片"}};

        local bxtbl = nil;
        if level < 70 then
        	bxtbl = bxtbl_1;
        elseif level < 75 then
        	bxtbl = bxtbl_2;
        elseif level < 80 then
        	bxtbl = bxtbl_3;
        elseif level < 90 then
        	bxtbl = bxtbl_4;
        else
        	bxtbl = bxtbl_5;
        end
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],nowCfg[4],0,0);
                player:alert(10,0,0,"恭喜获得了"..nowCfg[5] .. " x " .. nowCfg[2]);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

function item_10168(item,count,event,player)
	local level = player:GetLevel();
	if level < 60 then
		player:alert(21,0,0,"图鉴系统在60级开启，请继续加油升级~");
		return 0;
	end
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,10000);
        --格式 道具id,数量，权重，绑定标记，名字
        local bxtbl_1 = {{40641,1,6695,1,"超级阴烛魔王碎片"},{40642,1,3305,1,"超级裁火朱雀碎片"}};
        local bxtbl_2 = {{40649,1,10000,1,"至尊青龙碎片"}};
        local bxtbl_3 = {{40649,1,5428,1,"至尊青龙碎片"},{40650,1,4572,1,"至尊白虎碎片"}};
        local bxtbl_4 = {{40649,1,4418,1,"至尊青龙碎片"},{40650,1,3720,1,"至尊白虎碎片"},{40651,1,1862,1,"至尊朱雀碎片"}};
        local bxtbl_5 = {{40649,1,3800,1,"至尊青龙碎片"},{40650,1,3200,1,"至尊白虎碎片"},{40651,1,1600,1,"至尊朱雀碎片"},{40652,1,1400,1,"至尊玄武碎片"}};
        local bxtbl = nil;
        if level < 70 then
        	bxtbl = bxtbl_1;
        elseif level < 75 then
        	bxtbl = bxtbl_2;
        elseif level < 80 then
        	bxtbl = bxtbl_3;
        elseif level < 90 then
        	bxtbl = bxtbl_4;
        else
        	bxtbl = bxtbl_5;
        end
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],nowCfg[4],0,0);
                player:alert(10,0,0,"恭喜获得了"..nowCfg[5] .. " x " .. nowCfg[2]);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--图鉴宝箱
function item_10170(item,count,event,player)
	local level = player:GetLevel();
	if level < 65 then
		player:alert(21,0,0,"图鉴系统在65级开启，请继续加油升级");
		return 0;
	end
    if player:num_bag_black(0) >= 2 then
        local rand1 = math.random(1,3);
		local rand2 = math.random(1,14);
        local bxtbl1 = {{40628,10,"普通怪物碎片"},
							{40629,10,"中级怪物碎片"},
							{40630,10,"高级怪物碎片"}};
		local bxtbl2 = {{40601,1,"牛魔战士碎片"},
							{40602,1,"拜火教徒碎片"},
							{40603,1,"幽冥使者碎片"},
							{40604,1,"食尸将军碎片"},
							{40605,1,"移山魔王碎片"},
							{40606,1,"魔狱公爵碎片"},
							{40607,1,"尸毒傀儡碎片"},
							{40608,1,"驭雷鹰王碎片"},
							{40609,1,"吞月凶兽碎片"},
							{40610,1,"阴烛魔王碎片"},
							{40611,1,"裁火朱雀碎片"},
							{40612,1,"诛神者碎片"},
							{40613,1,"刑天魂碎片"},
							{40614,1,"殉道者碎片"}};
							
		local nowCfg1 = bxtbl1[rand1];
		player:add_item(nowCfg1[1],nowCfg1[2],0,0,0);
		player:alert(10,0,0,"恭喜获得了"..nowCfg1[3] .. " x " .. nowCfg1[2]);
		
		local nowCfg2 = bxtbl2[rand2];
		player:add_item(nowCfg2[1],nowCfg2[2],0,0,0);
		player:alert(10,0,0,"恭喜获得了"..nowCfg2[3] .. " x " .. nowCfg2[2]);
		
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足");
        return 0;
    end
end

--高级图鉴宝箱
function item_10171(item,count,event,player)
	local level = player:GetLevel();
	if level < 65 then
		player:alert(21,0,0,"图鉴系统在65级开启，请继续加油升级");
		return 0;
	end
    if player:num_bag_black(0) >= 3 then
        local rand1 = math.random(1,3);
		local rand2 = math.random(1,14);
		local rand3 = math.random(1,10);
        local bxtbl1 = {{40628,30,"普通怪物碎片"},
						{40629,30,"中级怪物碎片"},
						{40630,30,"高级怪物碎片"}};
		local bxtbl2 = {{40601,3,"牛魔战士碎片"},
						{40602,3,"拜火教徒碎片"},
						{40603,3,"幽冥使者碎片"},
						{40604,3,"食尸将军碎片"},
						{40605,3,"移山魔王碎片"},
						{40606,3,"魔狱公爵碎片"},
						{40607,3,"尸毒傀儡碎片"},
						{40608,3,"驭雷鹰王碎片"},
						{40609,3,"吞月凶兽碎片"},
						{40610,3,"阴烛魔王碎片"},
						{40611,3,"裁火朱雀碎片"},
						{40612,3,"诛神者碎片"},
						{40613,3,"刑天魂碎片"},
						{40614,3,"殉道者碎片"}};
		local bxtbl3 = {{40631,2,"稀有移山魔王碎片"},
						{40632,2,"稀有魔狱公爵碎片"},
						{40633,2,"稀有尸毒傀儡碎片"},
						{40634,2,"稀有驭雷鹰王碎片"},
						{40635,2,"稀有吞月凶兽碎片"},
						{40636,2,"稀有阴烛魔王碎片"},
						{40637,2,"稀有裁火朱雀碎片"},
						{40638,2,"稀有诛神者碎片"},
						{40639,2,"稀有刑天魂碎片"},
						{40640,2,"稀有殉道者碎片"}};
							
		local nowCfg1 = bxtbl1[rand1];
		player:add_item(nowCfg1[1],nowCfg1[2],0,0,0);
		player:alert(10,0,0,"恭喜获得了"..nowCfg1[3] .. " x " .. nowCfg1[2]);
		
		local nowCfg2 = bxtbl2[rand2];
		player:add_item(nowCfg2[1],nowCfg2[2],0,0,0);
		player:alert(10,0,0,"恭喜获得了"..nowCfg2[3] .. " x " .. nowCfg2[2]);
									
		local nowCfg3 = bxtbl3[rand1];
		player:add_item(nowCfg3[1],nowCfg3[2],0,0,0);
		player:alert(10,0,0,"恭喜获得了"..nowCfg3[3] .. " x " .. nowCfg3[2]);
		
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足");
        return 0;
    end
end


--终级图鉴宝箱
function item_10172(item,count,event,player)
	local level = player:GetLevel();
	if level < 65 then
		player:alert(21,0,0,"图鉴系统在65级开启，请继续加油升级");
		return 0;
	end
    if player:num_bag_black(0) >= 5 then
        local rand1 = math.random(1,3);
		local rand2 = math.random(1,14);
		local rand3 = math.random(1,10);
		local rand4 = math.random(1,8);
		local rand40 = math.random(0,1);
		local rand5 = math.random(1,4);
		local rand50 = math.random(1,20);
		
        local bxtbl1 = {{40628,60,"普通怪物碎片"},
						{40629,60,"中级怪物碎片"},
						{40630,60,"高级怪物碎片"}};
		local bxtbl2 = {{40601,6,"牛魔战士碎片"},
						{40602,6,"拜火教徒碎片"},
						{40603,6,"幽冥使者碎片"},
						{40604,6,"食尸将军碎片"},
						{40605,6,"移山魔王碎片"},
						{40606,6,"魔狱公爵碎片"},
						{40607,6,"尸毒傀儡碎片"},
						{40608,6,"驭雷鹰王碎片"},
						{40609,6,"吞月凶兽碎片"},
						{40610,6,"阴烛魔王碎片"},
						{40611,6,"裁火朱雀碎片"},
						{40612,6,"诛神者碎片"},
						{40613,6,"刑天魂碎片"},
						{40614,6,"殉道者碎片"}};
		local bxtbl3 = {{40631,4,"稀有移山魔王碎片"},
						{40632,4,"稀有魔狱公爵碎片"},
						{40633,4,"稀有尸毒傀儡碎片"},
						{40634,4,"稀有驭雷鹰王碎片"},
						{40635,4,"稀有吞月凶兽碎片"},
						{40636,4,"稀有阴烛魔王碎片"},
						{40637,4,"稀有裁火朱雀碎片"},
						{40638,4,"稀有诛神者碎片"},
						{40639,4,"稀有刑天魂碎片"},
						{40640,4,"稀有殉道者碎片"}};
		local bxtbl4 = {{40641,1,"史诗阴烛魔王碎片"},
						{40642,1,"史诗裁火朱雀碎片"},
						{40643,1,"史诗诛神者碎片"},
						{40644,1,"史诗刑天魂碎片"},
						{40645,1,"史诗殉道者碎片"},
						{40646,1,"史诗上古牛魔神碎片"},
						{40647,1,"史诗嗜血大祭司碎片"},
						{40648,1,"史诗踏炎金晶兽碎片"}};
		local bxtbl5 = {{40649,1,"传说青龙碎片"},
						{40650,1,"传说白虎碎片"},
						{40651,1,"传说朱雀碎片"},
						{40652,1,"传说玄武碎片"}};
							
		local nowCfg1 = bxtbl1[rand1];
		player:add_item(nowCfg1[1],nowCfg1[2],0,0,0);
		player:alert(10,0,0,"恭喜获得了"..nowCfg1[3] .. " x " .. nowCfg1[2]);
		
		local nowCfg2 = bxtbl2[rand2];
		player:add_item(nowCfg2[1],nowCfg2[2],0,0,0);
		player:alert(10,0,0,"恭喜获得了"..nowCfg2[3] .. " x " .. nowCfg2[2]);
									
		local nowCfg3 = bxtbl3[rand3];
		player:add_item(nowCfg3[1],nowCfg3[2],0,0,0);
		player:alert(10,0,0,"恭喜获得了"..nowCfg3[3] .. " x " .. nowCfg3[2]);
		
		local nowCfg4 = bxtbl4[rand4];
		player:add_item(nowCfg4[1],nowCfg4[2]+rand40,0,0,0);
		player:alert(10,0,0,"恭喜获得了"..nowCfg4[3] .. " x " .. nowCfg4[2]+rand40);
		
		if rand50 == 1 then
		local nowCfg5 = bxtbl5[rand1];
		player:add_item(nowCfg5[1],nowCfg5[2],0,0,0);
		player:alert(10,0,0,"恭喜获得了"..nowCfg5[3] .. " x " .. nowCfg5[2]);
		end
		
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足");
        return 0;
    end
end

--符文宝箱
function item_10173(item,count,event,player)
	local num = 6;
    if player:num_bag_black(0) >= 1 then
		player:alert(10,0,0,"恭喜获得1阶符文 * " .. num);
		player:add_item(40801,num,1,0,0);	
		return 1;
	else
        player:alert(21,0,0,"您的背包空间不足");
        return 0;
    end
end

--高级符文宝箱
function item_10174(item,count,event,player)
	local num1 = 25;
	local num2 = 6;
	local num3 = 2;
    if player:num_bag_black(0) >= 3 then
		player:alert(10,0,0,"恭喜获得1阶符文 * " .. num1);
		player:add_item(40801,num1,1,0,0);
		player:alert(10,0,0,"恭喜获得2阶符文 * " .. num2);
		player:add_item(40802,num2,1,0,0);
		player:alert(10,0,0,"恭喜获得3阶符文 * " .. num3);
		player:add_item(40803,num3,1,0,0);
		return 1;
	else
        player:alert(21,0,0,"您的背包空间不足");
        return 0;
    end
end

--终极符文宝箱
function item_10175(item,count,event,player)
	local num1 = 50;
	local num2 = 10;
	local num3 = 3;
	local num4 = 1;
    if player:num_bag_black(0) >= 4 then
		player:alert(10,0,0,"恭喜获得1阶符文 * " .. num1);
		player:add_item(40801,num1,1,0,0);
		player:alert(10,0,0,"恭喜获得2阶符文 * " .. num2);
		player:add_item(40802,num2,1,0,0);
		player:alert(10,0,0,"恭喜获得3阶符文 * " .. num3);
		player:add_item(40803,num3,1,0,0);
		player:alert(10,0,0,"恭喜获得4阶符文 * " .. num4);
		player:add_item(40804,num4,1,0,0);
		return 1;
	else
        player:alert(21,0,0,"您的背包空间不足");
        return 0;
    end
end

function item_10292(item,count,event,player)
    local config = {
        vipExp = 1000, 
    }
    
    local player_type = player:get_player_type()
    local addCount = config.vipExp * count
    local old = player:get_vcoin_worth()
    player:set_vcoin_worth(addCount + old)
    local notifyMsg = "恭喜获得了"..addCount.."点VIP积分"
    player:alert(10,0,0,notifyMsg)
    HandlerAddVipExp(player, player_type)
    return 1
end


function item_10293(item,count,event,player)
    local giftBoxSetting = {
        money = 10,
        vip = 1,
        itemsList = {
            --1 gold 2 bindGold 100 bindvcoin 101 vcoin
            [1] = {itemId = 101, count = 100, bind = 1},
            [2] = {itemId = 40101, count = 30, bind = 1},
            [3] = {itemId = 1, count = 10000, bind = 1},
            [4] = {itemId = 10145, count = 1, bind = 1},
        }
    }

    local needVip = giftBoxSetting.vip or 1
    local vipLvel = player:get_player_type()
    if vipLvel < needVip then
        player:alert(21, 0, 0, "vip等级不足, 不能使用限时礼包")
        return 0
    end
    local itemsList = giftBoxSetting.itemsList
    local addCount = #itemsList
    if addCount > 0 then
        if player:num_bag_black(0) >= addCount then
            local need = giftBoxSetting.money
            local has = player:get_vcoin()
            if has < need then
                 player:alert(21,0,0,"赶紧凑凑钱，过了时间就没机会买了")
                 return 0
            end
            player:sub_vcoin(need)
            local fly = 0
            local optType = 242
            local consumeType = 70
            for k, v in ipairs(itemsList) do
                player:NewAddItem(v.itemId, v.count, optType, consumeType, fly, v.bind)
            end

            return 1

        else
            player:alert(21,0,0,"背包已满")
            return 0
        end
    end

    return 0
end

function item_10294(item,count,event,player)
	if player:num_bag_black() < 2 then
		player:alert(21,0,0,"背包不足2格,无法开启宝箱");
		return 0;
	end
	
	local nowtime = os.time();
	local usetime = item:GetUseTime();
	local need_gold = 100;
	if usetime > nowtime then
		 local has = player:get_vcoin()
         if has < need_gold then
         	player:alert(21,0,0,"元宝不足，还是再等等吧")
            return 0
         end
         player:sub_vcoin(need_gold)
	end
    new_add_item(player,101,0,100,1)
    new_add_item(player,0,40101,30,1)
    new_add_item(player,1,0,10000,1)
    new_add_item(player,0,10145,1,1)
    return 1;
end



function item_10163(item,count,event,player)
    local nvip = player:get_player_type();
    local useLimit = false
    local leftUse = 0
    local now_times = 0
    if nvip <= 6 then
        local itemUseLimit = VipLimit.itemUseLimit
        local itemid = item:GetEntryId()
        local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
        now_times = player:get_param(625);
        if now_times >= maxtimes then
            player:alert(10, 0, 0, "今天的使用次数已用完")
            return 
        end
        if maxtimes - now_times < count then
            count = maxtimes - now_times
        end
        now_times = now_times + count
        player:set_param(625, now_times)
        useLimit = true
        leftUse = maxtimes - now_times
    end
    local iTotal = player:get_param(655)
    iTotal = iTotal + count
    player:set_param(655, iTotal,item:GetName(),count)
    if useLimit == true then
         player:alert(10,0,0,"特戒碎片 + "..count.."，当前数量"..iTotal.."，今日剩余可使用次数："..leftUse.."次!")
         local item_obj = {}
        item_obj.id = 10163
        item_obj.times = now_times
        player:SendPacketToSelf(1726,0,encode(item_obj))
    else
        local notifyMsg = "特戒碎片+"..count..",当前数量"..iTotal
        player:alert(10,0,0,notifyMsg)
    end
    return count
end

function item_10164(item,count,event,player)
    local nvip = player:get_player_type();
    local useLimit = false
    local leftUse = 0
    local now_times = 0
    if nvip <= 6 then
        local itemUseLimit = VipLimit.itemUseLimit
        local itemid = item:GetEntryId()
        local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
        now_times = player:get_param(626);
        if now_times >= maxtimes then
            player:alert(10, 0, 0, "今天的使用次数已用完")
            return 
        end
        if maxtimes - now_times < count then
            count = maxtimes - now_times
        end
        now_times = now_times + count
        player:set_param(626, now_times)
        useLimit = true
        leftUse = maxtimes - now_times
    end
    local iTotal = player:get_param(655)
    local addCount = count * 10
    iTotal = iTotal + addCount
    player:set_param(655, iTotal,item:GetName(),count)
    if useLimit == true then
         player:alert(10,0,0,"特戒碎片 + "..addCount.."，当前数量"..iTotal.."，今日剩余可使用次数："..leftUse.."次!")
         local item_obj = {}
        item_obj.id = 10164
        item_obj.times = now_times
        player:SendPacketToSelf(1726,0,encode(item_obj))
    else
        local notifyMsg = "特戒碎片+"..addCount..",当前数量"..iTotal
        player:alert(10,0,0,notifyMsg)
    end
    return count
end

function item_10165(item,count,event,player)
    local iTotal = player:get_param(655)
    local addCount = count * 100
    iTotal = iTotal + addCount
    player:set_param(655, iTotal,item:GetName(),count)
    local notifyMsg = "特戒碎片+"..addCount..",当前数量"..iTotal
    player:alert(10,0,0,notifyMsg)
    return count
end

function item_10166(item,count,event,player)
   local iTotal = player:get_param(655)
    local addCount = count * 1000
    iTotal = iTotal + addCount
    player:set_param(655, iTotal,item:GetName(),count)
    local notifyMsg = "特戒碎片+"..addCount..",当前数量"..iTotal
    player:alert(10,0,0,notifyMsg)
    return count
end


function item_10304(item,count,event,player)
   local iTotal = player:get_param(655)
    local addCount = count * 2000
    iTotal = iTotal + addCount
    player:set_param(655, iTotal,item:GetName(),count)
    local notifyMsg = "特戒碎片+"..addCount..",当前数量"..iTotal
    player:alert(10,0,0,notifyMsg)
    return count
end


function item_10305(item,count,event,player)
   local iTotal = player:get_param(655)
    local addCount = count * 4000
    iTotal = iTotal + addCount
    player:set_param(655, iTotal,item:GetName(),count)
    local notifyMsg = "特戒碎片+"..addCount..",当前数量"..iTotal
    player:alert(10,0,0,notifyMsg)
    return count
end

function item_12034(item,count,event,player,type)
	local conftb = {1000,2000,1000,1000,1000,1000,10000};
	
	if conftb[type] ~= nil then
		player:add_vcoin(conftb[type]);
		player:SendVcoinFly(conftb[type],10,0);
		local notifyMsg = "成功领取元宝x"..conftb[type];
		player:alert(10,0,0,notifyMsg);
		return 1;
	end
    return 0;
end

function item_12035(item,count,event,player,type)
	local conftb = {10000000,20000000,5000000,5000000,5000000,5000000,50000000};
	
	if conftb[type] ~= nil then
		player:add_gamemoney_bind(conftb[type]);
		local notifyMsg = "成功领取绑金x"..conftb[type];
		player:alert(10,0,0,notifyMsg);
		return 1;
	end
    return 0;
end

function item_12036(item,count,event,player,type)
	local conftb = {500,1000,2000};
	
	if conftb[type] ~= nil then
		player:add_exp(conftb[type]*10000,1);
		local notifyMsg = "成功领取经验x"..conftb[type]*10000;
		player:alert(10,0,0,notifyMsg);
		return 1;
	end
    return 0;
end

function item_12037(item,count,event,player,type)
	local conftb = {500,1000,500,1000,500,500,2000,500,500,3000,500,500,500,5000};
	local limitlevel = {1,1,1,1,1,1,1,1,1,1,1,1,1,1};
	
	local level = player:GetLevel();
	if limitlevel[type] == nil then
		return 0;
	end
	if level < limitlevel[type] then
		player:alert(10, 0, 0, limitlevel[type].."级可以使用");
		return 0;
	end
	if conftb[type] ~= nil then
		player:add_vcoin_bind(conftb[type]);
		player:SendVcoinFly(conftb[type],10,1);
		local notifyMsg = "成功领取绑元x"..conftb[type];
		player:alert(10,0,0,notifyMsg);
		return 1;
	end
    return 0;
end

function item_40709(item,count,event,player) --转9衣服宝箱
	local itemtb = {{20318,20339,20360},{20381,22203,22224}};
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"背包不足,无法开启礼包");
		return 0;
	end
	local job = player:GetClass();
	local gen = player:GetGender();
	if itemtb[gen][job] ~= nil then
		player:add_item(itemtb[gen][job],1,0,0,0);
		return 1;
	end
	return 0;
end

function item_40710(item,count,event,player) --转1衣服宝箱
	local itemtb = {{20310,20331,20352},{20373,20394,22216}};
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"背包不足,无法开启礼包");
		return 0;
	end
	local job = player:GetClass();
	local gen = player:GetGender();
	if itemtb[gen][job] ~= nil then
		player:add_item(itemtb[gen][job],1,0,0,0);
		return 1;
	end
	return 0;
end

function item_31301(item,count,event,player) --BOSS积分精髓
    local nvip = player:get_player_type();
    local itemUseLimit = VipLimit.itemUseLimit
    local itemid = item:GetEntryId()
    local maxtimes = itemUseLimit[itemid] and itemUseLimit[itemid][nvip + 1] or 1
    local now_times = player:get_param(623);
    if now_times >= maxtimes then
        player:alert(10,0,0,"今日使用次数已达到上限，请提升VIP等级")
        return;
    end
    if maxtimes - now_times < count then
        count = maxtimes - now_times;
    end
	local nItem = 60000 * count;
	player:set_param(510,player:get_param(510) + nItem,item:GetName(),count);
    now_times = now_times + count;
    player:set_param(623,now_times);
    local x = maxtimes - now_times;
    player:alert(10,0,0,"BOSS积分 + "..nItem.."，当前数量"..player:get_param(510).."，今日剩余可使用次数："..x.."次!")

    local item_obj = {};
    item_obj.id = 31301;
    item_obj.times = now_times;
    player:SendPacketToSelf(1726,0,encode(item_obj));
	return count;
end

function item_10306(item,count,event,player)
	local old = player:get_param(216);
	local nItem = 10;
	player:set_param(216,old + nItem);
	player:alert(10,0,0,"宝藏积分 + "..nItem.."，当前数量"..nItem + old);
	return 1;
end

function item_10307(item,count,event,player)
	local old = player:get_param(216);
	local nItem = 100;
	player:set_param(216,old + nItem);
	player:alert(10,0,0,"宝藏积分 + "..nItem.."，当前数量"..nItem + old);
	return 1;
end

function item_10311(item,count,event,player)
	if player:get_param(258) < 4 then
		player:alert(10,0,0,"转4才可以开启，快去提升转生等级吧")
		return 0;
	end
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"背包不足,无法开启礼包");
		return 0;
	end
	player:add_item(10297,1,0,0,0);
	return 1;
end

--焚天宝箱
function item_12040(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,52);
        --道具id,道具数量，概率
        local bxtbl = {
        	{40701,1,13},
        	{40703,1,13},
        	{40705,1,13},
        	{40707,1,13}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--一元宝箱
function item_12041(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,1182);
        --道具id,道具数量，概率
        local bxtbl = {
			{20210,1,60},
			{20231,1,60},
			{20252,1,60},
			{20410,1,60},
			{20431,1,60},
			{20452,1,60},
			{21010,1,60},
			{21031,1,60},
			{21052,1,60},
			{21110,1,60},
			{21131,1,60},
			{21152,1,60},
			{20710,1,72},
			{20731,1,72},
			{20752,1,72},
			{20810,1,60},
			{20831,1,60},
			{20852,1,60},
			{20310,1,5},
			{20331,1,5},
			{20352,1,5},
			{20373,1,5},
			{20394,1,5},
			{22216,1,5},
			{20110,1,12},
			{20131,1,12},
			{20152,1,12}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--两仪宝箱
function item_12042(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,2364);
        --道具id,道具数量，概率
        local bxtbl = {
			{20210,1,60},
			{20231,1,60},
			{20252,1,60},
			{20410,1,60},
			{20431,1,60},
			{20452,1,60},
			{21010,1,60},
			{21031,1,60},
			{21052,1,60},
			{21110,1,60},
			{21131,1,60},
			{21152,1,60},
			{20710,1,72},
			{20731,1,72},
			{20752,1,72},
			{20810,1,60},
			{20831,1,60},
			{20852,1,60},
			{20310,1,5},
			{20331,1,5},
			{20352,1,5},
			{20373,1,5},
			{20394,1,5},
			{22216,1,5},
			{20110,1,12},
			{20131,1,12},
			{20152,1,12},
			{20211,1,60},
			{20232,1,60},
			{20253,1,60},
			{20411,1,60},
			{20432,1,60},
			{20453,1,60},
			{21011,1,60},
			{21032,1,60},
			{21053,1,60},
			{21111,1,60},
			{21132,1,60},
			{21153,1,60},
			{20711,1,72},
			{20732,1,72},
			{20753,1,72},
			{20811,1,60},
			{20832,1,60},
			{20853,1,60},
			{20311,1,5},
			{20332,1,5},
			{20353,1,5},
			{20374,1,5},
			{20395,1,5},
			{22217,1,5},
			{20111,1,12},
			{20132,1,12},
			{20153,1,12}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--四象宝箱
function item_12043(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,1182);
        --道具id,道具数量，概率，是否广播
        local bxtbl = {
			{20213,1,60,1,"四象战盔"},
			{20234,1,60,1,"四象法冠"},
			{20255,1,60,1,"四象道冠"},
			{20413,1,60,1,"四象战链"},
			{20434,1,60,1,"四象法链"},
			{20455,1,60,1,"四象道链"},
			{21013,1,60,1,"四象战带"},
			{21034,1,60,1,"四象法带"},
			{21055,1,60,1,"四象道带"},
			{21113,1,60,1,"四象战靴"},
			{21134,1,60,1,"四象法靴"},
			{21155,1,60,1,"四象道靴"},
			{20713,1,72,1,"四象战镯"},
			{20734,1,72,1,"四象法镯"},
			{20755,1,72,1,"四象道镯"},
			{20813,1,60,1,"四象战戒"},
			{20834,1,60,1,"四象法戒"},
			{20855,1,60,1,"四象道戒"},
			{20312,1,5,1,"三才战甲"},
			{20333,1,5,1,"三才法衣"},
			{20354,1,5,1,"三才道服"},
			{20375,1,5,1,"三才战袍"},
			{20396,1,5,1,"三才法袍"},
			{22218,1,5,1,"三才道袍"},
			{20112,1,12,1,"三才战刃"},
			{20133,1,12,1,"三才法杖"},
			{20154,1,12,1,"三才道扇"}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
				         if nowCfg[4] == 1 then
                    g_broadcast(15,0,0,"【公会商店】<font color='#00ccff'>"..player:GetName().."</font>运气不错，打开装备宝箱获得"..nowCfg[5]);
                end
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--六合宝箱
function item_12044(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,1182);
        --道具id,道具数量，概率，是否广播
        local bxtbl = {
			{20215,1,60,1,"天罡六合战盔"},
			{20236,1,60,1,"天罡六合法冠"},
			{20257,1,60,1,"天罡六合道冠"},
			{20415,1,60,1,"天罡六合战链"},
			{20436,1,60,1,"天罡六合法链"},
			{20457,1,60,1,"天罡六合道链"},
			{21015,1,60,1,"天罡六合战带"},
			{21036,1,60,1,"天罡六合法带"},
			{21057,1,60,1,"天罡六合道带"},
			{21115,1,60,1,"天罡六合战靴"},
			{21136,1,60,1,"天罡六合法靴"},
			{21157,1,60,1,"天罡六合道靴"},
			{20715,1,72,1,"天罡六合战镯"},
			{20736,1,72,1,"天罡六合法镯"},
			{20757,1,72,1,"天罡六合道镯"},
			{20815,1,60,1,"天罡六合战戒"},
			{20836,1,60,1,"天罡六合法戒"},
			{20857,1,60,1,"天罡六合道戒"},
			{20314,1,5,1,"五行离火战甲"},
			{20335,1,5,1,"五行离火法衣"},
			{20356,1,5,1,"五行离火道服"},
			{20377,1,5,1,"五行离火战袍"},
			{20398,1,5,1,"五行离火法袍"},
			{22220,1,5,1,"五行离火道袍"},
			{20114,1,12,1,"五行离火战棍"},
			{20135,1,12,1,"五行离火法杖"},
			{20156,1,12,1,"五行离火道剑"}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                if nowCfg[4] == 1 then
                    g_broadcast(15,0,0,"【公会商店】<font color='#00ccff'>"..player:GetName().."</font>运气不错，打开装备宝箱获得"..nowCfg[5]);
                end
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--八卦宝箱
function item_12045(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,1182);
        --道具id,道具数量，概率，是否广播
        local bxtbl = {
			{20217,1,60,1,"乾坤八卦战盔"},
			{20238,1,60,1,"乾坤八卦法冠"},
			{20259,1,60,1,"乾坤八卦道冠"},
			{20417,1,60,1,"乾坤八卦战链"},
			{20438,1,60,1,"乾坤八卦法链"},
			{20459,1,60,1,"乾坤八卦道链"},
			{21017,1,60,1,"乾坤八卦战带"},
			{21038,1,60,1,"乾坤八卦法带"},
			{21059,1,60,1,"乾坤八卦道带"},
			{21117,1,60,1,"乾坤八卦战靴"},
			{21138,1,60,1,"乾坤八卦法靴"},
			{21159,1,60,1,"乾坤八卦道靴"},
			{20717,1,72,1,"乾坤八卦战镯"},
			{20738,1,72,1,"乾坤八卦法镯"},
			{20759,1,72,1,"乾坤八卦道镯"},
			{20817,1,60,1,"乾坤八卦战戒"},
			{20838,1,60,1,"乾坤八卦法戒"},
			{20859,1,60,1,"乾坤八卦道戒"},
			{20316,1,5,1,"北斗七星战甲"},
			{20337,1,5,1,"北斗七星法衣"},
			{20358,1,5,1,"北斗七星道服"},
			{20379,1,5,1,"北斗七星战袍"},
			{22201,1,5,1,"北斗七星法袍"},
			{22222,1,5,1,"北斗七星道袍"},
			{20116,1,12,1,"北斗七星战刃"},
			{20137,1,12,1,"北斗七星法杖"},
			{20158,1,12,1,"北斗七星道剑"}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                if nowCfg[4] == 1 then
                   g_broadcast(15,0,0,"【公会商店】<font color='#00ccff'>"..player:GetName().."</font>运气不错，打开装备宝箱获得"..nowCfg[5]);
                end
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--十方宝箱
function item_12046(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,1182);
        --道具id,道具数量，概率，是否广播
        local bxtbl = {
			{20219,1,60,1,"十方无量战盔"},
			{20240,1,60,1,"十方无量法冠"},
			{20261,1,60,1,"十方无量道冠"},
			{20419,1,60,1,"十方无量战链"},
			{20440,1,60,1,"十方无量法链"},
			{20461,1,60,1,"十方无量道链"},
			{21019,1,60,1,"十方无量战带"},
			{21040,1,60,1,"十方无量法带"},
			{21061,1,60,1,"十方无量道带"},
			{21119,1,60,1,"十方无量战靴"},
			{21140,1,60,1,"十方无量法靴"},
			{21161,1,60,1,"十方无量道靴"},
			{20719,1,72,1,"十方无量战镯"},
			{20740,1,72,1,"十方无量法镯"},
			{20761,1,72,1,"十方无量道镯"},
			{20819,1,60,1,"十方无量战戒"},
			{20840,1,60,1,"十方无量法戒"},
			{20861,1,60,1,"十方无量道戒"},
			{20318,1,5,1,"九宫太一战甲"},
			{20339,1,5,1,"九宫太一法衣"},
			{20360,1,5,1,"九宫太一道服"},
			{20381,1,5,1,"九宫太一战袍"},
			{22203,1,5,1,"九宫太一法袍"},
			{22224,1,5,1,"九宫太一道袍"},
			{20118,1,12,1,"九宫太一战刃"},
			{20139,1,12,1,"九宫太一法杖"},
			{20160,1,12,1,"九宫太一道剑"}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                if nowCfg[4] == 1 then
                                      g_broadcast(15,0,0,"【公会商店】<font color='#00ccff'>"..player:GetName().."</font>运气不错，打开装备宝箱获得"..nowCfg[5]);
                end
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--4~6阶坐骑马鞍箱
function item_12074(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,246);
        --道具id,道具数量，概率
        local bxtbl = {
			{27402,1,8},
			{27403,1,12},
			{27404,1,16},
			{27405,1,20},
			{27406,1,12},
			{27407,1,8},
			{27408,1,4},
			{27409,1,1},
			{27410,1,1},
			{27502,1,8},
			{27503,1,12},
			{27504,1,16},
			{27505,1,20},
			{27506,1,12},
			{27507,1,8},
			{27508,1,4},
			{27509,1,1},
			{27510,1,1},
			{27602,1,8},
			{27603,1,12},
			{27604,1,16},
			{27605,1,20},
			{27606,1,12},
			{27607,1,8},
			{27608,1,4},
			{27609,1,1},
			{27610,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],1,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--4~6阶坐骑马盔箱
function item_12075(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,246);
        --道具id,道具数量，概率
        local bxtbl = {
			{29402,1,8},
			{29403,1,12},
			{29404,1,16},
			{29405,1,20},
			{29406,1,12},
			{29407,1,8},
			{29408,1,4},
			{29409,1,1},
			{29410,1,1},
			{29502,1,8},
			{29503,1,12},
			{29504,1,16},
			{29505,1,20},
			{29506,1,12},
			{29507,1,8},
			{29508,1,4},
			{29509,1,1},
			{29510,1,1},
			{29602,1,8},
			{29603,1,12},
			{29604,1,16},
			{29605,1,20},
			{29606,1,12},
			{29607,1,8},
			{29608,1,4},
			{29609,1,1},
			{29610,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],1,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--7~9阶坐骑缰绳箱
function item_12076(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,246);
        --道具id,道具数量，概率
        local bxtbl = {
			{25702,1,8},
			{25703,1,12},
			{25704,1,16},
			{25705,1,20},
			{25706,1,12},
			{25707,1,8},
			{25708,1,4},
			{25709,1,1},
			{25710,1,1},
			{25802,1,8},
			{25803,1,12},
			{25804,1,16},
			{25805,1,20},
			{25806,1,12},
			{25807,1,8},
			{25808,1,4},
			{25809,1,1},
			{25810,1,1},
			{25902,1,8},
			{25903,1,12},
			{25904,1,16},
			{25905,1,20},
			{25906,1,12},
			{25907,1,8},
			{25908,1,4},
			{25909,1,1},
			{25910,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],1,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--7~9阶坐骑马蹄箱
function item_12077(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,246);
        --道具id,道具数量，概率
        local bxtbl = {
			{33702,1,8},
			{33703,1,12},
			{33704,1,16},
			{33705,1,20},
			{33706,1,12},
			{33707,1,8},
			{33708,1,4},
			{33709,1,1},
			{33710,1,1},
			{33802,1,8},
			{33803,1,12},
			{33804,1,16},
			{33805,1,20},
			{33806,1,12},
			{33807,1,8},
			{33808,1,4},
			{33809,1,1},
			{33810,1,1},
			{33902,1,8},
			{33903,1,12},
			{33904,1,16},
			{33905,1,20},
			{33906,1,12},
			{33907,1,8},
			{33908,1,4},
			{33909,1,1},
			{33910,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],1,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--初级坐骑宝箱（缰绳和马蹄）
function item_12061(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,20405);
        --道具id,道具数量，概率
        local bxtbl = {
        {25101,1,2000},
        {25102,1,1600},
        {25103,1,800},
        {25104,1,400},
        {25105,1,300},
        {25106,1,200},
        {25201,1,1000},
        {25202,1,800},
        {25203,1,400},
        {25204,1,200},
        {25205,1,150},
        {25206,1,100},
        {25301,1,500},
        {25302,1,400},
        {25303,1,200},
        {25304,1,100},
        {25305,1,75},
        {25306,1,50},
        {33101,1,2400},
        {33102,1,1920},
        {33103,1,960},
        {33104,1,480},
        {33105,1,360},
        {33106,1,240},
        {33201,1,1200},
        {33202,1,960},
        {33203,1,480},
        {33204,1,240},
        {33205,1,180},
        {33206,1,120},
        {33301,1,600},
        {33302,1,480},
        {33303,1,240},
        {33304,1,120},
        {33305,1,90},
        {33306,1,60}

        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--初级坐骑宝箱（马鞍和马盔）
function item_12062(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,22260);
        --道具id,道具数量，概率
        local bxtbl = {
        {27101,1,2400},
        {27102,1,1920},
        {27103,1,960},
        {27104,1,480},
        {27105,1,360},
        {27106,1,240},
        {27201,1,1200},
        {27202,1,960},
        {27203,1,480},
        {27204,1,240},
        {27205,1,180},
        {27206,1,120},
        {27301,1,600},
        {27302,1,480},
        {27303,1,240},
        {27304,1,120},
        {27305,1,90},
        {27306,1,60},
        {29101,1,2400},
        {29102,1,1920},
        {29103,1,960},
        {29104,1,480},
        {29105,1,360},
        {29106,1,240},
        {29201,1,1200},
        {29202,1,960},
        {29203,1,480},
        {29204,1,240},
        {29205,1,180},
        {29206,1,120},
        {29301,1,600},
        {29302,1,480},
        {29303,1,240},
        {29304,1,120},
        {29305,1,90},
        {29306,1,60}

        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--中级坐骑宝箱（缰绳和马蹄）
function item_12063(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,20405);
        --道具id,道具数量，概率
        local bxtbl = {
        {25401,1,2000},
        {25402,1,1600},
        {25403,1,800},
        {25404,1,400},
        {25405,1,300},
        {25406,1,200},
        {25501,1,1000},
        {25502,1,800},
        {25503,1,400},
        {25504,1,200},
        {25505,1,150},
        {25506,1,100},
        {25601,1,500},
        {25602,1,400},
        {25603,1,200},
        {25604,1,100},
        {25605,1,75},
        {25606,1,50},
        {33401,1,2400},
        {33402,1,1920},
        {33403,1,960},
        {33404,1,480},
        {33405,1,360},
        {33406,1,240},
        {33501,1,1200},
        {33502,1,960},
        {33503,1,480},
        {33504,1,240},
        {33505,1,180},
        {33506,1,120},
        {33601,1,600},
        {33602,1,480},
        {33603,1,240},
        {33604,1,120},
        {33605,1,90},
        {33606,1,60}

        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--中级坐骑宝箱（马鞍和马盔）
function item_12064(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,22260);
        --道具id,道具数量，概率
        local bxtbl = {
        {27401,1,2400},
        {27402,1,1920},
        {27403,1,960},
        {27404,1,480},
        {27405,1,360},
        {27406,1,240},
        {27501,1,1200},
        {27502,1,960},
        {27503,1,480},
        {27504,1,240},
        {27505,1,180},
        {27506,1,120},
        {27601,1,600},
        {27602,1,480},
        {27603,1,240},
        {27604,1,120},
        {27605,1,90},
        {27606,1,60},
        {29401,1,2400},
        {29402,1,1920},
        {29403,1,960},
        {29404,1,480},
        {29405,1,360},
        {29406,1,240},
        {29501,1,1200},
        {29502,1,960},
        {29503,1,480},
        {29504,1,240},
        {29505,1,180},
        {29506,1,120},
        {29601,1,600},
        {29602,1,480},
        {29603,1,240},
        {29604,1,120},
        {29605,1,90},
        {29606,1,60}

        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],1,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--坐骑饰品宝箱（缰绳和马蹄）
function item_12065(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,87780);
        --道具id,道具数量，概率
        local bxtbl = {
        {25401,1,6000},
        {25402,1,4800},
        {25403,1,3600},
        {25404,1,2600},
        {25405,1,1800},
        {25406,1,1200},
        {25407,1,800},
        {25408,1,600},
        {25409,1,400},
        {25410,1,400},
        {25411,1,400},
        {25412,1,200},
        {25501,1,3000},
        {25502,1,2400},
        {25503,1,1800},
        {25504,1,1300},
        {25505,1,900},
        {25506,1,600},
        {25507,1,400},
        {25508,1,300},
        {25509,1,200},
        {25510,1,200},
        {25511,1,200},
        {25512,1,100},
        {25601,1,1500},
        {25602,1,1200},
        {25603,1,900},
        {25604,1,650},
        {25605,1,450},
        {25606,1,300},
        {25607,1,200},
        {25608,1,150},
        {25609,1,100},
        {25610,1,100},
        {25611,1,100},
        {25612,1,50},
        {33401,1,7200},
        {33402,1,5760},
        {33403,1,4320},
        {33404,1,3120},
        {33405,1,2160},
        {33406,1,1440},
        {33407,1,960},
        {33408,1,720},
        {33409,1,480},
        {33410,1,480},
        {33411,1,480},
        {33412,1,240},
        {33501,1,3600},
        {33502,1,2880},
        {33503,1,2160},
        {33504,1,1560},
        {33505,1,1080},
        {33506,1,720},
        {33507,1,480},
        {33508,1,360},
        {33509,1,240},
        {33510,1,240},
        {33511,1,240},
        {33512,1,120},
        {33601,1,1800},
        {33602,1,1440},
        {33603,1,1080},
        {33604,1,780},
        {33605,1,540},
        {33606,1,360},
        {33607,1,240},
        {33608,1,180},
        {33609,1,120},
        {33610,1,120},
        {33611,1,120},
        {33612,1,60}

        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],1,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--坐骑装备宝箱（马鞍和马盔）
function item_12066(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,95760);
        --道具id,道具数量，概率
        local bxtbl = {
        {27401,1,7200},
        {27402,1,5760},
        {27403,1,4320},
        {27404,1,3120},
        {27405,1,2160},
        {27406,1,1440},
        {27407,1,960},
        {27408,1,720},
        {27409,1,480},
        {27410,1,480},
        {27411,1,480},
        {27412,1,240},
        {27501,1,3600},
        {27502,1,2880},
        {27503,1,2160},
        {27504,1,1560},
        {27505,1,1080},
        {27506,1,720},
        {27507,1,480},
        {27508,1,360},
        {27509,1,240},
        {27510,1,240},
        {27511,1,240},
        {27512,1,120},
        {27601,1,1800},
        {27602,1,1440},
        {27603,1,1080},
        {27604,1,780},
        {27605,1,540},
        {27606,1,360},
        {27607,1,240},
        {27608,1,180},
        {27609,1,120},
        {27610,1,120},
        {27611,1,120},
        {27612,1,60},
        {29401,1,7200},
        {29402,1,5760},
        {29403,1,4320},
        {29404,1,3120},
        {29405,1,2160},
        {29406,1,1440},
        {29407,1,960},
        {29408,1,720},
        {29409,1,480},
        {29410,1,480},
        {29411,1,480},
        {29412,1,240},
        {29501,1,3600},
        {29502,1,2880},
        {29503,1,2160},
        {29504,1,1560},
        {29505,1,1080},
        {29506,1,720},
        {29507,1,480},
        {29508,1,360},
        {29509,1,240},
        {29510,1,240},
        {29511,1,240},
        {29512,1,120},
        {29601,1,1800},
        {29602,1,1440},
        {29603,1,1080},
        {29604,1,780},
        {29605,1,540},
        {29606,1,360},
        {29607,1,240},
        {29608,1,180},
        {29609,1,120},
        {29610,1,120},
        {29611,1,120},
        {29612,1,60}

        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],1,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--超级坐骑宝箱
function item_12067(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,183540);
        --道具id,道具数量，概率
        local bxtbl = {
        {27401,1,7200},
        {27402,1,5760},
        {27403,1,4320},
        {27404,1,3120},
        {27405,1,2160},
        {27406,1,1440},
        {27407,1,960},
        {27408,1,720},
        {27409,1,480},
        {27410,1,480},
        {27411,1,480},
        {27412,1,240},
        {27501,1,3600},
        {27502,1,2880},
        {27503,1,2160},
        {27504,1,1560},
        {27505,1,1080},
        {27506,1,720},
        {27507,1,480},
        {27508,1,360},
        {27509,1,240},
        {27510,1,240},
        {27511,1,240},
        {27512,1,120},
        {27601,1,1800},
        {27602,1,1440},
        {27603,1,1080},
        {27604,1,780},
        {27605,1,540},
        {27606,1,360},
        {27607,1,240},
        {27608,1,180},
        {27609,1,120},
        {27610,1,120},
        {27611,1,120},
        {27612,1,60},
        {25401,1,6000},
        {25402,1,4800},
        {25403,1,3600},
        {25404,1,2600},
        {25405,1,1800},
        {25406,1,1200},
        {25407,1,800},
        {25408,1,600},
        {25409,1,400},
        {25410,1,400},
        {25411,1,400},
        {25412,1,200},
        {25501,1,3000},
        {25502,1,2400},
        {25503,1,1800},
        {25504,1,1300},
        {25505,1,900},
        {25506,1,600},
        {25507,1,400},
        {25508,1,300},
        {25509,1,200},
        {25510,1,200},
        {25511,1,200},
        {25512,1,100},
        {25601,1,1500},
        {25602,1,1200},
        {25603,1,900},
        {25604,1,650},
        {25605,1,450},
        {25606,1,300},
        {25607,1,200},
        {25608,1,150},
        {25609,1,100},
        {25610,1,100},
        {25611,1,100},
        {25612,1,50},
        {33401,1,7200},
        {33402,1,5760},
        {33403,1,4320},
        {33404,1,3120},
        {33405,1,2160},
        {33406,1,1440},
        {33407,1,960},
        {33408,1,720},
        {33409,1,480},
        {33410,1,480},
        {33411,1,480},
        {33412,1,240},
        {33501,1,3600},
        {33502,1,2880},
        {33503,1,2160},
        {33504,1,1560},
        {33505,1,1080},
        {33506,1,720},
        {33507,1,480},
        {33508,1,360},
        {33509,1,240},
        {33510,1,240},
        {33511,1,240},
        {33512,1,120},
        {33601,1,1800},
        {33602,1,1440},
        {33603,1,1080},
        {33604,1,780},
        {33605,1,540},
        {33606,1,360},
        {33607,1,240},
        {33608,1,180},
        {33609,1,120},
        {33610,1,120},
        {33611,1,120},
        {33612,1,60},
        {29401,1,7200},
        {29402,1,5760},
        {29403,1,4320},
        {29404,1,3120},
        {29405,1,2160},
        {29406,1,1440},
        {29407,1,960},
        {29408,1,720},
        {29409,1,480},
        {29410,1,480},
        {29411,1,480},
        {29412,1,240},
        {29501,1,3600},
        {29502,1,2880},
        {29503,1,2160},
        {29504,1,1560},
        {29505,1,1080},
        {29506,1,720},
        {29507,1,480},
        {29508,1,360},
        {29509,1,240},
        {29510,1,240},
        {29511,1,240},
        {29512,1,120},
        {29601,1,1800},
        {29602,1,1440},
        {29603,1,1080},
        {29604,1,780},
        {29605,1,540},
        {29606,1,360},
        {29607,1,240},
        {29608,1,180},
        {29609,1,120},
        {29610,1,120},
        {29611,1,120},
        {29612,1,60}


        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],1,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--神石礼袋
function item_12068(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,100);
        --道具id,道具数量，概率
        local bxtbl = {
        {10322,1,33},
        {10408,1,11},
        {10410,1,12},
        {10411,1,14},
        {10417,1,15},
        {10413,1,15}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],1,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end



--焚天装备宝箱
function item_12050(item,count,event,player,type)
	local tb = {
		[1] = {[1] = {21303,"焚天护肩·战"},[2] = {21403,"焚天面甲·战"},[3] = {21503,"焚天护膝·战"},[4] = {21603,"焚天吊坠·战"}},
		[2] = {[1] = {21308,"焚天护肩·法"},[2] = {21408,"焚天面甲·法"},[3] = {21508,"焚天护膝·法"},[4] = {21608,"焚天吊坠·法"}},
		[3] = {[1] = {21313,"焚天护肩·道"},[2] = {21413,"焚天面甲·道"},[3] = {21513,"焚天护膝·道"},[4] = {21613,"焚天吊坠·道"}},
	};
	local mclass = player:GetClass();
	if tb[mclass][type] == nil then
		return 0;
	end
--	player:alert(2,0,0,"位置："..type)
    if player:num_bag_black(0) >= 1 then
        player:alert(10,0,0,"成功获得"..tb[mclass][type][2]);
        player:add_item(tb[mclass][type][1],1,0,0,0,1);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

--集字兑换
function item_41001(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41002(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41003(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41004(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41005(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41006(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41007(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41008(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end
function item_41011(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41012(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41013(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41014(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41015(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41016(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41017(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41018(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41021(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41022(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41023(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41024(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41025(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41026(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41027(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41028(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41031(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41032(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41033(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41034(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41035(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41036(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_41037(item,count,event,player)
	local Expr = 50000 * count;
	player:add_exp(Expr,1);
	return count;
end

function item_10091(item,count,event,player)
	if player:num_bag_black() >= 5 then
		player:add_item(12014,1,1,0,0);
		player:add_item(10287,1,1,0,0);
		player:add_item(12015,1,1,0,0);
		player:add_item(10295,1,1,0,0);
		player:add_item(10205,100,1,0,0);
		return 1;
	else
		player:alert(21,0,0,"您的背包空间不足5格");
		return 0;
	end
end

function item_10308(item,count,event,player) -- 100绑定元宝
	local nItem = 100 * count;
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_10309(item,count,event,player) -- 500绑定元宝
	local nItem = 500 * count;
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_10310(item,count,event,player) -- 1000绑定元宝
	local nItem = 1000 * count;
	player:add_vcoin_bind(nItem);
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return count;
end

function item_10312(item,count,event,player)
    local now_fen = player:get_param(231);
    add_fen = 1 * count;
    now_fen = now_fen + add_fen;
    player:set_param(231, now_fen,item:GetName(),count);
    player:alert(10,0,0,"修炼值 +"..add_fen.."，当前数量"..player:get_param(231))
    return count;
end

function item_10313(item,count,event,player)
    local nItem = 1 * count;
    player:add_vcoin(nItem);
    player:alert(10,0,0,"元宝 + "..nItem.."，当前数量"..player:get_vcoin());
    return count;
end
function item_10318(item,count,event,player)
    local nItem = 1 * count;
    player:add_vcoin(nItem);
    player:alert(10,0,0,"元宝 + "..nItem.."，当前数量"..player:get_vcoin());
    return count;
end
function item_10300(item,count,event,player)
    player:alert(10,0,0,"可前往末日神像兑换末日令牌");
    return 0;
end

function item_10301(item,count,event,player)
    player:alert(10,0,0,"可前往末日雕像,消耗令牌进入末日秘境");
    return 0;
end

function item_10314(item,count,event,player) --转11武器宝箱
    local itemtb = {{20120,20141,20162},{20120,20141,20162}};
    if player:num_bag_black() < 1 then
        player:alert(21,0,0,"背包不足,无法开启礼包");
        return 0;
    end
    local job = player:GetClass();
    local gen = player:GetGender();
    if itemtb[gen][job] ~= nil then
        player:add_item(itemtb[gen][job],1,0,0,0);
        return 1;
    end
    return 0;
end

function item_40701(item,count,event,player)
    player:alert(10,0,0,"凑齐4个，可以在装备合成处合成护肩装备");
    return 0;
end

function item_40702(item,count,event,player)
    player:alert(10,0,0,"凑齐4个，可以在装备合成处合成焚天护肩装备");
    return 0;
end

function item_40703(item,count,event,player)
    player:alert(10,0,0,"凑齐4个，可以在装备合成处合成面甲装备");
    return 0;
end

function item_40704(item,count,event,player)
    player:alert(10,0,0,"凑齐4个，可以在装备合成处合成焚天面甲装备");
    return 0;
end

function item_40705(item,count,event,player)
    player:alert(10,0,0,"凑齐4个，可以在装备合成处合成护膝装备");
    return 0;
end

function item_40706(item,count,event,player)
    player:alert(10,0,0,"凑齐4个，可以在装备合成处合成焚天护膝装备");
    return 0;
end

function item_40707(item,count,event,player)
    player:alert(10,0,0,"凑齐4个，可以在装备合成处合成吊坠装备");
    return 0;
end

function item_40708(item,count,event,player)
    player:alert(10,0,0,"凑齐4个，可以在装备合成处合成焚天吊坠装备");
    return 0;
end

function item_10401(item,count,event,player)
	if player:num_bag_black() >= 6 then
	   player:add_item(10165,1,1,0,0);
	   player:add_item(10154,1,1,0,0);
	   player:add_item(10152,1,1,0,0);   
	   player:add_item(31301,1,1,0,0);
	   player:add_item(10259,1,1,0,0);
	   player:add_item(10301,1,1,0,0);
	   return 1;
	else
		player:alert(21,0,0,"您的背包空间不足6格");
		return 0; 
	end   
end

function item_10402(item,count,event,player)
	if player:num_bag_black() >= 6 then
	   player:add_item(40101,100,1,0,0);
	   player:add_item(10287,10,1,0,0);
	   player:add_item(40901,5,1,0,0);   
	   player:add_item(40301,1,1,0,0);
	   player:add_item(12008,1,1,0,0);
	   player:add_item(10028,1,1,0,0);
	   return 1;
	else
		player:alert(21,0,0,"您的背包空间不足6格");
		return 0; 
	end  
end

function item_10403(item,count,event,player)
	if player:num_bag_black() == 0 then
			player:alert(21,0,0,"您的背包空间不足");    
			return 0;
		end    
	local x = math.random(0,3200);    
	if x <=1000 then
			player:add_item(10210,1,1,0,0);
		elseif x<=2500 then
			player:add_item(10210,2,1,0,0);
		elseif x <= 3000 then
			player:add_item(10210,3,1,0,0);
		elseif x <= 3100 then
			player:add_item(10210,4,1,0,0);
		elseif x<= 3160 then
			player:add_item(10210,5,1,0,0);
		else
			player:add_item(10210,10,1,0,0);
	end
	return 1;   
end

function item_10406(item,count,event,player)
	local nItem = 100000000 * count;
	player:add_gamemoney_bind(nItem);
	player:alert(10,0,0,"绑定金币 + "..nItem.."，当前数量 "..player:get_gamemoney_bind());
	return count;
end



function item_10092(item,count,event,player)
	if player:num_bag_black() >= 4 then
	   player:add_item(10258,1,1,0,0);
	   player:add_item(10287,2,1,0,0);
	   player:add_item(12014,2,1,0,0);   
	   player:add_item(40301,1,1,0,0);
	   return 1;
	else
		player:alert(21,0,0,"您的背包空间不足4格");
		return 0; 
	end  
end


--神石礼包
function item_10323(item,count,event,player)
	if player:num_bag_black() >= 3 then
	   player:add_item(10322,1,1,0,0);
	   player:add_item(10410,1,1,0,0);
	   player:add_item(10408,1,1,0,0);   
	   return 1;
	else
		player:alert(21,0,0,"您的背包空间不足");
		return 0; 
	end  
end

function item_10315(item,count,event,player) --坐骑礼包
if player:num_bag_black() == 0 then
   player:alert(21,0,0,"您的背包空间不足");
return 0;            	
end
local x = math.random(0,4025);
        if x <= 50 then
        	player:add_item(40902,2,1,0,0);
        elseif x <= 200 then	
        	player:add_item(40902,3,1,0,0);
        elseif x <= 500 then
             player:add_item(40902,4,1,0,0);
        elseif x <= 1100 then
             player:add_item(40902,5,1,0,0);
        elseif x <= 1700 then
             player:add_item(40902,6,1,0,0); 
        elseif x <= 3700 then
             player:add_item(40902,7,1,0,0);
        elseif x <= 4000 then
             player:add_item(40902,8,1,0,0);
        elseif x <= 4015 then
            player:add_item(40902,9,1,0,0);
        else 
            player:add_item(40902,10,1,0,0);
        end
return 1;                                        	
end

function item_12051(item,count,event,player) --焚天神甲宝箱
	local itemtb = {22227,22228};
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足");
		return 0;
	end
	local gen = player:GetGender();
	if itemtb[gen] ~= nil then
		player:add_item(itemtb[gen],1,0,0,0);
		return 1;
	end
	return 0;
end

function item_10405(item,count,event,player)
	if player:num_bag_black() >= 6 then
	   player:add_item(40101,50,1,0,0);
	   player:add_item(10246,1,1,0,0);
	   player:add_item(10152,1,1,0,0);   
	   player:add_item(31301,1,1,0,0);
	   player:add_item(12023,2,1,0,0);
	   player:add_item(10161,2,1,0,0);
	   return 1;
	else
		player:alert(21,0,0,"您的背包空间不足6格");
		return 0; 
	end  
end

function item_10093(item,count,event,player) --新手礼包
    if player:num_bag_black() >= 3 then
        player:add_item(10147,1,1,0,0);
        player:add_item(10285,1,1,0,0);
        player:add_item(10034,1,1,0,0);
        return 1;
    else
        player:alert(10,0,0,"您的背包空间不足3格");
        return 0;
    end
end

function item_10094(item,count,event,player) --等级礼包
    if player:num_bag_black() >= 4 then
        player:add_item(10148,1,1,0,0);
        player:add_item(10286,1,1,0,0);
        player:add_item(12014,2,1,0,0);
        player:add_item(10035,1,1,0,0);
        return 1;
    else
        player:alert(10,0,0,"您的背包空间不足4格");
        return 0;
    end
end

function item_10095(item,count,event,player) --连续登陆礼包
    if player:num_bag_black() >= 4 then
        player:add_item(10186,10,1,0,0);
        player:add_item(10287,1,1,0,0);
        player:add_item(12014,1,1,0,0);
        player:add_item(10258,1,1,0,0);
        return 1;
    else
        player:alert(10,0,0,"您的背包空间不足4格");
        return 0;
    end
end

function item_10316(item,count,event,player,type)
    local tb = {
        [1] = {[1] = {40701,"护肩碎片"},[2] = {40703,"面甲碎片"},[3] = {40705,"护膝碎片"},[4] = {40707,"吊坠碎片"}},
        [2] = {[1] = {40701,"护肩碎片"},[2] = {40703,"面甲碎片"},[3] = {40705,"护膝碎片"},[4] = {40707,"吊坠碎片"}},
        [3] = {[1] = {40701,"护肩碎片"},[2] = {40703,"面甲碎片"},[3] = {40705,"护膝碎片"},[4] = {40707,"吊坠碎片"}}
    };
    local mclass = player:GetClass();
    if tb[mclass][type] == nil then
        return 0;
    end
--  player:alert(2,0,0,"位置："..type)
    if player:num_bag_black(0) >= 1 then
        player:alert(10,0,0,"成功获得"..tb[mclass][type][2]);
        player:add_item(tb[mclass][type][1],1,0,0,0,1);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

function item_10317(item,count,event,player,type)
    local tb = {
        [1] = {[1] = {40702,"焚天护肩碎片"},[2] = {40704,"焚天面甲碎片"},[3] = {40706,"焚天护膝碎片"},[4] = {40708,"焚天吊坠碎片"}},
        [2] = {[1] = {40702,"焚天护肩碎片"},[2] = {40704,"焚天面甲碎片"},[3] = {40706,"焚天护膝碎片"},[4] = {40708,"焚天吊坠碎片"}},
        [3] = {[1] = {40702,"焚天护肩碎片"},[2] = {40704,"焚天面甲碎片"},[3] = {40706,"焚天护膝碎片"},[4] = {40708,"焚天吊坠碎片"}}
    };
    local mclass = player:GetClass();
    if tb[mclass][type] == nil then
        return 0;
    end
--  player:alert(2,0,0,"位置："..type)
    if player:num_bag_black(0) >= 1 then
        player:alert(10,0,0,"成功获得"..tb[mclass][type][2]);
        player:add_item(tb[mclass][type][1],1,0,0,0,1);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

function item_12052(item,count,event,player) --合服
if player:num_bag_black() == 0 then
   player:alert(21,0,0,"您的背包空间不足");
return 0;            	
end
local x = math.random(0,24);
        if x <= 3 then
        	player:add_item(10153,1,1,0,0);
        elseif x <= 6 then	
        	player:add_item(10151,1,1,0,0);
        elseif x <= 8 then
             player:add_item(12021,1,1,0,0);
        elseif x <= 18 then
             player:add_item(10302,88,1,0,0);
        elseif x <= 19 then
             player:add_item(40902,2,1,0,0); 
        else 
            player:add_item(40101,3,1,0,0);
        end
return 1;                                        	
end

function item_12053(item,count,event,player) --合服
if player:num_bag_black() == 0 then
   player:alert(21,0,0,"您的背包空间不足");
return 0;            	
end
local x = math.random(0,24);
        if x <= 3 then
        	player:add_item(10154,1,1,0,0);
        elseif x <= 6 then	
        	player:add_item(10152,1,1,0,0);
        elseif x <= 8 then
             player:add_item(12022,1,1,0,0);
        elseif x <= 18 then
             player:add_item(10246,1,1,0,0);
        elseif x <= 19 then
             player:add_item(40902,18,1,0,0); 
        else 
            player:add_item(40101,28,1,0,0);
        end
return 1;                                        	
end

function item_12054(item,count,event,player) --合服
if player:num_bag_black() == 0 then
   player:alert(21,0,0,"您的背包空间不足");
return 0;            	
end
local x = math.random(0,24);
        if x <= 3 then
        	player:add_item(10155,1,1,0,0);
        elseif x <= 6 then	
        	player:add_item(10242,1,1,0,0);
        elseif x <= 8 then
             player:add_item(12023,1,1,0,0);
        elseif x <= 18 then
             player:add_item(10247,1,1,0,0);
        elseif x <= 19 then
             player:add_item(40902,188,1,0,0); 
        else 
            player:add_item(40101,288,1,0,0);
        end
return 1;                                        	
end

function item_12055(item,count,event,player)
if player:num_bag_black() == 0 then
   player:alert(21,0,0,"您的背包空间不足");
return 0;            	
end
local x = math.random(0,4);
        if x <= 1 then
        	player:add_item(40702,1,0,0,0);
        elseif x <= 2 then	
        	player:add_item(40704,1,0,0,0);
        elseif x <= 3 then
             player:add_item(40706,1,0,0,0);
        else 
            player:add_item(40708,1,0,0,0);
        end
return 1;                                        	
end

function item_12056(item,count,event,player,type)
    local tb = {
[1] = {[1] ={21716,"十方无量战盔"},[2] = {21717,"十方无量战链"},[3] = {21718,"十方无量战镯"},[4] = {21720,"十方无量战戒"}},
[2] = {[1] ={21716,"十方无量战盔"},[2] = {21717,"十方无量战链"},[3] = {21718,"十方无量战镯"},[4] = {21720,"十方无量战戒"}},
[3] = {[1] ={21716,"十方无量战盔"},[2] = {21717,"十方无量战链"},[3] = {21718,"十方无量战镯"},[4] = {21720,"十方无量战戒"}}
    };
    local mclass = player:GetClass();
    if tb[mclass][type] == nil then
        return 0;
    end
--  player:alert(2,0,0,"位置："..type)
    if player:num_bag_black(0) >= 1 then
        player:add_item(tb[mclass][type][1],1,0,0,0,0);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

--无限制道具
function item_10407(item,count,event,player)
	local nItem = 1 * count;
	player:set_param(247,player:get_param(247) + nItem,item:GetName(),count);
	player:FinishFeats(18,count);
	player:alert(10,0,0,"魂珠碎片 + ".. nItem .. "，当前数量" .. player:get_param(247))
	return count;
end

function item_10408(item,count,event,player)
	local nItem = 10 * count;
	player:set_param(247,player:get_param(247) + nItem,item:GetName(),count);
	player:FinishFeats(18,count);
	player:alert(10,0,0,"魂珠碎片 + ".. nItem .. "，当前数量" .. player:get_param(247))
	return count;
end

function item_10409(item,count,event,player)
	local nItem = 2 * count;
	player:set_param(208,player:get_param(208) + nItem,item:GetName(),count);
	player:FinishFeats(17,count);
	player:alert(10,0,0,"宝石碎片 + ".. nItem .. "，当前数量" .. player:get_param(208))
	return count;
end

function item_10410(item,count,event,player)
	local nItem = 20 * count;
	player:set_param(208,player:get_param(208) + nItem,item:GetName(),count);
	player:FinishFeats(17,count);
	player:alert(10,0,0,"宝石碎片 + ".. nItem .. "，当前数量" .. player:get_param(208))
	return count;
end

function item_10411(item,count,event,player)
	local nItem = 50000 * count;
	player:set_param(259,player:get_param(259) + nItem,item:GetName(),count);
	player:SendZhuanShengInfo();
	player:alert(10,0,0,"修为值 + ".. nItem .. "，当前修为值" .. player:get_param(259))
	return count;
end

function item_10412(item,count,event,player)
	local nItem = 500000 * count;
	player:set_param(259,player:get_param(259) + nItem,item:GetName(),count);
	player:SendZhuanShengInfo();
	player:alert(10,0,0,"修为值 + ".. nItem .. "，当前修为值" .. player:get_param(259))
	return count;
end

function item_10413(item,count,event,player)
	local nItem = 60000 * count;
	player:set_param(510,player:get_param(510) + nItem,item:GetName(),count);
	player:alert(10,0,0,"BOSS积分 + ".. nItem .. "，当前数量" .. player:get_param(510))
	return count;
end

function item_10415(item,count,event,player)

   if player:num_bag_black() == 0 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

   local x = math.random(0,100);
    if x <= 18 then
    	player:add_item(12014,1,1,0,0);
    elseif x <= 34 then
        player:add_item(12015,1,1,0,0);
    elseif x <= 58 then
        player:add_item(10301,1,1,0,0);
    elseif x <= 62 then
        player:add_item(10300,5,1,0,0);
    elseif x <= 63 then
    	player:add_item(10330,1,1,0,0);
    elseif x <= 70 then
        player:add_item(10287,2,1,0,0);
    elseif x <= 80 then
        player:add_item(10295,5,1,0,0);
    else 
        player:add_item(40901,2,1,0,0);
    end       	
	return 1;
end


function item_10416(item,count,event,player)	

   if player:num_bag_black() == 0 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end
	
    local x = math.random(0,100);
    if x <= 15 then
    	player:add_item(12014,1,1,0,0);
    elseif x <= 30 then
        player:add_item(12015,1,1,0,0);
    elseif x <= 32 then
        player:add_item(10301,1,1,0,0);
    elseif x <= 52 then
        player:add_item(10300,1,1,0,0);
    elseif x <= 53 then
    	player:add_item(10330,1,1,0,0);
    elseif x <= 68 then
        player:add_item(10287,1,1,0,0);
    elseif x <= 84 then
        player:add_item(10295,5,1,0,0);
    else 
        player:add_item(40901,1,1,0,0);       	
    end            	
	return 1;
end

function item_10417(item,count,event,player)
    local now_fen = player:get_param(231);
    add_fen = 100 * count;
    now_fen = now_fen + add_fen;
    player:set_param(231, now_fen,item:GetName(),count);
    player:alert(10,0,0,"修炼值 +"..add_fen.."，当前数量"..player:get_param(231))
    return count;
end

function item_10418(item,count,event,player)
    local now_fen = player:get_param(231);
    add_fen = 10 * count;
    now_fen = now_fen + add_fen;
    player:set_param(231, now_fen,item:GetName(),count);
    player:alert(10,0,0,"修炼值 +"..add_fen.."，当前数量"..player:get_param(231))
    return count;
end

function item_10420(item,count,event,player) -- 绑元箱子
	local nItem = 0;
    local x = math.random(1,53);
    if x <= 2 then
       nItem = 50;
    elseif x <= 7 then  
       nItem = 100;
    elseif x <= 22 then
       nItem = 150;
    elseif x <= 42 then
       nItem = 200;
    elseif x <= 52 then
       nItem = 300;
    else
       nItem = 500;
    end
    player:add_vcoin_bind(nItem);              
	player:alert(10,0,0,"绑定元宝 + "..nItem.."，当前数量"..player:get_vcoin_bind() - player:get_vcoin());
	return 1;
end

function item_10421(item,count,event,player)	

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10165,1,1,0,0);
	player:add_item(12078,1,1,0,0);
	local y = math.random(0,100);
	if y <= 20 then
    local x = math.random(0,8);
    if x <= 4 then
    	player:add_item(12078,3,1,0,0);
    elseif x <= 5 then
        player:add_item(10417,1,1,0,0);
    elseif x <= 6 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 7 then
        player:add_item(10411,1,1,0,0);
    else  
        player:add_item(40803,1,1,0,0);       	
    end        
    end    	
	return 1;

end

function item_10424(item,count,event,player)	

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10161,1,1,0,0);
	player:add_item(12087,1,1,0,0);
	local y = math.random(0,100);
	if y <= 20 then
    local x = math.random(0,10);
    if x <= 1 then
    	player:add_item(12087,3,1,0,0);
    elseif x <= 7 then
        player:add_item(10324,1,1,0,0);
    elseif x <= 8 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 9 then
        player:add_item(10411,1,1,0,0);
    else  
        player:add_item(40803,1,1,0,0);       	
    end        
    end    	
	return 1;

end

function item_10425(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10161,1,1,0,0);
    player:add_item(12095,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,10);
    if x <= 1 then
        player:add_item(12095,3,1,0,0);
    elseif x <= 7 then
        player:add_item(10324,1,1,0,0);
    elseif x <= 8 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 9 then
        player:add_item(10411,1,1,0,0);
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10426(item,count,event,player)    

   if player:num_bag_black() <= 1 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10253,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,11);
    if x <= 2 then
        player:add_item(10165,1,1,0,0);
    elseif x <= 6 then
        player:add_item(10417,1,1,0,0);
    elseif x <= 7 then
        player:add_item(10411,1,1,0,0);
    else  
        player:add_item(10502,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10427(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10324,1,1,0,0);
    player:add_item(12104,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,9);
    if x <= 1 then
        player:add_item(12104,3,1,0,0);
    elseif x <= 3 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 5 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 7 then
        player:add_item(10411,1,1,0,0);
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10428(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10413,1,1,0,0);
    player:add_item(12112,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12112,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10429(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10324,1,1,0,0);
    player:add_item(12112,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12112,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);
    else  
        player:add_item(40803,1,1,0,0);         
    end         
    end     
    return 1;

end


function item_10430(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10348,1,1,0,0);
    player:add_item(12112,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12112,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10431(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10502,1,1,0,0);
    player:add_item(12112,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12112,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);
    else  
        player:add_item(40803,1,1,0,0);         
    end         
    end     
    return 1;

end

function item_10432(item,count,event,player)    

   if player:num_bag_black() <= 1 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10253,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,12);
    if x <= 2 then
        player:add_item(10165,1,1,0,0);
    elseif x <= 5 then
        player:add_item(10417,1,1,0,0);
    elseif x <= 6 then
        player:add_item(10411,1,1,0,0);
    elseif x <= 9 then
        player:add_item(10333,8,1,0,0);    
    else  
        player:add_item(10336,8,1,0,0);         
    end        
    end     
    return 1;

end

function item_10433(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10413,1,1,0,0);
    player:add_item(12121,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12121,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10434(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10411,1,1,0,0);
    player:add_item(12121,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12121,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10435(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10348,1,1,0,0);
    player:add_item(12121,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12121,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10436(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10502,1,1,0,0);
    player:add_item(12121,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12121,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10437(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10413,1,1,0,0);
    player:add_item(12125,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12125,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10438(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10411,1,1,0,0);
    player:add_item(12125,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12125,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10439(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10348,1,1,0,0);
    player:add_item(12125,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12125,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10440(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10502,1,1,0,0);
    player:add_item(12125,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12125,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10441(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10413,1,1,0,0);
    player:add_item(12134,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12134,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10442(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10324,1,1,0,0);
    player:add_item(12134,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12134,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10443(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10348,1,1,0,0);
    player:add_item(12134,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12134,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10444(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10502,1,1,0,0);
    player:add_item(12134,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12134,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end


function item_10445(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10413,1,1,0,0);
    player:add_item(12224,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12224,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10446(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10324,1,1,0,0);
    player:add_item(12224,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12224,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10447(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10348,1,1,0,0);
    player:add_item(12224,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12224,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10448(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10502,1,1,0,0);
    player:add_item(12224,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12224,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10449(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10413,1,1,0,0);
    player:add_item(12228,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12228,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10450(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10324,1,1,0,0);
    player:add_item(12228,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12228,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10451(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10348,1,1,0,0);
    player:add_item(12228,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12228,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10452(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10502,1,1,0,0);
    player:add_item(12228,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12228,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10453(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10413,1,1,0,0);
    player:add_item(12232,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12232,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10454(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10324,1,1,0,0);
    player:add_item(12232,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12232,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10455(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10348,1,1,0,0);
    player:add_item(12232,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12232,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end

function item_10456(item,count,event,player)    

   if player:num_bag_black() <= 2 then
   player:alert(21,0,0,"您的背包空间不足");
   return 0; 
   end

    player:add_item(10502,1,1,0,0);
    player:add_item(12232,1,1,0,0);
    local y = math.random(0,100);
    if y <= 20 then
    local x = math.random(0,36);
    if x <= 10 then
        player:add_item(12232,1,1,0,0);
    elseif x <= 15 then
        player:add_item(10413,1,1,0,0);
    elseif x <= 20 then
        player:add_item(10348,1,1,0,0);
    elseif x <= 21 then
        player:add_item(10411,1,1,0,0);    
    else  
        player:add_item(40803,1,1,0,0);         
    end        
    end     
    return 1;

end




--红包
function item_12057(item,count,event,player)
local x = math.random(0,76);
        if x <= 2 then
			player:add_vcoin_bind(100);
			player:alert(10,0,0,"拆开红包获得了100绑定元宝！新年快乐，恭喜发财！");
        elseif x <= 12 then
			player:add_vcoin_bind(200);
			player:alert(10,0,0,"拆开红包获得了200绑定元宝！新年快乐，恭喜发财！");
        elseif x <= 27 then
			player:add_vcoin_bind(400);
			player:alert(10,0,0,"拆开红包获得了400绑定元宝！新年快乐，恭喜发财！");
        elseif x <= 52 then
			player:add_vcoin_bind(800);
			player:alert(10,0,0,"拆开红包获得了800绑定元宝！新年快乐，恭喜发财！");
        elseif x <= 67 then
			player:add_vcoin_bind(1200);
			player:alert(10,0,0,"拆开红包获得了1200绑定元宝！新年快乐，恭喜发财！");
        elseif x <= 75 then
			player:add_vcoin_bind(1600);
			player:alert(10,0,0,"拆开红包获得了1600绑定元宝！新年快乐，恭喜发财！");
        else
			player:add_vcoin_bind(2000);
			player:alert(10,0,0,"拆开红包获得了2000绑定元宝！新年快乐，恭喜发财！");
        end
return 1;                                        	
end

function item_12058(item,count,event,player,type)
	local conftb = {500,1000,500,1000,500,500,2000};
	local limitlevel = {1,1,1,1,1,1,1};
	
	local level = player:GetLevel();
	if limitlevel[type] == nil then
		return 0;
	end
	if level < limitlevel[type] then
		player:alert(10, 0, 0, limitlevel[type].."级可以使用");
		return 0;
	end
	if conftb[type] ~= nil then
		player:add_vcoin_bind(conftb[type]);
		player:SendVcoinFly(conftb[type],10,1);
		local notifyMsg = "拆开红包获得了"..conftb[type].."绑定元宝!新年快乐，恭喜发财！";
		player:alert(10,0,0,notifyMsg);
		return 1;
	end
    return 0;
end

function item_10500(item,count,event,player)
    local value = player:GetTravelHonor();
    local add_val = 1 * count;
    value = value + add_val;
    player:SetTravelHonor(value);
    player:alert(10,0,0,"荣誉值 +"..add_val.."，当前数量"..value)
    return count;
end

function item_10501(item,count,event,player)
    local value = player:get_param(844);
    local add_val = 2000 * count;
    value = value + add_val;
    player:set_param(844, value,item:GetName(),count);
    player:alert(10,0,0,"声望值 +"..add_val.."，当前数量"..value)
    return count;
end

function item_10502(item,count,event,player)
    local value = player:get_param(844);
    local add_val = 20000 * count;
    value = value + add_val;
    player:set_param(844, value,item:GetName(),count);
    player:alert(10,0,0,"声望值 +"..add_val.."，当前数量"..value)
    return count;
end

function item_10503(item,count,event,player)
    local value = player:get_param(844);
    local add_val = 200000 * count;
    value = value + add_val;
    player:set_param(844, value,item:GetName(),count);
    player:alert(10,0,0,"声望值 +"..add_val.."，当前数量"..value)
    return count;
end



function item_12069(item, count, event, player)
    local titleid = 7
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12071(item, count, event, player)
    local titleid = 7
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12072(item, count, event, player)
    local titleid = 10
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12079(item, count, event, player)
    local titleid = 11
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12080(item, count, event, player)
    local titleid = 12
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12073(item,count,event,player,type)
    local tb = {
[1] = {[1] ={21716,"焚天神盔"},[2] = {21717,"焚天神链"},[3] = {21718,"焚天神镯"},[4] = {21719,"焚天神戒"},[5] = {21720,"焚天神靴"},[6] = {21721,"焚天神带"}},
[2] = {[1] ={21716,"焚天神盔"},[2] = {21717,"焚天神链"},[3] = {21718,"焚天神镯"},[4] = {21719,"焚天神戒"},[5] = {21720,"焚天神靴"},[6] = {21721,"焚天神带"}},
[3] = {[1] ={21716,"焚天神盔"},[2] = {21717,"焚天神链"},[3] = {21718,"焚天神镯"},[4] = {21719,"焚天神戒"},[5] = {21720,"焚天神靴"},[6] = {21721,"焚天神带"}},
   };
    local mclass = player:GetClass();
    if tb[mclass][type] == nil then
        return 0;
    end
--  player:alert(2,0,0,"位置："..type)
    if player:num_bag_black(0) >= 1 then
        player:add_item(tb[mclass][type][1],1,0,0,0,0);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

--玩具小马驹
function item_12082(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,167);
        --道具id,道具数量，概率
        local bxtbl = {
        {40902,10,80},
        {40902,20,48},
        {40902,30,24},
        {40902,50,12},
        {40902,80,2},
        {40902,100,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],1,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--童年糖果
function item_12081(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,183);
        --道具id,道具数量，概率
        local bxtbl = {
        {10347,2,96},
        {10347,4,48},
        {10347,8,24},
        {10348,1,12},
        {10348,2,2},
        {10348,3,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],1,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--3阶缰绳
function item_12085(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,191);
        --道具id,道具数量，概率
        local bxtbl = {
			{25303,1,64},
			{25304,1,64},
			{25305,1,32},
			{25306,1,16},
			{25307,1,8},
			{25308,1,4},
			{25309,1,2},
			{25310,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--3阶马鞍
function item_12083(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,191);
        --道具id,道具数量，概率
        local bxtbl = {
			{27303,1,64},
			{27304,1,64},
			{27305,1,32},
			{27306,1,16},
			{27307,1,8},
			{27308,1,4},
			{27309,1,2},
			{27310,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--3阶马盔
function item_12084(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,191);
        --道具id,道具数量，概率
        local bxtbl = {
			{29303,1,64},
			{29304,1,64},
			{29305,1,32},
			{29306,1,16},
			{29307,1,8},
			{29308,1,4},
			{29309,1,2},
			{29310,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--3阶马蹄
function item_12086(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,191);
        --道具id,道具数量，概率
        local bxtbl = {
			{33303,1,64},
			{33304,1,64},
			{33305,1,32},
			{33306,1,16},
			{33307,1,8},
			{33308,1,4},
			{33309,1,2},
			{33310,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

function item_12088(item, count, event, player)
    local titleid = 14
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12089(item, count, event, player)
    local titleid = 13
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12090(item, count, event, player)
    local titleid = 15
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

--4阶缰绳
function item_12093(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,195);
        --道具id,道具数量，概率
        local bxtbl = {
			{25403,1,24},
			{25404,1,48},
			{25405,1,64},
			{25406,1,32},
			{25407,1,16},
			{25408,1,8},
			{25409,1,2},
			{25410,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--4阶马鞍
function item_12091(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,195);
        --道具id,道具数量，概率
        local bxtbl = {
			{27403,1,24},
			{27404,1,48},
			{27405,1,64},
			{27406,1,32},
			{27407,1,16},
			{27408,1,8},
			{27409,1,2},
			{27410,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--4阶马盔
function item_12092(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,195);
        --道具id,道具数量，概率
        local bxtbl = {
			{29403,1,24},
			{29404,1,48},
			{29405,1,64},
			{29406,1,32},
			{29407,1,16},
			{29408,1,8},
			{29409,1,2},
			{29410,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--4阶马蹄
function item_12094(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,195);
        --道具id,道具数量，概率
        local bxtbl = {
			{33403,1,24},
			{33404,1,48},
			{33405,1,64},
			{33406,1,32},
			{33407,1,16},
			{33408,1,8},
			{33409,1,2},
			{33410,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

function item_12096(item, count, event, player)
    local titleid = 17
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12097(item, count, event, player)
    local titleid = 16
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12098(item, count, event, player)
    local titleid = 18
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12099(item,count,event,player)
    if player:num_bag_black(0) >= 2 then
        local n_rand = math.random(1,103);
        --道具id,道具数量，概率
        local bxtbl = {
			{10319,20,10},
			{10319,50,15},
			{10319,100,30},
			{10319,200,45},
			{10319,500,2},
			{40803,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],1,0,0);
                player:add_item(10253,1,1,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足2格");
        return 0;
    end
end

function item_12100(item,count,event,player,type)
    local tb = {
		[1] = {[1] ={20121,"焚天神盔"},[2] = {26112,"焚天神链"},[3] = {28112,"焚天神镯"},[4] = {32112,"焚天神戒"},[5] = {34112,"焚天神带"}},
		[2] = {[1] ={20121,"焚天神盔"},[2] = {26112,"焚天神链"},[3] = {28112,"焚天神镯"},[4] = {32112,"焚天神戒"},[5] = {34112,"焚天神带"}},
		[3] = {[1] ={20121,"焚天神盔"},[2] = {26112,"焚天神链"},[3] = {28112,"焚天神镯"},[4] = {32112,"焚天神戒"},[5] = {34112,"焚天神带"}},
	};
    local mclass = player:GetClass();
    if tb[mclass][type] == nil then
        return 0;
    end
    if player:num_bag_black(0) >= 1 then
        player:add_item(tb[mclass][type][1],1,0,0,0,0);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

function item_12101(item,count,event,player,type)
    local tb = {
		[1] = {[1] ={12051,"焚天神盔"},[2] = {26012,"焚天神链"},[3] = {28012,"焚天神镯"},[4] = {32012,"焚天神戒"},[5] = {34012,"焚天神带"}},
		[2] = {[1] ={12051,"焚天神盔"},[2] = {26012,"焚天神链"},[3] = {28012,"焚天神镯"},[4] = {32012,"焚天神戒"},[5] = {34012,"焚天神带"}},
		[3] = {[1] ={12051,"焚天神盔"},[2] = {26012,"焚天神链"},[3] = {28012,"焚天神镯"},[4] = {32012,"焚天神戒"},[5] = {34012,"焚天神带"}},
	};
    local mclass = player:GetClass();
    if tb[mclass][type] == nil then
        return 0;
    end
    if player:num_bag_black(0) >= 1 then
        player:add_item(tb[mclass][type][1],1,0,0,0,0);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

function item_12102(item,count,event,player,type)
    local tb = {
		[1] = {[1] ={12073,"焚天神盔"},[2] = {25912,"焚天神链"},[3] = {27912,"焚天神镯"},[4] = {29912,"焚天神戒"},[5] = {33912,"焚天神带"}},
		[2] = {[1] ={12073,"焚天神盔"},[2] = {25912,"焚天神链"},[3] = {27912,"焚天神镯"},[4] = {29912,"焚天神戒"},[5] = {33912,"焚天神带"}},
		[3] = {[1] ={12073,"焚天神盔"},[2] = {25912,"焚天神链"},[3] = {27912,"焚天神镯"},[4] = {29912,"焚天神戒"},[5] = {33912,"焚天神带"}},
	};
    local mclass = player:GetClass();
    if tb[mclass][type] == nil then
        return 0;
    end
    if player:num_bag_black(0) >= 1 then
        player:add_item(tb[mclass][type][1],1,0,0,0,0);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

function item_12103(item,count,event,player,type)
    local tb = {
		[1] = {[1] ={12050,"焚天神盔"},[2] = {25812,"焚天神链"},[3] = {27812,"焚天神镯"},[4] = {29812,"焚天神戒"},[5] = {33812,"焚天神带"}},
		[2] = {[1] ={12050,"焚天神盔"},[2] = {25812,"焚天神链"},[3] = {27812,"焚天神镯"},[4] = {29812,"焚天神戒"},[5] = {33812,"焚天神带"}},
		[3] = {[1] ={12050,"焚天神盔"},[2] = {25812,"焚天神链"},[3] = {27812,"焚天神镯"},[4] = {29812,"焚天神戒"},[5] = {33812,"焚天神带"}},
	};
    local mclass = player:GetClass();
    if tb[mclass][type] == nil then
        return 0;
    end
    if player:num_bag_black(0) >= 1 then
        player:add_item(tb[mclass][type][1],1,0,0,0,0);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

function item_12105(item, count, event, player)
    local titleid = 20
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12106(item, count, event, player)
    local titleid = 19
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12107(item, count, event, player)
    local titleid = 21
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

--4阶缰绳
function item_12110(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,96);
        --道具id,道具数量，概率
        local bxtbl = {
			{25403,1,30},
			{25404,1,30},
			{25405,1,20},
			{25406,1,10},
			{25407,1,5},
			{25408,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--4阶马鞍
function item_12108(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,96);
        --道具id,道具数量，概率
        local bxtbl = {
			{27403,1,30},
			{27404,1,30},
			{27405,1,20},
			{27406,1,10},
			{27407,1,5},
			{27408,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--4阶马盔
function item_12109(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,96);
        --道具id,道具数量，概率
        local bxtbl = {
			{29403,1,30},
			{29404,1,30},
			{29405,1,20},
			{29406,1,10},
			{29407,1,5},
			{29408,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--4阶马蹄
function item_12111(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,96);
        --道具id,道具数量，概率
        local bxtbl = {
			{33403,1,30},
			{33404,1,30},
			{33405,1,20},
			{33406,1,10},
			{33407,1,5},
			{33408,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

function item_12113(item, count, event, player)
    local titleid = 23
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12114(item, count, event, player)
    local titleid = 22
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12115(item, count, event, player)
    local titleid = 24
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

--6阶缰绳
function item_12118(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,100);
        --道具id,道具数量，概率
        local bxtbl = {
			{25603,1,13},
			{25604,1,36},
			{25605,1,24},
			{25606,1,12},
			{25607,1,8},
			{25608,1,4},
			{25609,1,2},
			{25610,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--6阶马鞍
function item_12116(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,100);
        --道具id,道具数量，概率
        local bxtbl = {
			{27603,1,13},
			{27604,1,36},
			{27605,1,24},
			{27606,1,12},
			{27607,1,8},
			{27608,1,4},
			{27609,1,2},
			{27610,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--6阶马盔
function item_12117(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,100);
        --道具id,道具数量，概率
        local bxtbl = {
			{29603,1,13},
			{29604,1,36},
			{29605,1,24},
			{29606,1,12},
			{29607,1,8},
			{29608,1,4},
			{29609,1,2},
			{29610,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--6阶马蹄
function item_12119(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,100);
        --道具id,道具数量，概率
        local bxtbl = {
			{33603,1,13},
			{33604,1,36},
			{33605,1,24},
			{33606,1,12},
			{33607,1,8},
			{33608,1,4},
			{33609,1,2},
			{33610,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

function item_12120(item,count,event,player,type)
    local tb = {
		[1] = {[1] ={12116,"焚天神盔"},[2] = {12117,"焚天神链"},[3] = {12118,"焚天神镯"},[4] = {12119,"焚天神戒"}},
		[2] = {[1] ={12116,"焚天神盔"},[2] = {12117,"焚天神链"},[3] = {12118,"焚天神镯"},[4] = {12119,"焚天神戒"}},
		[3] = {[1] ={12116,"焚天神盔"},[2] = {12117,"焚天神链"},[3] = {12118,"焚天神镯"},[4] = {12119,"焚天神戒"}},
	};
    local mclass = player:GetClass();
    if tb[mclass][type] == nil then
        return 0;
    end
    if player:num_bag_black(0) >= 1 then
        player:add_item(tb[mclass][type][1],1,0,0,0,0);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

function item_12122(item, count, event, player)
    local titleid = 26
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12123(item, count, event, player)
    local titleid = 25
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12124(item, count, event, player)
    local titleid = 27
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end


function item_12126(item, count, event, player)
    local titleid = 29
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12127(item, count, event, player)
    local titleid = 28
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12128(item, count, event, player)
    local titleid = 30
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

--6阶缰绳
function item_12131(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,93);
        --道具id,道具数量，概率
        local bxtbl = {
			{25604,1,13},
			{25605,1,36},
			{25606,1,24},
			{25607,1,12},
			{25608,1,8}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--6阶马鞍
function item_12129(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,93);
        --道具id,道具数量，概率
        local bxtbl = {
			{27604,1,13},
			{27605,1,36},
			{27606,1,24},
			{27607,1,12},
			{27608,1,8}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--6阶马盔
function item_12130(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,93);
        --道具id,道具数量，概率
        local bxtbl = {
			{29604,1,13},
			{29605,1,36},
			{29606,1,24},
			{29607,1,12},
			{29608,1,8}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--6阶马蹄
function item_12132(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,93);
        --道具id,道具数量，概率
        local bxtbl = {
			{33604,1,13},
			{33605,1,36},
			{33606,1,24},
			{33607,1,12},
			{33608,1,8}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

function item_12133(item,count,event,player,type)
    local tb = {
		[1] = {[1] ={12129,"焚天神盔"},[2] = {12130,"焚天神链"},[3] = {12131,"焚天神镯"},[4] = {12132,"焚天神戒"}},
		[2] = {[1] ={12129,"焚天神盔"},[2] = {12130,"焚天神链"},[3] = {12131,"焚天神镯"},[4] = {12132,"焚天神戒"}},
		[3] = {[1] ={12129,"焚天神盔"},[2] = {12130,"焚天神链"},[3] = {12131,"焚天神镯"},[4] = {12132,"焚天神戒"}},
	};
    local mclass = player:GetClass();
    if tb[mclass][type] == nil then
        return 0;
    end
    if player:num_bag_black(0) >= 1 then
        player:add_item(tb[mclass][type][1],1,0,0,0,0);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

function item_12135(item, count, event, player)
    local titleid = 32
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12136(item, count, event, player)
    local titleid = 31
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12137(item, count, event, player)
    local titleid = 33
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

--5阶缰绳
function item_12140(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,175);
        --道具id,道具数量，概率
        local bxtbl = {
			{25505,1,48},
			{25506,1,64},
			{25507,1,32},
			{25508,1,16},
			{25509,1,8},
			{25510,1,4},
			{25511,1,2},
			{25512,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--5阶马鞍
function item_12138(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,175);
        --道具id,道具数量，概率
        local bxtbl = {
			{27505,1,48},
			{27506,1,64},
			{27507,1,32},
			{27508,1,16},
			{27509,1,8},
			{27510,1,4},
			{27511,1,2},
			{27512,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--5阶马盔
function item_12139(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,175);
        --道具id,道具数量，概率
        local bxtbl = {
			{29505,1,48},
			{29506,1,64},
			{29507,1,32},
			{29508,1,16},
			{29509,1,8},
			{29510,1,4},
			{29511,1,2},
			{29512,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--5阶马蹄
function item_12141(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,175);
        --道具id,道具数量，概率
        local bxtbl = {
			{33505,1,48},
			{33506,1,64},
			{33507,1,32},
			{33508,1,16},
			{33509,1,8},
			{33510,1,4},
			{33511,1,2},
			{33512,1,1}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--7阶缰绳
function item_12144(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,87);
        --道具id,道具数量，概率
        local bxtbl = {
			{25704,1,36},
			{25705,1,24},
			{25706,1,12},
			{25707,1,8},
			{25708,1,4},
			{25709,1,2},
			{25710,1,1},
			{25711,1,0}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--7阶马鞍
function item_12142(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,87);
        --道具id,道具数量，概率
        local bxtbl = {
			{27704,1,36},
			{27705,1,24},
			{27706,1,12},
			{27707,1,8},
			{27708,1,4},
			{27709,1,2},
			{27710,1,1},
			{27711,1,0}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--7阶马盔
function item_12143(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,87);
        --道具id,道具数量，概率
        local bxtbl = {
			{29704,1,36},
			{29705,1,24},
			{29706,1,12},
			{29707,1,8},
			{29708,1,4},
			{29709,1,2},
			{29710,1,1},
			{29711,1,0}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

--7阶马蹄
function item_12145(item,count,event,player)
    if player:num_bag_black(0) >= 1 then
        local n_rand = math.random(1,87);
        --道具id,道具数量，概率
        local bxtbl = {
			{33704,1,36},
			{33705,1,24},
			{33706,1,12},
			{33707,1,8},
			{33708,1,4},
			{33709,1,2},
			{33710,1,1},
			{33711,1,0}
        }
        local nAllItemCount = #bxtbl;
        local now_gailv = 0;
        for j = 1, nAllItemCount do
            local nowCfg = bxtbl[j];
            now_gailv = now_gailv + nowCfg[3];
            if n_rand <= now_gailv then
                player:add_item(nowCfg[1],nowCfg[2],0,0,0);
                break;
            end
        end
        return 1;
    else
        player:alert(21,0,0,"您的背包空间不足1格");
        return 0;
    end
end

function item_12146(item,count,event,player,type)
    local tb = {
		[1] = {[1] ={12142,"焚天神盔"},[2] = {12143,"焚天神链"},[3] = {12144,"焚天神镯"},[4] = {12145,"焚天神戒"}},
		[2] = {[1] ={12142,"焚天神盔"},[2] = {12143,"焚天神链"},[3] = {12144,"焚天神镯"},[4] = {12145,"焚天神戒"}},
		[3] = {[1] ={12142,"焚天神盔"},[2] = {12143,"焚天神链"},[3] = {12144,"焚天神镯"},[4] = {12145,"焚天神戒"}},
	};
    local mclass = player:GetClass();
    if tb[mclass][type] == nil then
        return 0;
    end
    if player:num_bag_black(0) >= 1 then
        player:add_item(tb[mclass][type][1],1,0,0,0,0);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

function item_12148(item, count, event, player)
    local titleid = 34
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12149(item, count, event, player)
    local titleid = 35
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12150(item, count, event, player)
    local titleid = 36
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12151(item, count, event, player)
    local titleid = 37
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12153(item, count, event, player)
    local titleid = 38
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12154(item, count, event, player)
    local titleid = 39
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12155(item, count, event, player)
    local titleid = 40
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12156(item, count, event, player)
    local titleid = 41
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12157(item,count,event,player,type)
    local tb = {
		[1] = {[1] ={25912,"焚天神盔"},[2] = {27912,"焚天神链"},[3] = {29912,"焚天神镯"},[4] = {33912,"焚天神戒"}},
		[2] = {[1] ={25912,"焚天神盔"},[2] = {27912,"焚天神链"},[3] = {29912,"焚天神镯"},[4] = {33912,"焚天神戒"}},
		[3] = {[1] ={25912,"焚天神盔"},[2] = {27912,"焚天神链"},[3] = {29912,"焚天神镯"},[4] = {33912,"焚天神戒"}},
	};
    local mclass = player:GetClass();
    if tb[mclass][type] == nil then
        return 0;
    end
    if player:num_bag_black(0) >= 1 then
        player:add_item(tb[mclass][type][1],1,0,0,0,0);
        return 1
    else
        player:alert(21,0,0,"您的背包空间不足")
        return 0
    end
end

function item_12159(item, count, event, player)
    local titleid = 42
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12160(item, count, event, player)
    local titleid = 43
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12161(item, count, event, player)
    local titleid = 44
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12162(item, count, event, player)
    local titleid = 45
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12164(item, count, event, player)
    local titleid = 46
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12165(item, count, event, player)
    local titleid = 47
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12166(item, count, event, player)
    local titleid = 48
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12168(item, count, event, player)
    local titleid = 49
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12169(item, count, event, player)
    local titleid = 50
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12170(item, count, event, player)
    local titleid = 51
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12172(item, count, event, player)
    local titleid = 52
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12173(item, count, event, player)
    local titleid = 53
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12174(item, count, event, player)
    local titleid = 54
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12176(item, count, event, player)
    local titleid = 55
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12177(item, count, event, player)
    local titleid = 56
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12178(item, count, event, player)
    local titleid = 57
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12179(item, count, event, player)
    local titleid = 58
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12181(item, count, event, player)
    local titleid = 59
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12182(item, count, event, player)
    local titleid = 60
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12183(item, count, event, player)
    local titleid = 61
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12185(item, count, event, player)
    local titleid = 62
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12186(item, count, event, player)
    local titleid = 63
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12187(item, count, event, player)
    local titleid = 64
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12189(item, count, event, player)
    local titleid = 65
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12190(item, count, event, player)
    local titleid = 66
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12191(item, count, event, player)
    local titleid = 67
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12193(item, count, event, player)
    local titleid = 68
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12194(item, count, event, player)
    local titleid = 69
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12195(item, count, event, player)
    local titleid = 70
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12197(item, count, event, player)
    local titleid = 71
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12198(item, count, event, player)
    local titleid = 72
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12199(item, count, event, player)
    local titleid = 73
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12201(item, count, event, player)
    local titleid = 74
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12202(item, count, event, player)
    local titleid = 75
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12203(item, count, event, player)
    local titleid = 76
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12205(item, count, event, player)
    local titleid = 77
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12206(item, count, event, player)
    local titleid = 78
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12207(item, count, event, player)
    local titleid = 79
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12209(item, count, event, player)
    local titleid = 80
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12210(item, count, event, player)
    local titleid = 81
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12211(item, count, event, player)
    local titleid = 82
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12213(item, count, event, player)
    local titleid = 83
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12214(item, count, event, player)
    local titleid = 84
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12215(item, count, event, player)
    local titleid = 85
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12217(item, count, event, player)
    local titleid = 86
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12218(item, count, event, player)
    local titleid = 87
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12219(item, count, event, player)
    local titleid = 88
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12221(item, count, event, player)
    local titleid = 89
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12222(item, count, event, player)
    local titleid = 90
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12223(item, count, event, player)
    local titleid = 91
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12225(item, count, event, player)
    local titleid = 92
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12226(item, count, event, player)
    local titleid = 93
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12227(item, count, event, player)
    local titleid = 94
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12229(item, count, event, player)
    local titleid = 95
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12230(item, count, event, player)
    local titleid = 96
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12231(item, count, event, player)
    local titleid = 97
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12233(item, count, event, player)
    local titleid = 98
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12234(item, count, event, player)
    local titleid = 99
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end

function item_12235(item, count, event, player)
    local titleid = 100
    local ret = player:IsHasTitle(titleid)
    if ret == 1 then
        player:alert(10,0,0,"你已经拥有该称号")
        return 0
    end
    player:AddTitle(titleid)
    player:alert(10,0,0,"成功获得称号")
    return count
end