function CreatureNpcFun1168(npc,event,player,funid)
if funid == 2 and player:get_task_state(54) == 1 then	
    player:set_task_state(54,2);  	
    player:set_task_state(55,1);  
    player:push_task_data(55,1);
    player:add_exp(1500000);
    player:add_gamemoney_bind(250000);
    return;
end
end