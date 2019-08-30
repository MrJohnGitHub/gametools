function mon7023(mon,event,player)
	local MonName = mon:GetName();
	local PlayerName = player:GetName();
	SendCenterTextToWorld(15,0,0,"【全民特戒】特戒BOSS<font color='#00ccff'>"..MonName.."</font>被<font color='#00ccff'>"..PlayerName.."</font>击杀了，掉落了特戒碎片(中)！");
end
