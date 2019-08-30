--BOSS积分有礼配置
g_BossScoreCompTimeConf = 
{

	[1] =
	{
		StartTime = {year = 2018, month = 9, day = 9, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 9, day = 11, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 4,
		OpenEndDay = 7,
		isUseOpen = false,
		isUnionFlag = true,
		icon = "tehuihuodong2",
		afterOpen = 1, --自然时间+开服后几天(>=)一块使用
		
	}, --这里是一个时间段

	[2] =
	{
		StartTime = {year = 2018, month = 9, day = 9, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 9, day = 11, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 4,
		OpenEndDay = 7,
		isUseOpen = false,
		isUnionFlag = false,
		icon = "tehuihuodong2",
		afterOpen = 1, --自然时间+开服后几天(>=)一块使用
		
	} --这里是一个时间段
	
}



g_BossScoreCompAwardConf = 
{

	[1] = 
	{
		rankCount = 3, --显示多少个玩家
		award = 
		{
			[1] = 
			{
				minCount= 32888888,
				awardList = 
				{
					[1] = {itemid = 12100, count = 1, bind = 0},
				},
			}, --第1名

			[2] = 
			{

				minCount= 24888888,
				awardList = 
				{
					[1] = {itemid = 12101, count = 1, bind = 1},
				},
			}, --第2名

			[3] = 
			{
				minCount= 16888888,
				awardList = 
				{
					[1] = {itemid = 12102, count = 1, bind = 1},
				},
			},
			
			[4] = 
			{
				minCount= 8888888,
				awardList = 
				{
					[1] = {itemid = 12103, count = 1, bind = 1},
				},
			},
			
			[5] = 
			{
				minCount= 8888888,
				awardList = 
				{
					[1] = {itemid = 12103, count = 1, bind = 1},
				},
			},
			
			[6] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid = 10413, count = 1, bind = 1},
				},
			},
			
			[7] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid = 10413, count = 1, bind = 1},
				},
			},
			
			[8] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid = 10413, count = 1, bind = 1},
				},
			},
			
			[9] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid= 10413, count = 1, bind = 1},
				},
			},
			
			[10] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid = 10413, count = 1, bind = 1},
				},
			}
		}
	}, --这个奖励是跟配置的时间段对应的
	
	[2] = 
	{
		rankCount = 3, --显示多少个玩家
		award = 
		{
			[1] = 
			{
				minCount= 32888888,
				awardList = 
				{
					[1] = {itemid = 12100, count = 1, bind = 0},
				},
			}, --第1名

			[2] = 
			{

				minCount= 24888888,
				awardList = 
				{
					[1] = {itemid = 12101, count = 1, bind = 1},
				},
			}, --第2名

			[3] = 
			{
				minCount= 16888888,
				awardList = 
				{
					[1] = {itemid = 12102, count = 1, bind = 1},
				},
			},
			
			[4] = 
			{
				minCount= 8888888,
				awardList = 
				{
					[1] = {itemid = 12103, count = 1, bind = 1},
				},
			},
			
			[5] = 
			{
				minCount= 8888888,
				awardList = 
				{
					[1] = {itemid = 12103, count = 1, bind = 1},
				},
			},
			
			[6] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid = 10413, count = 1, bind = 1},
				},
			},
			
			[7] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid = 10413, count = 1, bind = 1},
				},
			},
			
			[8] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid = 10413, count = 1, bind = 1},
				},
			},
			
			[9] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid= 10413, count = 1, bind = 1},
				},
			},
			
			[10] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid = 10413, count = 1, bind = 1},
				},
			}
		}
	} --这个奖励是跟配置的时间段对应的
}



