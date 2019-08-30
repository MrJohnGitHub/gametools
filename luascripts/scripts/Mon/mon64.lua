function mon8201(mon,event,player)
	local nItem = 50000;
	player:add_gamemoney_bind(nItem);
	player:alert(20,0,0,"绑定金币+"..nItem);
end
