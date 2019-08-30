function ontalk1963(npc,event,player)	
	if player:get_param(303) >= 1 and bitget(player:get_param(303),2) == 0 then
		player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
#&task_describe#&
  天劫牢内到底有什么隐秘呢？
#&task_target#&
[已完成]
#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">x1200</font>


#&todoM2402,1#&talk_finish_bt#&]]);
	else
	player:echo(0,npc:GetLowGUID(),[[
  天劫牢内到底有什么隐秘呢？
  ]]);
	end
end


function CreatureNpcFun1963(npc,event,player,funid)
	if funid == 1 then
		ontalk1963_1(npc,player);
	end
end

function CreatureNpcSceneNpcStatus1963(npc,event,player,npcid)
	if npcid == 6303 then
		if player:get_task_state(102) == 1 then
			player:show_npc_flags(npcid,2);
		elseif player:get_task_state(102) == 2 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,4);
		end
		if player:get_param(296) >= 0 then
			player:show_npc_flags(npcid,0);
		end
	end
end

function ontalk1963_1(npc,player)
	if bitget(player:get_param(303),2) == 0 then
		if player:get_param(303) >= 1 then

			player:set_param(303,bitset(player:get_param(303),2));
			player:alert(2,0,0,"您完成了本次对话");

			local i = 0;
			local n = 0;
			for i=1,4 do
				njs = 301 + i;
				if player:get_param(njs) >= 1 then
					n = n + 1;
				end
			end

			for i=1,4 do
				njs = 301 + i;
				if bitget(player:get_param(njs),2) == 1 then
					n = n - 1;
				end
			end

			if n == 0 then
				player:set_task_state(102,2);
			end

			player:push_task_data(1,1);
		end
	end
end