function ontalk1968(npc,event,player)
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
只为证明
#&task_content#&

#&talk_line#&
		BOSS之家，游戏内所有的BOSS都会出现在里面,刷
		新最快，数量最多，掉落最丰富

#&talk_line#&
		1、进入条件：<font color='#21d119'>成为VIP3或boss之家令牌*1</font>
		2、BOSS掉落：<font color='#21d119'>全系列装备，全系列材料</font>
		3、BOSS刷新：<font color='#21d119'>15-180分钟</font>

#&talk_line#&

			   <u><a href='event:M2402,1'>进入BOSS之家二层</a></u>
  ]]);
end

function CreatureNpcFun1968(npc,event,player,funid)
	if funid == 1 then
		ontalk1968_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1968(npc,event,player,npcid)

end

function ontalk1968_1(npc,player)
	local nvip = player:get_player_type();
	if nvip >= 3 then
		player:randomthismap(46);
	elseif player:package_item(19080) >= 1 then
		player:remove_item(19080,1,0);
		player:randomthismap(46);
	else
		player:alert(21,0,0,"对不起，您的条件不足无法进入BOSS之家!");
	end
end