function Map74_Leave(map,player,areaid,mgr)

end

function Map317_Leave(map,player,areaid,mgr)
	local towerid = player:get_param(601);
	local param_602 = player:get_param(602);
	if param_602 == 0 then
		return;
	end
	player:set_param(602,0);
	--每日奖励
	local needslot = 0;
	for i = 1,#TowerDaily[towerid] do
		if TowerDaily[towerid][i][1] == 1 then
			needslot = needslot + math.ceil(TowerDaily[towerid][i][3]/TowerDaily[towerid][i][5]);
		end
	end
	if player:num_bag_black() < needslot then
		player:alert(10,0,0,"你的背包空位不足,无法领取奖励");
		return;
	end
	local str = "挑战成功,获得";
	local str_flag = 0;
	for i = 1,#TowerDaily[towerid] do
		new_add_item(player,TowerDaily[towerid][i][1],TowerDaily[towerid][i][2],TowerDaily[towerid][i][3],TowerDaily[towerid][i][4]);
		if str_flag == 0 then
			str_flag = 1;
			str = str .. QxzbText[TowerDaily[towerid][i][1]] .. " x " .. TowerDaily[towerid][i][3];
		else
			str = str .."," .. QxzbText[TowerDaily[towerid][i][1]] .. " x " .. TowerDaily[towerid][i][3];
		end
	end
	player:alert(10,0,0,str);
end

function Map341_Leave(map,player,areaid,mgr)
	local towerid = player:get_param(798);
	local param_801 = player:get_param(801);
	if param_801 == 0 then
		return;
	end
	player:set_param(801,0);
	--每日奖励
	local needslot = 0;
	for i = 1,#TowerDailyNew[towerid] do
		if TowerDailyNew[towerid][i][1] == 1 then
			needslot = needslot + math.ceil(TowerDailyNew[towerid][i][3]/TowerDailyNew[towerid][i][5]);
		end
	end
	if player:num_bag_black() < needslot then
		player:alert(10,0,0,"你的背包空位不足,无法领取奖励");
		return;
	end
	local str = "挑战成功,获得";
	local str_flag = 0;
	for i = 1,#TowerDailyNew[towerid] do
		new_add_item(player,TowerDailyNew[towerid][i][1],TowerDailyNew[towerid][i][2],TowerDailyNew[towerid][i][3],TowerDailyNew[towerid][i][4]);
		if str_flag == 0 then
			str_flag = 1;
			str = str .. QxzbText[TowerDailyNew[towerid][i][1]] .. " x " .. TowerDailyNew[towerid][i][3];
		else
			str = str .."," .. QxzbText[TowerDailyNew[towerid][i][1]] .. " x " .. TowerDailyNew[towerid][i][3];
		end
	end
	player:alert(10,0,0,str);
end


function Map9_Leave(map,player,areaid,mgr)

end

function Map12_Leave(map,player,areaid,mgr)
	-- if player:get_level() >= 40 and player:get_level() <= 59 then
	-- 	player:del_status(131);
	-- end
	-- if player:get_level() >= 60 and player:get_level() <= 75 then
	-- 	player:del_status(132);
	-- end
	-- if player:get_level() >= 76 and player:get_level() <= 90 then
	-- 	player:del_status(133);
	-- end
	-- if player:get_level() >= 91 then
	-- 	player:del_status(134);
	-- end
end

function Map28_Leave(map,player,areaid,mgr)
    player:SetFightModle(2);
end

function Map29_Leave(map,player,areaid,mgr)
    player:del_status(1103);
    player:del_status(1104);
    player:del_status(1112);
    player:SetFightModle(2);
end

function Map17_Leave(map,player,areaid,mgr)
    player:del_status(2000);
end

function Map30_Leave(map,player,areaid,mgr)
	
end

function Map32_Leave(map,player,areaid,mgr)
     player:SetFightModle(2);
     --if g_get_param(0) == 1 then
           mgr:map_playernum(1);--广播剩余人数
     --end
end

--新手十倍场出场景
function Map33_Leave(map,player,areaid,mgr)
  player:del_status(1105);
end


function Map61_Leave(map,player,areaid,mgr)
	
end


function Map4_Leave(map,player,areaid,mgr)
	player:remove_item(20164,1,7);
	if player:equitment() == 1 then
		player:alert(10,0,0,"您有更好的装备，系统自动为您装备");
	end
	player:SetFightModle(2);
end

function Map65_Leave(map,player,areaid,mgr)
	player:SetBodyDisplay(0,0,0,0)
end

function Map238_Leave(map,player,areaid,mgr)
	player:SetFightModle(2);
end

function Map104_Leave(map,player,areaid,mgr)
	-- player:del_status(109);
	-- player:set_param(296,0);
	-- player:set_name_pre(0,"");
end


function Map106_Leave(map,player,areaid,mgr)

end

function Map171_Leave(map,player,areaid,mgr)

end

function Map3_Leave(map,player,areaid,mgr)
    player:del_status(1102);
    player:del_status(1101);
    player:SetFightModle(2);
end
function Map439_Leave(map,player,areaid,mgr)
    player:del_status(1111);
    player:del_status(1110);
    local exp = player:GetPkBubbleExp();
    if exp < 4000000 then
    	player:add_exp(4000000 - exp);
    end
end

function Map400_409_Leave(map,player,areaid,mgr)
	
end

function Map270_Leave(map,player,areaid,mgr)
    player:SetFightModle(2);
    mgr:map_playernum(1);--广播剩余人数
end

function Map440_Leave(map,player,areaid,mgr)
    if player:get_task_state(15) == 1 then
       player:set_task_state(15,2);
       player:push_task_data(15,1);
	end
end


function Map277_Leave(map,player,areaid,mgr)
    if player:get_task_state(34) == 1 then
       player:set_task_state(34,2);
       player:push_task_data(34,1);
	end
end

function Map280_Leave(map,player,areaid,mgr)
    if player:get_task_state(48) == 1 then
       player:set_task_state(48,2);
       player:push_task_data(48,1);
	end
end
function Map295_Leave(map,player,areaid,mgr)
	local modle = player:GetLastFightModle();
    player:SetFightModle(modle);
end
function Map469_Leave(map,player,areaid,mgr)
    player:SetFightModle(2);
end
function Map470_Leave(map,player,areaid,mgr)
    player:SetFightModle(2);
end
function Map471_Leave(map,player,areaid,mgr)
	local modle = player:GetLastFightModle();
    player:SetFightModle(modle);
end
function Map472_Leave(map,player,areaid,mgr)
    player:SetFightModle(2);
end
function Map473_Leave(map,player,areaid,mgr)
    player:SetFightModle(2);
end

function Map475_Leave(map,player,areaid,mgr)
	player:LeaveOrEnterSence(1);
	player:SetFightModle(2)
	player:set_camp(0)
	local guid = player:GetLowGUID()
	local retMsg = {
		id = guid,
		camp = 0,
	}
	player:SendPacketToSelf(4645, 0, encode(retMsg))
end
