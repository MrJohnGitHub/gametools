g_GemScoreCompTimeConf = 
{

	[1] =
	{
		StartTime = {year = 2018, month = 1, day = 6, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 1, day = 9, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = false,
		afterOpen = 8, --自然时间+开服后几天(>=)一块使用
		icon = "tehuihuodong2",
	},--这里是一个时间段
	
	[2] =
	{
		StartTime = {year = 2018, month = 1, day = 6, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 1, day = 9, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = true,
		afterOpen = 8, --自然时间+开服后几天(>=)一块使用
		icon = "tehuihuodong2",
	}--这里是一个时间段
	
	
}



g_GemScoreCompAwardConf = 
{

	[1] = 
	{
		rankCount = 3, --显示多少个玩家
		award = 
		{
			[1] = 
			{
				minCount= 12000,
				awardList = 
				{
					[1] = {itemid = 20121, count = 1, bind = 0},
				},
			}, --第1名

			[2] = 
			{

				minCount= 7500,
				awardList = 
				{
					[1] = {itemid = 12073, count = 1, bind = 1},
				},
			}, --第2名

			[3] = 
			{
				minCount= 5000,
				awardList = 
				{
					[1] = {itemid = 12050, count = 1, bind = 1},
				},
			},
			
			[4] = 
			{
				minCount= 2500,
				awardList = 
				{
					[1] = {itemid = 10317, count = 1, bind = 1},
				},
			},
			
			[5] = 
			{
				minCount= 2500,
				awardList = 
				{
					[1] = {itemid = 10317, count = 1, bind = 1},
				},
			},
			
			[6] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid = 10410, count = 1, bind = 1},
				},
			},
			
			[7] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid = 10410, count = 1, bind = 1},
				},
			},
			
			[8] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid = 10410, count = 1, bind = 1},
				},
			},
			
			[9] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid= 10410, count = 1, bind = 1},
				},
			},
			
			[10] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid = 10410, count = 1, bind = 1},
				},
			},
			
		}
	},--这个奖励是跟配置的时间段对应的
	
	[2] = 
	{
		rankCount = 3, --显示多少个玩家
		award = 
		{
			[1] = 
			{
				minCount= 12000,
				awardList = 
				{
					[1] = {itemid = 20121, count = 1, bind = 0},
				},
			}, --第1名

			[2] = 
			{

				minCount= 7500,
				awardList = 
				{
					[1] = {itemid = 12073, count = 1, bind = 1},
				},
			}, --第2名

			[3] = 
			{
				minCount= 5000,
				awardList = 
				{
					[1] = {itemid = 12050, count = 1, bind = 1},
				},
			},
			
			[4] = 
			{
				minCount= 2500,
				awardList = 
				{
					[1] = {itemid = 10317, count = 1, bind = 1},
				},
			},
			
			[5] = 
			{
				minCount= 2500,
				awardList = 
				{
					[1] = {itemid = 10317, count = 1, bind = 1},
				},
			},
			
			[6] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid = 10410, count = 1, bind = 1},
				},
			},
			
			[7] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid = 10410, count = 1, bind = 1},
				},
			},
			
			[8] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid = 10410, count = 1, bind = 1},
				},
			},
			
			[9] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid= 10410, count = 1, bind = 1},
				},
			},
			
			[10] = 
			{
				minCount= 0,
				awardList = 
				{
					[1] = {itemid = 10410, count = 1, bind = 1},
				},
			},
			
		}
	}--这个奖励是跟配置的时间段对应的

}



