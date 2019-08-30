function ontalk1954(npc,event,player)
    player:echo(0,npc:GetLowGUID(),[[
title^chuansongy|
image^anquanquyu|
line|
text^<u><a href='event:M2411,1,73,85'><font color="#54bb34">神武王城</font></a></u>^前往神武王城|
text^<u><a href='event:M2411,272,27,45'><font color="#54bb34">天 羽 村</font></a></u>^前往天羽村|
text^<u><a href='event:M2411,17,106,135'><font color="#54bb34">天 星 城</font></a></u>^前往天星城|
|
image^jipinzhuanbei|
line|
text^<u><a href='event:M2411,1,89,104,task_track_link_npc,1,89,105,129'><font color="#54bb34">八大禁地</font></a></u>^前往八大禁地|
text^<u><a href='event:M2411,1,92,100,task_track_link_npc,1,93,99,151'><font color="#54bb34">末日168</font></a></u>^前往末日168|
text^<u><a href='event:M2411,1,85,99,task_track_link_npc,1,85,101,128'><font color="#54bb34">地狱18层</font></a></u>^前往地狱18层|
text^<u><a href='event:M2411,1,84,92,task_track_link_npc,1,85,92,123'><font color="#54bb34">打宝副本</font></a></u>^前往打宝|
|

image^fengfuhuodong|
line|
text^<u><a href='event:M2411,1,76,122,task_track_link_npc,1,77,120,124'><font color="#54bb34">谁与争锋</font></a></u>^前往谁与争锋|
text^<u><a href='event:M2411,1,75,111,task_track_link_npc,1,75,113,135'><font color="#54bb34">奔跑兄弟</font></a></u>^前往奔跑兄弟|
text^<u><a href='event:M2411,1,63,117,task_track_link_npc,1,65,117,117'><font color="#54bb34">PK泡点</font></a></u>^前往PK泡点|
text^<u><a href='event:M2411,1,66,122,task_track_link_npc,1,66,122,118'><font color="#54bb34">夺宝奇兵</font></a></u>^前往夺宝奇兵|
|
text^<u><a href='event:M2411,1,75,89,task_track_link_npc,1,76,88,125'><font color="#54bb34">膜拜城主</font></a></u>^前往膜拜城主|
text^<u><a href='event:M2411,1,72,126,task_track_link_npc,1,73,125,121'><font color="#54bb34">疯狂挖矿</font></a></u>^前往疯狂挖矿|
text^<u><a href='event:M2411,1,80,116,task_track_link_npc,1,80,118,130'><font color="#54bb34">群雄争霸</font></a></u>^前往群雄争霸|
text^<u><a href='event:M2411,17,151,166'><font color="#54bb34">攻城激战</font></a></u>^前往攻城战|
|
text^<u><a href='event:M2411,1,64,76,task_track_link_npc,1,63,76,163'><font color="#54bb34">神羽秘境</font></a></u>^前往神羽秘境|
text^<u><a href='event:M2411,1,63,72,task_track_link_npc,1,62,72,162'><font color="#54bb34">宝石秘境</font></a></u>^前往宝石秘境|
text^<u><a href='event:M2411,1,60,73,task_track_link_npc,1,60,74,164'><font color="#54bb34">魂珠秘境</font></a></u>^前往魂珠秘境|
text^<u><a href='event:M2411,1,65,73,task_track_link_npc,1,65,73,161'><font color="#54bb34">血玉秘境</font></a></u>^前往血玉秘境|
|

image^qiangboss|
line|
text^<u><a href='event:M2411,1,88,86,task_track_link_npc,1,89,86,134'><font color="#54bb34">神威魔狱</font></a></u>^前往神威狱|
text^<u><a href='event:M2411,1,88,96,task_track_link_npc,1,89,96,133'><font color="#54bb34">BOSS之家</font></a></u>^前往BOSS之家|
text^<u><a href='event:M2411,1,79,96,task_track_link_npc,1,80,96,126'><font color="#54bb34">转生秘境</font></a></u>^前往转生秘境|
|

image^xiuxianguaji|
line|
text^<u><a href='event:M2411,1,73,76,task_track_link_npc,1,72,76,145'><font color="#54bb34">挂机传送</font></a></u>^前往挂机传送|
|

]]);
end






function ontalk1954_53(npc,player)
	local param258 = player:get_param(258);
	if param258 >= 10 then
		if player:get_gamemoney() >= 200 then
			player:sub_gamemoney(200);
			player:randomthismap(121);
		else
			player:alert(21,0,0,"对不起，您的礼金不足200!");
		end
	else
		player:alert(21,0,0,"对不起,您的转生等级不足10重无法进入");
	end
end

function ontalk1954_52(npc,player)
	player:randomthismap(80);
end

function ontalk1954_51(npc,player)
	local nvip = player:get_player_type();
	local nlevel = player:get_level();
	if nvip >= 1 then
		if nlevel >= 40 and nlevel <= 59 then
			player:randomthismap(141);
			return;
		end
	else
		player:alert(21,0,0,"对不起,您不是VIP无法进入VIP地图")
		return;
	end
	if nvip >= 12 then
		if nlevel >= 80 then
			player:randomthismap(88);
		else
			player:randomthismap(89);
		end
	elseif nvip >= 10 then
		if nlevel >= 80 then
			player:randomthismap(90);
		else
			player:randomthismap(91);
		end
	elseif nvip >= 7 then
		if nlevel >= 80 then
			player:randomthismap(92);
		else
			player:randomthismap(93);
		end
	elseif nvip >= 6 then
		if nlevel >= 80 then
			player:randomthismap(94);
		else
			player:randomthismap(95);
		end
	elseif nvip >= 4 then
		if nlevel >= 80 then
			player:randomthismap(96);
		else
			player:randomthismap(97);
		end
	elseif nvip >= 3 then
		if nlevel >= 80 then
			player:randomthismap(98);
		else
			player:randomthismap(99);
		end
	elseif nvip >= 2 then
		if nlevel >= 80 then
			player:randomthismap(100);
		else
			player:randomthismap(101);
		end
	elseif nvip >= 1 then
		if nlevel >= 80 then
			player:randomthismap(102);
		else
			player:randomthismap(103);
		end
	end
end

function ontalk1954_50(npc,player)
	if player:get_level() >= 80 then
		player:randomthismap(86);
	elseif player:get_level() >= 60 then
		player:randomthismap(87);
	else
		player:randomthismap(13);
	end
end
function ontalk1954_31(npc,player)
	player:enter_map(25,6,65,0);
end


function ontalk1954_30(npc,player)
	local param258 = player:get_param(258);
	if param258 >= 20 then
		player:enter_map(42,43,26,0);
	else
		player:alert(21,0,0,"对不起,您的转生等级不足无法进入");
	end			
end

function ontalk1954_29(npc,player)
	local param258 = player:get_param(258);
	if param258 >= 10 then
		player:enter_map(54,98,13,0);
	else
		player:alert(21,0,0,"对不起,您的转生等级不足无法进入");
	end		
end

function ontalk1954_28(npc,player)
	local param258 = player:get_param(258);
	if param258 >= 5 then
		player:enter_map(58,15,161,0);
	else
		player:alert(21,0,0,"对不起,您的转生等级不足无法进入");
	end	
end

function ontalk1954_27(npc,player)
	local level = player:get_level();
	if level >= 90 then
		player:enter_map(38,40,29,0);
	else
		player:alert(21,0,0,"对不起,您的级别不足无法进入");
	end	
end

function ontalk1954_26(npc,player)
	local level = player:get_level();
	if level >= 85 then
		player:enter_map(72,56,68,0);
	else
		player:alert(21,0,0,"对不起,您的级别不足无法进入");
	end	
end

function ontalk1954_25(npc,player)
	local level = player:get_level();
	if level >= 80 then
		player:enter_map(31,78,147,0);
	else
		player:alert(21,0,0,"对不起,您的级别不足无法进入");
	end	
end

function ontalk1954_24(npc,player)
	local level = player:get_level();
	if level >= 70 then
		player:enter_map(6,32,184,0);
	else
		player:alert(21,0,0,"对不起,您的级别不足无法进入");
	end	
end

function ontalk1954_23(npc,player)
	local level = player:get_level();
	if level >= 60 then
		player:enter_map(29,80,173,0);
	else
		player:alert(21,0,0,"对不起,您的级别不足无法进入");
	end
end

function ontalk1954_22(npc,player)
	local level = player:get_level();
	if level >= 50 then
		player:enter_map(20,50,61,0);
	else
		player:alert(21,0,0,"对不起,您的级别不足无法进入");
	end
end

function ontalk1954_21(npc,player)
	local level = player:get_level();
	if level >= 40 then
		player:enter_map(2,27,131,0);
	else
		player:alert(21,0,0,"对不起,您的级别不足无法进入");
	end
end

function ontalk1954_20(npc,player)
	local level = player:get_level();
	if level >= 30 then
		player:enter_map(1,9,170,0);
	else
		player:alert(21,0,0,"对不起,您的级别不足无法进入");
	end
end

function ontalk1954_10(npc,player)
	player:enter_map(10,91,60,0);
end
function ontalk1954_11(npc,player)
	player:enter_map(12,110,121,4);
end
function ontalk1954_12(npc,player)
	player:enter_map(17,120,150,4);
end
function ontalk1954_13(npc,player)
	if player:is_war_time() == false then
		player:enter_map(17,87,104,0);
	else
		player:enter_map(17,100,119,0);
	end
end


function ontalk1954_1(npc,player)
	if player:get_task_state(2) == 180 then
		player:set_task_state(2,185);
		player:push_task_data(1,1);
		player:add_exp(2400000);

		player:add_gamemoney_bind(0);
		player:openpanel(57);
	end
end

function CreatureNpcFun1954(npc,event,player,funid)

  if funid == 2 and player:get_task_state(25) == 1 then
      player:set_task_state(25,2);
      player:set_task_state(26,1);  
      player:push_task_data(26,1);
      player:add_exp(50000);
      player:add_gamemoney_bind(60000);
      return;
  end
  
  if funid == 2 and player:get_task_state(52) == 1 then
      player:set_task_state(52,2);
      player:set_task_state(53,1);  
      player:push_task_data(53,1);
      player:add_exp(1000000);
      player:add_gamemoney_bind(250000);
      return;
  end

	if funid == 2 and player:get_task_state(59) == 1 then
	    player:set_task_state(59,2); 
	    player:set_task_state(60,1);  
		player:push_task_data(60,1);
		player:add_exp(100000);
		player:add_gamemoney_bind(300000);	
	    return;
	end
	
	 if funid == 2 and player:get_task_state(79) == 2 then
      player:set_task_state(80,1);  
      player:push_task_data(80,1);
      player:add_gamemoney_bind(600000);  
      player:add_exp(5000000);    
	    player:add_item(40902,1,1,0,0);
      return;
  end

 if funid == 2 and player:get_task_state(93) == 1 then
	  player:set_task_state(93,2);
      player:set_task_state(94,1);  
      player:push_task_data(94,1);
      player:add_gamemoney_bind(850000);  
      player:add_exp(100000);    
      return;
  end



end

function CreatureNpcSceneNpcStatus1954(npc,event,player,npcid)
	local ntask2 = player:get_task_state(2);
	if npcid == 1215 then
		if ntask2 == 180 then
			player:show_npc_flags(npcid,1);
			return;
		else
			player:show_npc_flags(npcid,0);
			return;
		end
	end
end