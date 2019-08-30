function MapPlayDie(map,player,killer)
	player:ReviveNotice(0,0);
end

function Map238_PlayDie(map,player,killer)
	local xyQxzb = #activity_qxzb_xy;
	for t=1,xyQxzb do
		 if activity_qxzb_xy[t][2] == player:GetX() and activity_qxzb_xy[t][3] == player:GetY() and activity_qxzb_xy[t][1] == 1 then
		 		player:NewSendMapSystemNotice(15,"<font color='#00ccff'>"..player:GetName().."</font>在<font color='#be0af1'>紫色喷点</font>伤被击杀，快去抢占喷点");
		 		player:ReviveNotice(0,0);
		 	 return;
		 end 
	end
	player:ReviveNotice(0,0);
end
