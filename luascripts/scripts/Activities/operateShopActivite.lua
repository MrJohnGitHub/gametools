function OperateShopActivityStatus(player)
	local conf,start,over = GetOperActivityConfig(g_operate_shop)
	if conf == nil then
		return 0, 0, 0, 0;
	end
	return 1,start,over,0;
end

function clearOnInitOperateShop(player,type)	
	 player:set_param(254,0);
end

function OnInitOperateShop(player,type)	
	local conf, startTime, endTime = GetOperActivityConfig(g_operate_shop)
	if conf == nil then
		--print_r("活动时间配置错误");
		return false;
	end
	
	if type == nil then
		--player:alert(2,0,0,"111");
		local param843 = player:get_param(843);
		if param843 == 0 then
			local param254 = player:get_param(254);
			if param254 == conf["version"] and player:get_param(388) > os.time() then
				--player:alert(2,0,0,"222");
				player:GetOperateShopList(conf["icon"]);
				return false;
			end
		elseif param843 == startTime and player:get_param(388) > os.time() then
			player:GetOperateShopList(conf["icon"]);
			return false;
		end
	else
		local now_money = player:get_vcoin();
		if now_money < conf["award"]["money"] then
			player:alert(10,0,0,"元宝不足");
			return false;			
		end
		player:sub_vcoin(conf["award"]["money"]);
	end
	--player:alert(2,0,0,"333");
    player:set_param(389,conf["award"]["update"]);
    player:set_param(388,conf["award"]["update"] + os.time());
    
    local target = {};
    local rate = 0;
    local index = 0;   
    for i=1,4 do
    	table.insert(target,i);
    	rate = conf["award"][i][1];
    	index = math.random(0,rate - 1);
    	for j=1,#conf["award"][i][2] do
			if  index < conf["award"][i][2][j][6] then		
				table.insert(target,conf["award"][i][2][j][1]);
				table.insert(target,conf["award"][i][2][j][2]);
				table.insert(target,conf["award"][i][2][j][3]);
				table.insert(target,conf["award"][i][2][j][4]);
				table.insert(target,conf["award"][i][2][j][5]);
				table.insert(target,0);
				table.insert(target,conf["award"][i][2][j][7]);
				table.insert(target,conf["award"][i][2][j][8]);
				break;
			end
		end
    end   
    player:set_param(254,conf["version"]);
    player:set_param(843,startTime);
    player:InitOperateShop(target,conf["award"]["item"][1],conf["award"]["item"][2],conf["award"]["item"][3],conf["award"]["item"][4]);
    player:GetOperateShopList(conf["icon"]);
    return true
end