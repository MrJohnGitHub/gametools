function ontalkvip100_0(player)
	local nvip = player:get_player_type();
	local ncjsl = player:get_vcoin_worth();
	local obj = {};
	local arr = {};
	local target = {};
	
	obj.vipLevel = nvip;
	obj.num = ncjsl;
	obj.reward = player:get_param(441);
	local tempvip = g_get_param(3);
	if tempvip <= 50 then
		tempvip = tempvip + (tempvip-tempvip%5)/5*2;
	elseif tempvip <= 150 then
		tempvip = tempvip + 20 + (tempvip-50 - (tempvip-50)%5)/5*3;
	elseif tempvip <= 200 then
		tempvip = tempvip + 80 + (tempvip-150 - (tempvip-150)%5)/5;
	else
		tempvip = tempvip + 90;
	end
	obj.VipNum = tempvip;
		
	target.id = 1;
	target.flag = player:get_param(340);
	table.insert(arr,target);
	obj.addr = arr;

	player:SendPacketToSelf(2320,0,encode(obj));
end

function ontalkvip100_1(player)
	local nvip = player:get_player_type();

	if nvip >= 1 and nvip <= #vipBuff then
	 	if player:get_param(340) == 0 then
	 		player:set_param(340,1);
	 		player:set_status(2100 + nvip,vipBuff[nvip][1],0,7);
	 		player:alert(10,0,0,"成功领取VIP经验BUFF");
	 		ontalkvip100_0(player);
	 	else
	 		player:alert(10,0,0,"很遗憾，你今日已经领取过");
	 	end
	end
end

function ontalkvip100_2(player,funid)
	local nvip = player:get_player_type();

	local param441 = player:get_param(441);
	if bitget(param441,funid) == 0 then
		if nvip >= funid then
			if player:num_bag_black() >= 6 then
				player:set_param(441,bitset(param441,funid));
				for i = 1,6 do
					player:add_item(VipReward[funid][i][1],VipReward[funid][i][2],VipReward[funid][i][3],0,0,1);
				end
				g_broadcast(12,0,0,"<font color='#00ccff'>"..player:GetName().."</font>领取了VIP"..funid.."等级大礼包，狂霸酷炫，谁与争锋！".."<font color='#0be140'>{_showSysWin,我也要领取,OPEN_VIP}</font>");
				--player:alert(10,0,0,"恭喜您领得VIP"..nvip.."奖励！");
			else
				player:alert(10,0,0,"很抱歉，您的背包空格不足");
				--player:SendSystemMail("VIP奖励","由于背包不足，您的奖励通过邮件发送","["..vipsj[funid]..",1]","[0,0,0,0]",1);
			end	
		end
	else
		player:alert(21,0,0,"该等级VIP奖励已领！");
	end
	ontalkvip100_0(player);
end
