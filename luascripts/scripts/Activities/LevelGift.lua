

g_LevelGifConfig = {
	
	--[[
		类型： 普通物品：0 金币：1 绑定金币：2 经验：3 BOSS积分：29 绑定元宝：100 元宝：101 血符：21 甲盾：22 宝石：23 魂珠：24
		职业： 1 战士， 2 法师 3 道士 10 全职
		性别： 1 男 2 女 0 无性别
		绑定： 1 是绑定 
	]]
	[1] = 
	{
		level = 20, 
	 	award = 
	 	{	--类型，物品id，数量， 职业， 性别，绑定
	 		[1] = {0,20103,1,1,0,1},
	 		[2] = {0,20124,1,2,0,1},
	 		[3] = {0,20145,1,3,0,1},
	 		[4] = {0,20203,1,1,0,1},
	 		[5] = {0,20224,1,2,0,1},
	 		[6] = {0,20245,1,3,0,1},
	 		[7] = {0,20803,1,1,0,1},
	 		[8] = {0,20824,1,2,0,1},
	 		[9] = {0,20845,1,3,0,1},
			[10] = {0,20703,1,1,0,1},
			[11] = {0,20724,1,2,0,1},
			[12] = {0,20745,1,3,0,1},
			[13] = {0,20403,1,1,0,1},
			[14] = {0,20424,1,2,0,1},
			[15] = {0,20445,1,3,0,1},
		},
	},

	[2] = 
	{
		level = 40,
		award = 
		{
			[1] = {0,20205,1,1,0,1},
			[2] = {0,20226,1,2,0,1},
			[3] = {0,20247,1,3,0,1},
			[4] = {0,21105,1,1,0,1},
			[5] = {0,21126,1,2,0,1},
			[6] = {0,21147,1,3,0,1},
			[7] = {0,20805,1,1,0,1},
			[8] = {0,20826,1,2,0,1},
			[9] = {0,20847,1,3,0,1},
			[10] = {0,20705,1,1,0,1},
			[11] = {0,20726,1,2,0,1},
			[12] = {0,20747,1,3,0,1},
			[13] = {0,20405,1,1,0,1},
			[14] = {0,20426,1,2,0,1},
			[15] = {0,20447,1,3,0,1},
		},
	},

}

local levelGifconfig = g_LevelGifConfig




                         

-- --获取等级对应的礼包id
function OnGetLevelGiftId(player)
	local level = player:GetLevel()
	for i=#levelGifconfig, 1, -1 do --从最大的找起
		if level >= levelGifconfig[i].level then
			return i
		end
	end
	return 0
end

--发等级礼包
function OnSendLevelGift(player, gifId)
	local award = levelGifconfig[gifId] and levelGifconfig[gifId].award
	if award == nil then
		return 
	end
	local gender = player:GetGender()
	local job = player:GetClass()
	local addItem = {}
	--这里需要先把能加都物品全部读出来，然后判断背包空间是否足够
	for k, v in ipairs(award) do
		local add = true
		if v[4] ~= 10 and job ~= v[4] then
			add = false
		end

		if v[5] ~= 0 and gender ~= v[5] then
			add = false
		end

		if add then
			--加上物品
			--然后调用请求穿装备	
			--player:AddEquipAndDress(v[2], v[3], 232)
			table.insert(addItem, v)
		end
	end
	
	if #addItem > 0 then
		--先判断背包容量够不够
		if player:num_bag_black() < #addItem then
			player:alert(10,0,0,"很抱歉，您的背包空格不足")
			return 		
		end
		for k, v in ipairs(addItem) do
			player:AddEquipAndDress(v[2], v[3], 232, v[6])		
		end	
		NotifySevenDayTargetFinish(player, 4)			
	end
	--设置标志位
	player:SetFlagBitByIndex(607, gifId)
	
end

--校验是否可以领取奖励
function OnCheckCanGetGiftById(player, gifId)
	local config = levelGifconfig[gifId]
	local playerLevel = player:GetLevel()
	if config.level > playerLevel then
		return 2 --表示没有达到领取条件
	end

	return 0
end
