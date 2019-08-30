function ontalk1973(npc,event,player)
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
困惑、困惑、到底什么是困惑？希望你击杀
困惑魔王可以给我一个答案!!!
#&task_content#&

#&talk_line#&

                 当前困惑魔王刷新状态：<font color="#28FF28">已刷新</font>

                   进入条件：80级以及以上
                   进入门票：500礼金
                   BOSS刷新：6小时刷新一次

                         <u><a href='event:M2402,1'>进入困惑殿堂</a></u>

#&talk_line#&
  ]]);
end

function CreatureNpcFun1973(npc,event,player,funid)
	if funid == 1 then
		ontalk1973_1(npc,player);
		return;
	end
end
	
function CreatureNpcSceneNpcStatus1973(npc,event,player,npcid)

end


function ontalk1973_1(npc,player)
	if player:get_level() >= 80 then
		if player:get_gamemoney() >= 500 then
			player:sub_gamemoney(500);
			player:enter_map(62,22,24,3);
		else
			player:alert(21,0,0,"对不起，您的礼金不足500无法进入困惑殿堂");
		end
	else
		player:alert(21,0,0,"对不起，您的级别不足80级无法进入困惑殿堂")
	end
end