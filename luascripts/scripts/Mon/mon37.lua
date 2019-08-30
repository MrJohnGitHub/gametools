function mon8740(mon,event,player)
	local nrandom = math.random(1,2);
	local item = {
	[101000]=10314,
	[102000]=10315,
	[103000]=10316,
	[104000]=10317,
	[105000]=10318,
	[106000]=10319,
	[107000]=10320,
	[108000]=10321,
	[109000]=10322,
	[110000]=10323
	};
	local nitem = item[player:get_param(425)];
	local nitemcount = 5;
	if nrandom == 1 then
		nitemcount = 10;
	end
	local obj = {};
	obj.soulID = nitem;
	obj.num  = nitemcount;
	player:SendPacketToSelf(3210,0,encode(obj));
	if player:num_bag_black() >= 1 then
		player:add_item(nitem,nitemcount,1,0,0);
	else
		player:SendSystemMail("全民屠杀奖励","您的奖励","["..nitem..","..nitemcount.."]","[0,0,0,0]",1);
	end
end