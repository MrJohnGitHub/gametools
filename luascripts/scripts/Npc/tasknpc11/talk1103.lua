function ontalk1103(npc,event,player)
	if player:get_task_state(2) == 1 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
我听说了你在海角村的表现，现在很少能看到像
你这样出色的年轻人了，干的不错，快就到皇城
卫队那里报到吧！
#&task_target#&
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">3000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item19083#&<font color="#28FF28">小飞鞋 * 50</font>
#&todoM2402,1#&talk_finish_bt#&]]);
	else

	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
从哪来，往哪去，家里有几口人，人均几
亩地，地里几头牛，说！
  ]]);
	end
end

function CreatureNpcFun1103(npc,event,player,funid)

if funid == 2 and player:get_task_state(34) == 2 then
  player:set_task_state(35,1);  
  player:push_task_data(35,1);
  player:add_exp(800000);
  player:add_gamemoney_bind(100000);
  return;
 end			

  if funid == 2 and player:get_task_state(48) == 2 then
      player:set_task_state(49,1);  
      player:push_task_data(49,1);
      player:add_exp(2000000);
      player:add_gamemoney_bind(200000);
      return;
  end

  if funid == 2 and player:get_task_state(62) ==2 then
  player:set_task_state(63,1);  
  player:push_task_data(63,1);
  player:add_exp(2000000);
  player:add_gamemoney_bind(450000);
  return;
 end    
 
  if funid == 2 and player:get_task_state(70) ==2 then
  player:set_task_state(71,1);  
  player:push_task_data(71,1);
  player:add_exp(4000000);
  player:add_gamemoney_bind(550000);
  return;
 end    

if funid == 2 and player:get_task_state(76) == 2 then
  player:set_task_state(77,1);  
  player:push_task_data(77,1);
  player:add_exp(5000000);
  player:add_gamemoney_bind(550000);
  return;
 end  

  if funid == 2 and player:get_task_state(91) == 2 then
      player:set_task_state(92,1);  
      player:push_task_data(92,1);
      player:add_exp(7000000);
      player:add_gamemoney_bind(850000);      
      return;
  end

if funid == 2 and player:get_task_state(96) ==1 then
  player:set_task_state(96,2);
  player:set_task_state(97,1);  
  player:push_task_data(97,1);
  player:add_exp(100000);
  player:add_gamemoney_bind(900000);
  return;
 end

 if funid == 2 and player:get_task_state(105) == 1 then
	  player:set_task_state(105,2);
      player:set_task_state(106,1);  
      player:push_task_data(106,1);
      player:add_exp(100000);
      player:add_gamemoney_bind(1100000);
      local level = player:get_level();
      if level >= 70 then
        player:set_task_state(106,2);
        player:push_task_data(106,1);
      end  
      player:add_item(10279,1,1,0,0); 
      player:SendSystemMail("又见面了","    1、您可以通过<font color='#0be140'>经验炼制</font>、<font color='#0be140'>击杀BOSS</font>，完成<font color='#0be140'>经验副本</font>快速升级；<br>    2、小妮<font color='#0be140'>强烈推荐您寻找战友组队打BOSS</font>哦，击杀BOSS队伍可获得超多经验，还能大爆装备！点击右上角【激战BOSS】开战吧；<br>" .. 
		"    3、<font color='#0be140'>加公会找战友</font>，还有新的<font color='#0be140'>公会任务</font>，装备材料统统都会有；<br>    4、每天登录有惊喜，<font color='#0be140'>第七天还送珍稀特戒碎片</font>！<br><br>                    新焚天之怒策划 小妮"	,"[0,0,0,0,0,0]","[0,0,0,0]",1);     
      return;
  end


end

function CreatureNpcSceneNpcStatus1103(npc,event,player,npcid)
	if npcid == 1212 then
		if player:get_task_state(2) == 1 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end
