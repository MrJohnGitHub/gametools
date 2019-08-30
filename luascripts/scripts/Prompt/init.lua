function OnLoot(event,player,mon,num,itemid)
	local GetName = player:GetName();
	local MapId = player:GetMapId();
	if MapId == 439 then
		return;
	end
	local MapName = player:get_mapname(MapId);
	local MonName = mon:GetName();
	g_alert("<font color='#00ccff'>"..GetName.."</font>在<font color='#00ccff'>"..MapName.."</font>击杀<font color='#00ccff'>"..MonName.."</font>掉落了{_equip,"..itemid.."}",2,0,0,1);
	return;
end




