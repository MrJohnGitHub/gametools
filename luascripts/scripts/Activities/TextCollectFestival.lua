local ACT_ID = 51
local OPT_TYPE = 255 
local CONSUME_TYPE = 0
local FLY = 0

function clearTextCollectActivityInfo(player)
end

function TextCollectActivityInfo(player)
	local conf, startTime, endTime = GetOperActivityConfig(G_Festival_Text_Collect_Config)
	local retMsg = 
	{
		startTime = startTime,
		endTime = endTime,
		actid = ACT_ID
	}	
	if conf ~= nil then
		retMsg.award = conf.award
		retMsg.icon = conf.icon
		-- print_r(retMsg)
	end
	player:SendPacketToSelf(OPERATING_REQ_INFO_MSG_ID, 0, encode(retMsg))
	
end


function HandlerTextCollectActivityAwardByIndex(player, index)
	--判断
	local conf = GetOperActivityConfig(G_Festival_Text_Collect_Config)
	if conf == nil or conf.award == nil then 
		local errMsg = "奖励配置不存在"
		player:alert(10,0,0,errMsg)
		return 
	end
	if player:num_bag_black() < 1 then
		player:alert(10,0,0,"背包空间不足，请及时处理");
		return;
	end
	local text_config = conf.award[index].awardList;
	local len = #text_config;
	for i = 1,len - 1 do
		if player:num_item(text_config[i].itemid) < text_config[i].count then
			player:alert(10,0,0,"材料不足，兑换失败");
			return;
		end
	end
	for i = 1,len - 1 do
		player:remove_item(text_config[i].itemid,text_config[i].count,0);
	end
	player:NewAddItem(text_config[len].itemid, text_config[len].count, OPT_TYPE, CONSUME_TYPE, FLY, text_config[len].bind)
	local obj = {};
	obj.actid    = ACT_ID;
	obj.ret      = 1;
	player:SendPacketToSelf(OPERATING_REQ_GET_AWARD_MSG_ID,0,encode(obj));
end

function TextCollectFestivalActivityStatus(player)
	local conf, startTime, endTime = GetOperActivityConfig(G_Festival_Text_Collect_Config)
	if conf ~= nil then
		return 1, startTime, endTime, 0
	end
	return 0, 0, 0, 0
end
		