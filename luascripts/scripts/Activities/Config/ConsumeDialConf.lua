--材料转盘 抽奖转盘
g_ConsumeDialConf = 
{
	[1] =
	{
		StartTime = {year = 2018, month = 8, day = 1, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 8, day = 3, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = false,
		icon = "tehuihuodong2",
		afterOpen = 1, --自然时间+开服后几天(>=)一块使用
		lotteryCost = 200, --抽奖一次扣多少元宝
		award = 
		{
			awardList = 
			{
				[1] = {itemid = 40902, count = 1, bind = 1, weight = 30},
				[2] = {itemid = 10407, count = 1, bind = 1, weight = 40},
				[3] = {itemid = 40901, count = 1, bind = 1, weight = 50},
				[4] = {itemid = 10409, count = 1, bind = 1, weight = 30},
				[5] = {itemid = 10165, count = 1, bind = 1, weight = 10},
				[6] = {itemid = 40960, count = 1, bind = 1, weight = 14},
				[7] = {itemid = 40803, count = 1, bind = 1, weight = 18},
				[8] = {itemid = 12068, count = 1, bind = 1, weight = 1}
			},

			mustBe = 
			{
				[1] = 
				{
					[1] = {itemid = 40960, count = 1, bind = 1}, 
				},--10连抽必得奖品
				[2] = 
				{
					[1] = {itemid = 12068, count = 1, bind = 1}, 
				},--50连抽必得奖品
				
			},
			
		},

		box = 
		{
			[1] = 
			{
				lotteryCount = 10,
				itemCount = 1,
				awardList = 
				{
					[1] = {itemid = 40803, count = 1, bind = 1},
				}, --奖励
			},
			
			[2] = 
			{
				lotteryCount = 100,
				itemCount = 1,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
				}, --奖励
			},
			
			[3] = 
			{
				lotteryCount = 500,
				itemCount = 1,
				awardList = 
				{
					[1] = {itemid = 40807, count = 1, bind = 1},
				}, --奖励
			},
			
			[4] = 
			{
				lotteryCount = 1000,
				itemCount = 1,
				awardList = 
				{
					[1] = {itemid = 40809, count = 1, bind = 1},
				}, --奖励
			},
			
			[5] = 
			{
				lotteryCount = 2000,
				itemCount = 1,
				awardList = 
				{
					[1] = {itemid = 40810, count = 1, bind = 1},
				}, --奖励
			},
		}, --宝箱
	}, --这里是一个时间段
	
	[2] =
	{
		StartTime = {year = 2018, month = 8, day = 1, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 8, day = 3, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = true,
		icon = "tehuihuodong2",
		afterOpen = 1, --自然时间+开服后几天(>=)一块使用
		lotteryCost = 200, --抽奖一次扣多少元宝
		award = 
		{
			awardList = 
			{
				[1] = {itemid = 40902, count = 1, bind = 1, weight = 30},
				[2] = {itemid = 10407, count = 1, bind = 1, weight = 40},
				[3] = {itemid = 40901, count = 1, bind = 1, weight = 50},
				[4] = {itemid = 10409, count = 1, bind = 1, weight = 30},
				[5] = {itemid = 10165, count = 1, bind = 1, weight = 10},
				[6] = {itemid = 40960, count = 1, bind = 1, weight = 14},
				[7] = {itemid = 40803, count = 1, bind = 1, weight = 18},
				[8] = {itemid = 12068, count = 1, bind = 1, weight = 1}
			},

			mustBe = 
			{
				[1] = 
				{
					[1] = {itemid = 40960, count = 1, bind = 1}, 
				},--10连抽必得奖品
				[2] = 
				{
					[1] = {itemid = 12068, count = 1, bind = 1}, 
				},--50连抽必得奖品
				
			},
			
		},

		box = 
		{
			[1] = 
			{
				lotteryCount = 10,
				itemCount = 1,
				awardList = 
				{
					[1] = {itemid = 40803, count = 1, bind = 1},
				}, --奖励
			},
			
			[2] = 
			{
				lotteryCount = 100,
				itemCount = 1,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
				}, --奖励
			},
			
			[3] = 
			{
				lotteryCount = 500,
				itemCount = 1,
				awardList = 
				{
					[1] = {itemid = 40807, count = 1, bind = 1},
				}, --奖励
			},
			
			[4] = 
			{
				lotteryCount = 1000,
				itemCount = 1,
				awardList = 
				{
					[1] = {itemid = 40809, count = 1, bind = 1},
				}, --奖励
			},
			
			[5] = 
			{
				lotteryCount = 2000,
				itemCount = 1,
				awardList = 
				{
					[1] = {itemid = 40810, count = 1, bind = 1},
				}, --奖励
			},
		}, --宝箱
	} --这里是一个时间段	
}






