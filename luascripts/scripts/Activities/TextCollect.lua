function CheckTextCollectIcon(player)
	local start, over = GetActivityStartAndOverTimeStamp(G_Text_Collect_Config)
	local cur = os.time()
	if cur < start or cur >= over then
		return false
	end
	return true, status, start, over
end

function OnTextCollectInfo(player,id)
	local start, over = GetActivityStartAndOverTimeStamp(G_Text_Collect_Config);
	local obj = {};
	obj.start_time = start;
	obj.end_time   = over;
	player:SendPacketToSelf(4671,0,encode(obj));
end

function OnTextCollectReward(player,type, id)
	local start, over = GetActivityStartAndOverTimeStamp(G_Text_Collect_Config);
	local cur = os.time()
	if start > cur or cur >= over then
		player:alert(10,0,0,"活动已经过期了");
		return
	end
	if player:num_bag_black() < 1 then
		player:alert(10,0,0,"背包空间不足，请及时处理");
		return;
	end
	
	local text_config = G_Text_Collect_Config.reward[type];
	if text_config == nil then
		return;
	end
	local len = #text_config - 1;
	local addCount = text_config[len + 1]
	for i = 1,len - 1 do
		if player:num_item(text_config[i]) < 1 then
			player:alert(10,0,0,"材料不足，兑换失败");
			return;
		end
	end
	for i = 1,len - 1 do
		player:remove_item(text_config[i],1,0);
	end
	player:add_item(text_config[len],addCount,1,0,0,0);
	local obj = {};
	obj.ret   = 1;
	player:SendPacketToSelf(4672,0,encode(obj));
end