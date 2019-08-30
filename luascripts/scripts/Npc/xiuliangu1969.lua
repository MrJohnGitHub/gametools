function ontalk1969(npc,event,player)	
		player:echo(0,npc:GetLowGUID(),[[


#&talk_line#&

                          <u><a href='event:M2402,1'>进入生死道</a></u>


		]]);
end


function CreatureNpcFun1969(npc,event,player,funid)
	if funid == 1 then
		ontalk1969_1(npc,player);
		return;
	end
end

function CreatureNpcSceneNpcStatus1969(npc,event,player,npcid)

end

function ontalk1969_1(npc,player)
	local h = tonumber(os.date("%H",os.time()));
	local m = tonumber(os.date("%M",os.time()));
	if h >= 12 then
		if player:get_gamemoney_bind() >= 1000000 then
			player:sub_gamemoney_bind(1000000);
			player:randomthismap(85);
		else
			player:alert(21,0,0,"对不起，您的绑定金币不足1000000!")
		end
	else
		player:alert(21,0,0,"对不起，当前未到12点无法进入!")
	end
end
