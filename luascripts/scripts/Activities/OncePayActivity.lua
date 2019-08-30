local TIME_PARAM_KEY = 838;
function OncePayActivityStatus(player)
	local gift_buy_conf,start,over = GetOperActivityConfig(g_Once_Pay)
	if gift_buy_conf == nil then
		return 0, 0, 0, 0;
	end
	return 1,start,over,0;
end

function clearPayActivityInfo(player)
	local ParamKey = 745;
		player:set_param_type(ParamKey, 0)
		player:set_param(746,0);
		player:set_param_misc(746,0)
		player:set_param(747,0);
		player:set_param_misc(747,0)
		player:set_param(748,0);
		player:set_param_misc(748,0)
		player:set_param(749,0);
		player:set_param_misc(749,0)
		player:set_param(750,0);
		player:set_param_misc(750,0)
end

function PayActivityInfo(player)
	local ParamKey = 745;
	local conf, startTime, endTime = GetOperActivityConfig(g_Once_Pay)
	if conf == nil then
		player:alert(10, 0, 0, "单笔充值活动时间配置错误");
		return;
	end
	local flag = IsResetActivityAwardFlagInfo(player, conf, ParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_type(ParamKey, conf.version)
		player:set_param(746,0);
		player:set_param_misc(746,0)
		player:set_param(747,0);
		player:set_param_misc(747,0)
		player:set_param(748,0);
		player:set_param_misc(748,0)
		player:set_param(749,0);
		player:set_param_misc(749,0)
		player:set_param(750,0);
		player:set_param_misc(750,0)
	end

	local retMsg = 
	{
		startTime = startTime,
		endTime = endTime,
		actid = 56,
		icon = conf.icon,
		award = {};
	}

	local obj = {};
	for i=1,5 do
		obj = {};
		obj.id = i;
		obj.payNum = conf.award[i].payNum;
		obj.items = conf.award[i].items;
		
		local param, num = player:get_param_all_info(745 + i);
		if conf.award[i].limit > param then
			obj.limit = conf.award[i].limit - param;
		else
			obj.limit = 0;
		end
		obj.num = num;
		table.insert(retMsg.award,obj);
	end	

	--print_r(retMsg)
	player:SendPacketToSelf(4801, 0, encode(retMsg))
end

function HandlerPayActivityAwardByIndex(player,index)
	if index < 1 or index > 5 then
		player:alert(10,0,0,"单笔充值奖励位置 "..index.." 请求错误");
		return;
	end
	local conf, startTime, endTime = GetOperActivityConfig(g_Once_Pay)
	if conf == nil then
		player:alert(10,0,0,"单笔充值活动配置不存在");
		return;
	end
	local itemCof = conf["award"][index];
	if itemCof == nil then
		player:alert(10,0,0,"单笔充值道具配置不存在");
		return;
	end
	local param, num = player:get_param_all_info(745 + index);
	param = param + 1;
	if param > itemCof["limit"] then
		player:alert(10,0,0,"领取次数达到上限");
		return;		
	end
	if num == 0 then
		player:alert(10,0,0,"请先进行充值");
		return;
	end
	if player:num_bag_black() < itemCof["itemCount"] then
		player:alert(10,0,0,"背包空间不足，请及时清理");
		return;
	end
	player:set_param(745 + index,param);
	player:set_param_misc(745 + index,num - 1);
	for i=1,#itemCof["items"] do
		player:add_item(itemCof["items"][i]["itemid"],itemCof["items"][i]["count"],itemCof["items"][i]["bind"],0,0,0);
	end
	
	local obj = {};
	obj.actid = 56;
	obj.id = index;
	obj.limit = itemCof["limit"] - param;
	obj.num = num - 1;
	player:SendPacketToSelf(4802,0,encode(obj));
end

function AddOncePayActivity(player,ndccz)
	local ParamKey = 745;
	local conf, startTime, endTime = GetOperActivityConfig(g_Once_Pay)
	if conf == nil then
		--player:alert(2, 0, 0, "单笔充值活动时间配置错误");
		return;
	end
	local flag = IsResetActivityAwardFlagInfo(player, conf, ParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_type(ParamKey, conf.version)
		player:set_param(746,0);
		player:set_param_misc(746,0)
		player:set_param(747,0);
		player:set_param_misc(747,0)
		player:set_param(748,0);
		player:set_param_misc(748,0)
		player:set_param(749,0);
		player:set_param_misc(749,0)
		player:set_param(750,0);
		player:set_param_misc(750,0)
	end
	local itemCof = conf["award"];
	if itemCof == nil then
		player:alert(2, 0, 0, "单笔充值活动奖励配置错误");
		return;
	end
	local index = 0;
	for i=1,5 do
		if ndccz < itemCof[i]["payNum"] then
			break;
		end
		index = i;
	end
	if index > 0 then
		local param, num = player:get_param_all_info(745 + index);
		player:set_param_misc(745 + index,num + 1);
		
		local obj = {};
		obj.actid = 56;
		obj.id = index;
		obj.num = num + 1;
		player:SendPacketToSelf(4802,0,encode(obj));
	end
end