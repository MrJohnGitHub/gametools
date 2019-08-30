function item_10220(item,count,event,player)
	local nItem = 100 * count
	player:ScriptPay(nItem);
	local nvip = player:get_player_type();
	OnUseVip(player,nvip,0,nItem);
	player:add_vcoin(nItem);
	player:alert(10,0,0,"元宝 + "..nItem.."，当前持有："..player:get_vcoin());
	return count;
end

function item_10221(item,count,event,player)
	local nItem = 200 * count
	player:ScriptPay(nItem);
	local nvip = player:get_player_type();
	OnUseVip(player,nvip,0,nItem);
	player:add_vcoin(nItem);
	player:alert(10,0,0,"元宝 + "..nItem.."，当前持有："..player:get_vcoin());
	return count;
end

function item_10222(item,count,event,player)
	local nItem = 300 * count
	player:ScriptPay(nItem);
	local nvip = player:get_player_type();
	OnUseVip(player,nvip,0,nItem);
	player:add_vcoin(nItem);
	player:alert(10,0,0,"元宝 + "..nItem.."，当前持有："..player:get_vcoin());
	return count;
end

function item_10223(item,count,event,player)
	local nItem = 500 * count
	player:ScriptPay(nItem);
	local nvip = player:get_player_type();
	OnUseVip(player,nvip,0,nItem);
	player:add_vcoin(nItem);
	player:alert(10,0,0,"元宝 + "..nItem.."，当前持有："..player:get_vcoin());
	return count;
end

function item_10224(item,count,event,player)
	local nItem = 1000 * count
	player:ScriptPay(nItem);
	local nvip = player:get_player_type();
	OnUseVip(player,nvip,0,nItem);
	player:add_vcoin(nItem);
	player:alert(10,0,0,"元宝 + "..nItem.."，当前持有："..player:get_vcoin());
	
	local double_type = g_double_charge[nItem];
	if double_type then
		local double_flag = player:get_param(472);
		if bitget(double_flag,double_type) == 0 then
			player:SendSystemMail("首充双倍","    亲爱的玩家，恭喜您完成<font color='#0be140'>" .. nItem .. "元宝</font>首次充值，GM赠送的<font color='#0be140'>" .. nItem .. "绑元</font>已到帐，请注意查收<br>    完成其他档次的首充可继续领取等额绑元，<font color='#0be140'>游戏中绑元与元宝等值哦～</font><br><br>                    新焚天之怒策划 小妮"	,"[0,0,0,0,0,0]","[0,0,0,0]",1);
			player:set_param(472,bitset(double_flag,double_type));
			local obj = {};
			obj.flag = player:get_param(472);
			player:SendPacketToSelf(4436,0,encode(obj));
			player:add_vcoin_bind(nItem);
		end
	end
	
	return count;
end