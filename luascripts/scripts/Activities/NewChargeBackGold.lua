local ACT_ID = 63
local ParamKey = 769
local OPT_TYPE = 254 
local GOLD_TYPE = 114
local CONSUME_TYPE = 0
local FLY = 0
local TIME_PARAM_KEY = 837

local function NewGetChargeBackGoldTimes(player,charge_num,conf)	
	local len = #conf.award;
	local times = 0;
	for i = 1,len do
		if charge_num < conf.award[i].chargeGold then
			times = i - 1;
			break;
		end
	end
	if charge_num >= conf.award[len].chargeGold then
		times = len;
	end
	return times
end

function clearNewChargeBackGoldActivityInfo(player)	
		player:set_param_action(ParamKey, 0)
		player:set_param_misc(ParamKey, 0)
		player:set_param_type(ParamKey, 0)
end

--发送给客户端配置和信息
function NewChargeBackGoldActivityInfo(player)
	local conf, startTime, endTime = GetOperActivityConfig(G_New_Charge_Back_Gold)
	local flag = IsResetActivityAwardFlagInfo(player, conf, ParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true and conf ~= nil then
		player:set_param_action(ParamKey, 0)
		player:set_param_misc(ParamKey, 0)
		player:set_param_type(ParamKey, conf.version)
		if g_get_param(80) == 0 then
			if g_get_param(75) ~= conf.version then
				NewDelAllChargeBackGoldLog()
				g_set_param(75,conf.version)
				g_set_param(80,conf.overtimeStamp)
			end
		elseif g_get_param(80) ~= conf.overtimeStamp then
			NewDelAllChargeBackGoldLog()
			g_set_param(75,conf.version)
			g_set_param(80,conf.overtimeStamp)
		end
		
	end
	local action, misc, type_ = player:get_param_all_info(ParamKey)
	local retMsg = 
	{
		startTime = startTime,
		endTime = endTime,
		actid = ACT_ID,
		useTimes = action
	}	

	if conf ~= nil then
		retMsg.award = conf.award
		retMsg.icon = conf.icon
		local charge_num = player:GetGreaterParam(startTime - 3600,endTime);
		retMsg.charge_num = charge_num
		retMsg.hasTimes = NewGetChargeBackGoldTimes(player,charge_num,conf);
	end
	-- print_r(retMsg)
	player:SendPacketToSelf(OPERATING_REQ_INFO_MSG_ID, 0, encode(retMsg))
	NewHandleChargeBackGoldLogList(player);
end

--检测整个活动是否符合条件领奖
function CheckNewChargeBackGoldCanGetAward(player, conf)
	local conf, startTime, endTime = GetOperActivityConfig(G_New_Charge_Back_Gold)
	local flag = IsResetActivityAwardFlagInfo(player, conf, ParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true and conf ~= nil then
		player:set_param_action(ParamKey, 0)
		player:set_param_misc(ParamKey, 0)
		player:set_param_type(ParamKey, conf.version)
		if g_get_param(75) ~= conf.version then
			NewDelAllChargeBackGoldLog()
			g_set_param(75,conf.version)
		end
	end
	local action, misc, type_ = player:get_param_all_info(ParamKey)
	if conf ~= nil then
		local charge_num = player:GetGreaterParam(startTime - 3600,endTime);
		local hasTimes = NewGetChargeBackGoldTimes(player,charge_num,conf);
		if hasTimes > action and player:get_vcoin() >= conf.award[action+1].needGold then
			return 1
		end
	end
	return 0;
end



--抽奖
function HandlerNewChargeBackGoldAwardByIndex(player, index)
	--判断
	local conf, startTime, endTime = GetOperActivityConfig(G_New_Charge_Back_Gold)
	local action, misc, type_ = player:get_param_all_info(ParamKey)
	if conf == nil then
		return;
	end
	local charge_num = player:GetGreaterParam(startTime - 3600,endTime);
	local hasTimes = NewGetChargeBackGoldTimes(player,charge_num,conf);
	if hasTimes <= action then
		return;
	end
	action = action + 1
	if player:get_vcoin() < conf.award[action].needGold then
		player:alert(10,0,0,"元宝不足");
		return;
	end  
	local obj = {};
	if index == 0 then
		local randomNum = math.random(1, conf.award[action].itemCount);
		local ret = 0;
		local nCount = 0;
		for i = 1, #conf.award[action].awardList do 
			nCount = nCount + conf.award[action].awardList[i].count;
			if randomNum <= nCount then
				ret = i;
				break;
			end
		end
		player:set_param_misc(ParamKey, ret)	
		obj.index = 0;	
		obj.ret = ret;
		obj.actid    = ACT_ID;
		player:SendPacketToSelf(OPERATING_REQ_GET_AWARD_MSG_ID,0,encode(obj));
		return;
	end
	if misc == 0 then
		return;
	end	
	local gold_num = conf.award[action].needGold *  conf.award[action].awardList[misc].itemid/10000;
	local add_gold = gold_num - conf.award[action].needGold;
	player:sub_vcoin(conf.award[action].needGold, false,GOLD_TYPE);
	player:add_vcoin(gold_num,GOLD_TYPE);
	player:SendVcoinFly(gold_num, 10, 0);
	g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>投注<font color='#00ccff'>" .. conf.award[action].needGold .. "</font>元宝转动幸运转盘，获得".. "<font color='#00ccff'>"..gold_num.."</font>元宝<u><font color='#0be140'>{_showSysWin,我也要转一转，一万变十万,Open_Festive,63}</font></u>");
	player:set_param_action(ParamKey, action)
	player:set_param_misc(ParamKey, 0)
	--插入记录
	local logSize = NewGetChargeBackGoldLogSize();
	if logSize >= g_ChargeBackGold_LogMaxNum then
		local delCount = logSize - g_ChargeBackGold_LogMaxNum + 1
		for i = delCount, 1, -1 do
			NewDelChargeBackGoldLog()	
		end		
	end
	NewAddChargeBackGoldLog(player,conf.award[action].awardList[misc].itemid , gold_num, action)
	obj = {};
	local curTimeStamp = os.time();
	obj.actid    = ACT_ID;
	obj.name = player:GetName();
	obj.rate = conf.award[action].awardList[misc].itemid;
	obj.gold_num = gold_num;
	obj.time = curTimeStamp;
	player:SendPacketToSelf(4806,0,encode(obj));

	obj = {};
	obj.actid    = ACT_ID;
	obj.useTimes = action;
	obj.index = 1;
	player:SendPacketToSelf(OPERATING_REQ_GET_AWARD_MSG_ID,0,encode(obj));
end


--重置版本，并判断是否有奖励可以领取
function IsNewChargeBackGoldActivityHasAward(player, conf)
	local flag = IsResetActivityAwardFlagInfo(player, conf, ParamKey, TIME_PARAM_KEY, conf and conf.overtimeStamp)
	if flag == true then
		player:set_param_action(ParamKey, 0)
		player:set_param_misc(ParamKey, 0)
		player:set_param_type(ParamKey, conf.version)
		if g_get_param(75) ~= conf.version then
			NewDelAllChargeBackGoldLog()
			g_set_param(75,conf.version)
		end
	end
	local status = CheckNewChargeBackGoldCanGetAward(player, conf)
	return status
end

--获取是否开启和是否能领奖
function NewChargeBackGoldActivityStatus(player)
	local conf, startTime, endTime = GetOperActivityConfig(G_New_Charge_Back_Gold)
	if conf ~= nil then
		local status = IsNewChargeBackGoldActivityHasAward(player, conf)
		return 1, startTime, endTime, status
	end
	return 0, 0, 0, 0
end