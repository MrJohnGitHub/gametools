
goldmonhp = 
{
	[70] = 1,
	[71] = 1.1,
	[72] = 1.2,
	[73] = 1.3,
	[74] = 1.4,
	[75] = 1.5,
	[76] = 1.6,
	[77] = 1.7,
	[78] = 1.8,
	[79] = 1.9,
	[80] = 2,
	[81] = 2.1,
	[82] = 2.2,
	[83] = 2.5,
	[84] = 2.6,
	[85] = 2.7,
	[86] = 2.8,
	[87] = 2.9,
	[88] = 3,
	[89] = 3.1,
	[90] = 3.2,
	[201] = 3.5,
	[202] = 4,
	[203] = 4.5,
	[204] = 5,
	[205] = 6
};

goldmondc = 
{
	[70] = 1,
	[71] = 1.1,
	[72] = 1.2,
	[73] = 1.3,
	[74] = 1.4,
	[75] = 1.5,
	[76] = 1.6,
	[77] = 1.7,
	[78] = 1.8,
	[79] = 1.9,
	[80] = 2,
	[81] = 2.05,
	[82] = 2.1,
	[83] = 2.15,
	[84] = 2.2,
	[85] = 2.25,
	[86] = 2.3,
	[87] = 2.35,
	[88] = 2.4,
	[89] = 2.45,
	[90] = 2.5,
	[201] = 2.55,
	[202] = 2.6,
	[203] = 2.65,
	[204] = 2.7,
	[205] = 2.75
};


function mon8809(mon,event,player)
	-- local obj = {};
	-- player:alert(19,0,0,"恭喜你已经击杀了携宝小妖!!!")
	-- if player:num_monster() == 0 then
	-- 	local obj = {};
	-- 	local nrandom = math.random(1,100);
	-- 	player:set_param(307,0);
	-- 	player:set_param(308,0);
	-- 	player:set_param(309,0);
	-- 	if player:get_player_type() == 1 then
	-- 		obj.goldType = 4;
	-- 		obj.goldNum = 0;
	-- 		player:set_param(307,5);
	-- 	elseif nrandom >= 1 and nrandom <= 45 then
	-- 		obj.goldType = 0;
	-- 		obj.goldNum = 200;
	-- 		player:set_param(307,1);
	-- 	elseif nrandom >= 50 and nrandom <= 95 then
	-- 		obj.goldType = 1;
	-- 		obj.goldNum = 1000000;
	-- 		player:set_param(307,2);
	-- 	elseif nrandom >= 46 and nrandom <= 49 then
	-- 		obj.goldType = 2;
	-- 		obj.goldNum = 10;
	-- 		player:set_param(307,3);
	-- 	elseif nrandom >= 96 and nrandom <= 100 then
	-- 		obj.goldType = 3;
	-- 		obj.goldNum = 50;
	-- 		player:set_param(307,4);
	-- 	end
	-- 	player:SendPacketToSelf(3520,0,encode(obj));
	-- end
end

function mon8800_js(mon,event,player)
-- 	local nbinggold = 0;
-- 	local nCount = 0;
-- 	local obj = {};
-- 	player:set_param(268,player:get_param(268) + 1);

-- --=================金币特效====================
-- 	local objgold = {};
-- 	objgold.creatureid = mon:GetLowGUID();
-- 	objgold.action = 1;
-- 	objgold.num = 10;
-- 	player:SendPacketToSelf(3534,0,encode(objgold));
-- 	player:add_item(10210,10,1,0,0);
-- --=================每轮刷怪====================
-- 	if player:num_monster() < 10 and player:get_param(268) >= 25 then
-- 		if player:get_param(267) < 2 then
-- 			nCount = math.random(30,50);
-- 			if player:get_param(267) == 0 then
-- 				obj[4] = 8801;
-- 				obj[5] = 35028;
-- 				obj[6] = "简单金币2";
-- 				player:set_param(267,1);
-- 				player:set_param(269,1);
-- 				mon8800_xb(player);
-- 			elseif player:get_param(267) == 1 then
-- 				obj[4] = 8802;
-- 				obj[5] = 35025;
-- 				obj[6] = "简单金币3";
-- 				player:set_param(267,2);
-- 				player:set_param(269,1);
-- 				mon8800_xb(player);
-- 			end
-- 			obj[2] = 27;
-- 			obj[3] = 32;
-- 			obj[7] = nCount;
-- 			obj[8] = 10;
-- 			if player:get_param(258) >= 6 then
-- 				obj[13] = (player:get_param(258) - 1) * 100;
-- 				obj[14] = (goldmonhp[205] + ((player:get_param(258) - 5) * 0.15)) * 100;
-- 			elseif player:get_param(258) >= 1 then
-- 				obj[13] = (goldmondc[200 + player:get_param(258)]) * 100;
-- 				obj[14] = (goldmonhp[200 + player:get_param(258)]) * 100;
-- 			elseif player:get_level() >= 91 then
-- 				obj[13] = goldmondc[201] * 100;
-- 				obj[14] = goldmonhp[201] * 100;
-- 			elseif player:get_level() >= 70 and player:get_level() <= 90 then
-- 				obj[13] = goldmondc[player:get_level()] * 100;
-- 				obj[14] = goldmonhp[player:get_level()] * 100;
-- 			end
-- 			player:mon_gen(encode(obj));
-- 		elseif player:get_param(267) == 2 then
-- 			player:set_param(269,1);
-- 			mon8800_xb(player);
-- 			player:set_param(267,3);
-- 		end
-- 	end
-- --=================副本进度====================
-- 	obj.progress = player:get_param(267);
-- 	player:SendPacketToSelf(1813,0,encode(obj));
-- --=================副本翻牌====================
-- 	if player:num_monster() == 0 then
-- 		local obj = {};
-- 		local nrandom = math.random(1,100);
-- 		player:set_param(307,0);
-- 		player:set_param(308,0);
-- 		player:set_param(309,0);
-- 		if player:get_player_type() == 1 then
-- 			obj.goldType = 4;
-- 			obj.goldNum = 0;
-- 			player:set_param(307,5);
-- 		elseif nrandom >= 1 and nrandom <= 45 then
-- 			obj.goldType = 0;
-- 			obj.goldNum = 200;
-- 			player:set_param(307,1);
-- 		elseif nrandom >= 50 and nrandom <= 95 then
-- 			obj.goldType = 1;
-- 			obj.goldNum = 1000000;
-- 			player:set_param(307,2);
-- 		elseif nrandom >= 46 and nrandom <= 49 then
-- 			obj.goldType = 2;
-- 			obj.goldNum = 10;
-- 			player:set_param(307,3);
-- 		elseif nrandom >= 96 and nrandom <= 100 then
-- 			obj.goldType = 3;
-- 			obj.goldNum = 50;
-- 			player:set_param(307,4);
-- 		end
-- 		player:SendPacketToSelf(3520,0,encode(obj));
-- 	end
end

function mon8800_xb(player)
-- 	local nsprite = math.random(100);
-- 	if player:get_param(269) == 1 then
-- 		player:set_param(268,0);
-- 		player:set_param(269,0);
-- --=================刷宝箱====================
-- 		local nx = math.random(22,32);
-- 		local ny = math.random(25,35);
-- 		local nrandom = math.random(1,3);
-- 		if nrandom == 1 then
-- 			player:SpawnGameObject(19013,nx,ny,0,0,0,0,0,0);
-- 		elseif nrandom == 2 then
-- 			player:SpawnGameObject(19019,nx,ny,0,0,0,0,0,0);
-- 		elseif nrandom == 3 then
-- 			player:SpawnGameObject(19020,nx,ny,0,0,0,0,0,0);
-- 		else
-- 			player:SpawnGameObject(19013,nx,ny,0,0,0,0,0,0);
-- 		end
-- --=================携宝小妖====================
-- 		if nsprite >= 50 then
-- 			local obj = {};
-- 			obj[2] = 27;
-- 			obj[3] = 32;
-- 			obj[4] = 8809;
-- 			obj[5] = 35091;
-- 			obj[6] = "携宝小妖";
-- 			obj[7] = 1;
-- 			obj[8] = 1;
-- 			if player:get_param(258) >= 6 then
-- 				obj[13] = (player:get_param(258) - 1) * 100;
-- 				obj[14] = (goldmonhp[205] + ((player:get_param(258) - 5) * 0.15)) * 100;
-- 			elseif player:get_param(258) >= 1 then
-- 				obj[13] = (goldmondc[200 + player:get_param(258)]) * 100;
-- 				obj[14] = (goldmonhp[200 + player:get_param(258)]) * 100;
-- 			elseif player:get_level() >= 91 then
-- 				obj[13] = goldmondc[201] * 100;
-- 				obj[14] = goldmonhp[201] * 100;
-- 			elseif player:get_level() >= 70 and player:get_level() <= 90 then
-- 				obj[13] = goldmondc[player:get_level()] * 100;
-- 				obj[14] = goldmonhp[player:get_level()] * 100;
-- 			end
-- 			player:mon_gen(encode(obj));
-- 		end
-- 	end
end

