--[[
消费活动排行榜
配置文件
--]]

g_ConsumeRankTimeConf = 
{

	[1] =
	{
		StartTime = {year = 2016, month = 12, day = 28, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2016, month = 12, day = 30, hour = 23, min = 59, sec = 59},
		version = 1,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUnionFlag = false,
		isUseOpen = false,
		icon = "yuandanhuodong",
	},


	[2] =
	{
		StartTime = {year = 2016, month = 12, day = 28, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2016, month = 12, day = 30, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUnionFlag = true,
		isUseOpen = true,
		icon = "hefuhuodong",
	},
	
	[3] =
	{
		StartTime = {year = 2018, month = 8, day = 4, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 8, day = 7, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = false,
		icon = "tehuihuodong2",
		afterOpen = 1, --自然时间+开服后几天(>=)一块使用
	},
	
	[4] =
	{
		StartTime = {year = 2018, month = 8, day = 4, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 8, day = 7, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = true,
		icon = "tehuihuodong2",
		afterOpen = 8, --自然时间+开服后几天(>=)一块使用
	}
}



g_consmeRankAwardConf = 
{

	[1] = 
	{
		rankCount = 3, --显示多少个玩家
		award = 
		{
			[1] = 
			{
				minConsume = 300000,
				awardList = 
				{
					[1] = {itemid = 20121, count = 1, bind = 0},
				},
			}, --第1名

			[2] = 
			{

				minConsume = 200000,
				awardList = 
				{
					[1] = {itemid = 10299, count = 1, bind = 1},
				},
			}, --第2名

			[3] = 
			{
				minConsume = 150000,
				awardList = 
				{
					[1] = {itemid = 10316, count = 4, bind = 1},
				},
			},
			
			[4] = 
			{
				minConsume = 100000,
				awardList = 
				{
					[1] = {itemid = 10166, count = 2, bind = 1},
				},
			},
			
			[5] = 
			{
				minConsume = 100000,
				awardList = 
				{
					[1] = {itemid = 10166, count = 2, bind = 1},
				},
			},
			
			[6] = 
			{
				minConsume = 50000,
				awardList = 
				{
					[1] = {itemid = 12023, count = 1, bind = 1},
				},
			},
			
			[7] = 
			{
				minConsume = 50000,
				awardList = 
				{
					[1] = {itemid = 12023, count = 1, bind = 1},
				},
			},
			
			[8] = 
			{
				minConsume = 50000,
				awardList = 
				{
					[1] = {itemid = 12023, count = 1, bind = 1},
				},
			},
			
			[9] = 
			{
				minConsume = 50000,
				awardList = 
				{
					[1] = {itemid= 12023, count = 1, bind = 1},
				},
			},
			
			[10] = 
			{
				minConsume = 50000,
				awardList = 
				{
					[1] = {itemid = 12023, count = 1, bind = 1},
				},
			},
			
		}

	},

	[2] = 
	{
		rankCount = 3, --显示多少个玩家
		award = 
		{
			[1] = 
			{
				minConsume = 300000,
				awardList = 
				{
					[1] = {itemid = 20121, count = 1, bind = 0},
					[2] = {itemid = 10322, count = 3, bind = 0},
				},
			}, --第1名

			[2] = 
			{

				minConsume = 200000,
				awardList = 
				{
					[1] = {itemid = 12056, count = 1, bind = 1},
					[2] = {itemid = 10322, count = 2, bind = 1},
				},
			}, --第2名

			[3] = 
			{
				minConsume = 150000,
				awardList = 
				{
					[1] = {itemid = 12050, count = 1, bind = 1},
					[2] = {itemid = 10322, count = 1, bind = 1},
				},
			},
			
			[4] = 
			{
				minConsume = 100000,
				awardList = 
				{
					[1] = {itemid = 10322, count = 1, bind = 1},
				},
			},
			
			[5] = 
			{
				minConsume = 100000,
				awardList = 
				{
					[1] = {itemid = 10322, count = 1, bind = 1},
				},
			},
			
			[6] = 
			{
				minConsume = 1,
				awardList = 
				{
					[1] = {itemid = 10408, count = 1, bind = 1},
				},
			},
			
			[7] = 
			{
				minConsume = 1,
				awardList = 
				{
					[1] = {itemid = 10408, count = 1, bind = 1},
				},
			},
			
			[8] = 
			{
				minConsume = 1,
				awardList = 
				{
					[1] = {itemid = 10408, count = 1, bind = 1},
				},
			},
			
			[9] = 
			{
				minConsume = 1,
				awardList = 
				{
					[1] = {itemid= 10408, count = 1, bind = 1},
				},
			},
			
			[10] = 
			{
				minConsume = 1,
				awardList = 
				{
					[1] = {itemid = 10408, count = 1, bind = 1},
				},
			},
			
		}

	},

	[3] = 
	{
		rankCount = 3, --显示多少个玩家
		award = 
		{
			[1] = 
			{
				minConsume = 360000,
				awardList = 
				{
					[1] = {itemid = 12100, count = 1, bind = 0},
				},
			}, --第1名

			[2] = 
			{

				minConsume = 240000,
				awardList = 
				{
					[1] = {itemid = 12101, count = 1, bind = 1},
				},
			}, --第2名

			[3] = 
			{
				minConsume = 120000,
				awardList = 
				{
					[1] = {itemid = 12102, count = 1, bind = 1},
				},
			},
			
			[4] = 
			{
				minConsume = 60000,
				awardList = 
				{
					[1] = {itemid = 12103, count = 1, bind = 1},
				},
			},
			
			[5] = 
			{
				minConsume = 60000,
				awardList = 
				{
					[1] = {itemid = 12103, count = 1, bind = 1},
				},
			},
			
			[6] = 
			{
				minConsume = 10000,
				awardList = 
				{
					[1] = {itemid = 10349, count = 1, bind = 1},
				},
			},
			
			[7] = 
			{
				minConsume = 10000,
				awardList = 
				{
					[1] = {itemid = 10349, count = 1, bind = 1},
				},
			},
			
			[8] = 
			{
				minConsume = 10000,
				awardList = 
				{
					[1] = {itemid = 10349, count = 1, bind = 1},
				},
			},
			
			[9] = 
			{
				minConsume = 10000,
				awardList = 
				{
					[1] = {itemid= 10349, count = 1, bind = 1},
				},
			},
			
			[10] = 
			{
				minConsume = 10000,
				awardList = 
				{
					[1] = {itemid = 10349, count = 1, bind = 1},
				},
			},
		}
	},
	
	[4] = 
	{
		rankCount = 3, --显示多少个玩家
		award = 
		{
			[1] = 
			{
				minConsume = 360000,
				awardList = 
				{
					[1] = {itemid = 12100, count = 1, bind = 0},
				},
			}, --第1名

			[2] = 
			{

				minConsume = 240000,
				awardList = 
				{
					[1] = {itemid = 12101, count = 1, bind = 1},
				},
			}, --第2名

			[3] = 
			{
				minConsume = 120000,
				awardList = 
				{
					[1] = {itemid = 12102, count = 1, bind = 1},
				},
			},
			
			[4] = 
			{
				minConsume = 60000,
				awardList = 
				{
					[1] = {itemid = 12103, count = 1, bind = 1},
				},
			},
			
			[5] = 
			{
				minConsume = 60000,
				awardList = 
				{
					[1] = {itemid = 12103, count = 1, bind = 1},
				},
			},
			
			[6] = 
			{
				minConsume = 10000,
				awardList = 
				{
					[1] = {itemid = 10349, count = 1, bind = 1},
				},
			},
			
			[7] = 
			{
				minConsume = 10000,
				awardList = 
				{
					[1] = {itemid = 10349, count = 1, bind = 1},
				},
			},
			
			[8] = 
			{
				minConsume = 10000,
				awardList = 
				{
					[1] = {itemid = 10349, count = 1, bind = 1},
				},
			},
			
			[9] = 
			{
				minConsume = 10000,
				awardList = 
				{
					[1] = {itemid= 10349, count = 1, bind = 1},
				},
			},
			
			[10] = 
			{
				minConsume = 10000,
				awardList = 
				{
					[1] = {itemid = 10349, count = 1, bind = 1},
				},
			},
		}
	}
}