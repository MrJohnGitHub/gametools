function CreatureNpcFun1102(npc,event,player,funid)	
			
if funid == 2 and player:get_task_state(60) == 1 then
  player:set_task_state(60,2);
	player:set_task_state(61,1);  
	player:push_task_data(61,1);
	player:add_gamemoney_bind(350000);
    player:add_exp(100000);
    player:add_item(12014,10,1,0,0);	
	local sum = player:Equipment_Num(0,0,1);
      if sum >= 1 then
      player:set_task_state(61,2);  
      else
      player:set_task_param(61,1,sum);
      end  
      player:push_task_data(61,1); 
	return;
 end

if funid == 2 and player:get_task_state(68) == 1 then
  player:set_task_state(68,2);
  player:set_task_state(69,1);  
  player:push_task_data(69,1);
  player:add_exp(100000);
  player:add_gamemoney_bind(450000);
  return;
 end

 if funid == 2 and player:get_task_state(90) == 1 then
 	player:set_task_state(90,2);
    player:set_task_state(91,1);  
    player:push_task_data(91,1);
    player:add_exp(100000);
    player:add_gamemoney_bind(800000); 
    local sum = player:Equipment_Num(0,60,0);
    if sum >= 3 then
      player:set_task_state(91,2);  
      player:push_task_data(91,1);
    else
      player:set_task_param(91,1,sum);
      player:push_task_data(91,1);
    end   
    player:SendSystemMail("致亲爱的朋友","    1、您可以在<font color='#0be140'>【疯狂豪礼-特惠礼包】</font>中购买装备礼包，一键获得全套高阶装备；<br>    2、<font color='#0be140'>寻宝</font>产出大量经验丹和高阶装备；<br>" .. 
		"    3、主线之余，您可以关注一下62级开启的<font color='#0be140'>支线任务</font>，奖励也很丰厚哦~<br>    <font color='#0be140'>请不要相信游戏中任何送首充送元宝的信息！</font><br>    新焚天之怒致力于为您带来更好的游戏体验，充点小钱爽快一下吧。<br>                  新焚天之怒策划 小妮"	,"[0,0,0,0,0,0]","[0,0,0,0]",1);     
    return;     
  end



end