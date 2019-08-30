--==============礼券兑换活动================================================
function GiftExchangeActivityStatus(player)
	local gift_buy_conf,start,over = GetOperActivityConfig(g_Gift_Exchange)
	if gift_buy_conf == nil then
		return 0, 0, 0, 0;
	end
	return 1,start,over,0;
end

function clearGiftExchangeActivityInfo(player)
	local ParamKey = 450;
	player:set_param_type(ParamKey, 0)
		player:set_param(451,0);
		player:set_param(452,0);
		player:set_param(453,0);
		player:set_param(454,0);
		player:set_param(455,0);
		player:set_param(456,0);
		player:set_param(457,0);
		player:set_param(458,0);
end

function GiftExchangeActivityInfo(player)
	local ParamKey = 450;
	local TIME_PARAM_KEY = 836
	local conf, startTime, endTime = GetOperActivityConfig(g_Gift_Exchange)
	if conf == nil then
		--print_r("活动时间配置错误");
		return;
	end
	local flag = IsResetActivityAwardFlagInfo(player, conf, ParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_type(ParamKey, conf.version)
		player:set_param(451,0);
		player:set_param(452,0);
		player:set_param(453,0);
		player:set_param(454,0);
		player:set_param(455,0);
		player:set_param(456,0);
		player:set_param(457,0);
		player:set_param(458,0);
	end

	local retMsg = 
	{
		startTime = startTime,
		endTime = endTime,
		actid = 53,
		needItem = conf.ChangeItem,
		award = {};
		icon = conf.icon;
	}
	local targ = {};
	for i=1,8 do
		targ = {};
		targ.id = i;
		targ.itemid = conf["award"][i][1];
		targ.count = conf["award"][i][2];
		targ.bind = conf["award"][i][3];
		targ.exchange = conf["award"][i][4];
		targ.limit = conf["award"][i][5];
		targ.hasnum = player:get_param(450 + i);
		table.insert(retMsg.award,targ);
	end	

	-- print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_INFO_MSG_ID, 0, encode(retMsg))
end

function HandlerGetGiftExchangeActivityAwardByIndex(player,index)
	if index < 1 or index > 8 then
		player:alert(10,0,0,"礼券兑换兑换位置 "..index.." 请求错误");
		return;
	end
	local conf, startTime, endTime = GetOperActivityConfig(g_Gift_Exchange)
	if conf == nil then
		player:alert(10,0,0,"礼券兑换活动配置不存在");
		return;
	end
	local itemCof = conf["award"];
	if itemCof == nil then
		player:alert(10,0,0,"礼券兑换道具配置不存在");
		return;
	end
	local hasnum = player:get_param(450 + index) + 1;
	if itemCof[index][5] > 0 then	
		if hasnum > itemCof[index][5] then
			player:alert(10,0,0,"剩余次数不足");
			return;
		end
	end
	if player:num_bag_black() < 1 then
		player:alert(10,0,0,"背包空间不足，请及时清理");
		return;
	end
	if player:num_item(conf["ChangeItem"]) < itemCof[index][4] then
		player:alert(10,0,0,"代币不足，通过参加[特惠活动]可获得活动代币");
		return;
	end
	if player:remove_item(conf["ChangeItem"],itemCof[index][4],0) == true then
		player:add_item(itemCof[index][1],itemCof[index][2],itemCof[index][3],0,0,0);
		player:set_param(450 + index,hasnum);
		player:set_param_misc(450 + index,itemCof[index][6]);
		local obj = {};
		obj.actid = 53;
		obj.id = index;
		obj.hasnum = hasnum;
		player:SendPacketToSelf(4802,0,encode(obj));
	end
end