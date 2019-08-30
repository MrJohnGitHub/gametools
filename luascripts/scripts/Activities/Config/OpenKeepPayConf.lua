--连续充值
g_KeepPayConf = 
{
	[1] =
	{
		StartTime = {year = 2018, month = 8, day = 8, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 8, day = 14, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = false,
		icon = "tehuihuodong2",
		afterOpen = 8, --自然时间+开服后几天(>=)一块使用
		award = 
		{
			[1] = 
			{
				minCount = 1,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 12140, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1}
				},
			},

			[2] =
			{
				minCount = 2,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10410, count = 2, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1}
				},
			},

			[3] = 
			{
				minCount = 3,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 12138, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1}
				},
			},
			
			[4] = 
			{
				minCount = 4,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0, --最终将就配置1 不是就配置0
				awardList = 
				{
					[1] = {itemid = 10408, count = 2, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1}
				},
			},	
			
			[5] = 
			{
				minCount = 5,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 12139, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1}
				},
			},
			
			[6] = 
			{
				minCount = 6,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10165, count = 2, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1}
				},
			},
			
			[7] = 
			{
				minCount = 7,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 12141, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 8, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1}
				},
			}
		}
	},
	
	[2] =
	{
		StartTime = {year = 2018, month = 8, day = 8, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 8, day = 14, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = true,
		icon = "tehuihuodong2",
		afterOpen = 1, --自然时间+开服后几天(>=)一块使用
		award = 
		{
			[1] = 
			{
				minCount = 1,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 12140, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1}
				},
			},

			[2] =
			{
				minCount = 2,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10410, count = 2, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1}
				},
			},

			[3] = 
			{
				minCount = 3,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 12138, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1}
				},
			},
			
			[4] = 
			{
				minCount = 4,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0, --最终将就配置1 不是就配置0
				awardList = 
				{
					[1] = {itemid = 10408, count = 2, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1}
				},
			},	
			
			[5] = 
			{
				minCount = 5,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 12139, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1}
				},
			},
			
			[6] = 
			{
				minCount = 6,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10165, count = 2, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1}
				},
			},
			
			[7] = 
			{
				minCount = 7,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 12141, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 8, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1}
				},
			}
		}
	},
	
	[3] =
	{
		StartTime = {year = 2018, month = 9, day = 19, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 9, day = 25, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = false,
		icon = "tehuihuodong2",
		afterOpen = 8, --自然时间+开服后几天(>=)一块使用
		award = 
		{
			[1] = 
			{
				minCount = 1,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[2] =
			{
				minCount = 2,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10348, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[3] = 
			{
				minCount = 3,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[4] = 
			{
				minCount = 4,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0, --最终将就配置1 不是就配置0
				awardList = 
				{
					[1] = {itemid = 10408, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},	
			
			[5] = 
			{
				minCount = 5,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[6] = 
			{
				minCount = 6,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10165, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[7] = 
			{
				minCount = 7,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10259, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 8, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			}
		}
	},
	
	[4] =
	{
		StartTime = {year = 2018, month = 9, day = 19, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 9, day = 25, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = true,
		icon = "tehuihuodong2",
		afterOpen = 1, --自然时间+开服后几天(>=)一块使用
		award = 
		{
			[1] = 
			{
				minCount = 1,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[2] =
			{
				minCount = 2,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10348, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[3] = 
			{
				minCount = 3,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[4] = 
			{
				minCount = 4,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0, --最终将就配置1 不是就配置0
				awardList = 
				{
					[1] = {itemid = 10408, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},	
			
			[5] = 
			{
				minCount = 5,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[6] = 
			{
				minCount = 6,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10165, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[7] = 
			{
				minCount = 7,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10259, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 8, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			}
		}
	},
	
	[5] =
	{
		StartTime = {year = 2018, month = 9, day = 26, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 10, day = 2, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = false,
		icon = "tehuihuodong2",
		afterOpen = 8, --自然时间+开服后几天(>=)一块使用
		award = 
		{
			[1] = 
			{
				minCount = 1,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[2] =
			{
				minCount = 2,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10348, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[3] = 
			{
				minCount = 3,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[4] = 
			{
				minCount = 4,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0, --最终将就配置1 不是就配置0
				awardList = 
				{
					[1] = {itemid = 10408, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},	
			
			[5] = 
			{
				minCount = 5,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[6] = 
			{
				minCount = 6,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10165, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[7] = 
			{
				minCount = 7,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10259, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 8, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			}
		}
	},
	
	[6] =
	{
		StartTime = {year = 2018, month = 9, day = 26, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 10, day = 2, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = true,
		icon = "tehuihuodong2",
		afterOpen = 1, --自然时间+开服后几天(>=)一块使用
		award = 
		{
			[1] = 
			{
				minCount = 1,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[2] =
			{
				minCount = 2,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10348, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[3] = 
			{
				minCount = 3,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[4] = 
			{
				minCount = 4,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0, --最终将就配置1 不是就配置0
				awardList = 
				{
					[1] = {itemid = 10408, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},	
			
			[5] = 
			{
				minCount = 5,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[6] = 
			{
				minCount = 6,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10165, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[7] = 
			{
				minCount = 7,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10259, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 8, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			}
		}
	},
	
	[7] =
	{
		StartTime = {year = 2018, month = 8, day = 22, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 8, day = 28, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = false,
		icon = "tehuihuodong2",
		afterOpen = 8, --自然时间+开服后几天(>=)一块使用
		award = 
		{
			[1] = 
			{
				minCount = 1,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[2] =
			{
				minCount = 2,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10348, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[3] = 
			{
				minCount = 3,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[4] = 
			{
				minCount = 4,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0, --最终将就配置1 不是就配置0
				awardList = 
				{
					[1] = {itemid = 10408, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},	
			
			[5] = 
			{
				minCount = 5,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[6] = 
			{
				minCount = 6,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10165, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[7] = 
			{
				minCount = 7,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10259, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 8, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			}
		}
	},
	
	[8] =
	{
		StartTime = {year = 2018, month = 8, day = 22, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 8, day = 28, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = true,
		icon = "tehuihuodong2",
		afterOpen = 1, --自然时间+开服后几天(>=)一块使用
		award = 
		{
			[1] = 
			{
				minCount = 1,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[2] =
			{
				minCount = 2,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10348, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[3] = 
			{
				minCount = 3,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[4] = 
			{
				minCount = 4,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0, --最终将就配置1 不是就配置0
				awardList = 
				{
					[1] = {itemid = 10408, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},	
			
			[5] = 
			{
				minCount = 5,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[6] = 
			{
				minCount = 6,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10165, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[7] = 
			{
				minCount = 7,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10259, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 8, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			}
		}
	},
	
	[9] =
	{
		StartTime = {year = 2018, month = 9, day = 12, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 9, day = 18, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = false,
		icon = "tehuihuodong2",
		afterOpen = 8, --自然时间+开服后几天(>=)一块使用
		award = 
		{
			[1] = 
			{
				minCount = 1,
				minPay = 1,
				itemCount = 4, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 12140, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[2] =
			{
				minCount = 2,
				minPay = 1,
				itemCount = 4, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10418, count = 5, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[3] = 
			{
				minCount = 3,
				minPay = 1,
				itemCount = 4, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 12138, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 3, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[4] = 
			{
				minCount = 4,
				minPay = 1,
				itemCount = 4, --领取这个奖励需要多少个背包空格
				bigAward = 0, --最终将就配置1 不是就配置0
				awardList = 
				{
					[1] = {itemid = 10418, count = 5, bind = 1},
					[2] = {itemid = 10253, count = 3, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},	
			
			[5] = 
			{
				minCount = 5,
				minPay = 1,
				itemCount = 4, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 12139, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[6] = 
			{
				minCount = 6,
				minPay = 1,
				itemCount = 4, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10418, count = 5, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[7] = 
			{
				minCount = 7,
				minPay = 1,
				itemCount = 4, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 12141, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			}
		}
	},
	
	[10] =
	{
		StartTime = {year = 2018, month = 9, day = 12, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 9, day = 18, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = true,
		icon = "tehuihuodong2",
		afterOpen = 1, --自然时间+开服后几天(>=)一块使用
		award = 
		{
			[1] = 
			{
				minCount = 1,
				minPay = 1,
				itemCount = 4, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 12140, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[2] =
			{
				minCount = 2,
				minPay = 1,
				itemCount = 4, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10418, count = 5, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[3] = 
			{
				minCount = 3,
				minPay = 1,
				itemCount = 4, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 12138, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 3, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[4] = 
			{
				minCount = 4,
				minPay = 1,
				itemCount = 4, --领取这个奖励需要多少个背包空格
				bigAward = 0, --最终将就配置1 不是就配置0
				awardList = 
				{
					[1] = {itemid = 10418, count = 5, bind = 1},
					[2] = {itemid = 10253, count = 3, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},	
			
			[5] = 
			{
				minCount = 5,
				minPay = 1,
				itemCount = 4, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 12139, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[6] = 
			{
				minCount = 6,
				minPay = 1,
				itemCount = 4, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10418, count = 5, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[7] = 
			{
				minCount = 7,
				minPay = 1,
				itemCount = 4, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 12141, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			}
		}
	},
	
	[11] =
	{
		StartTime = {year = 2018, month = 6, day = 13, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 6, day = 19, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = false,
		icon = "tehuihuodong2",
		afterOpen = 8, --自然时间+开服后几天(>=)一块使用
		award = 
		{
			[1] = 
			{
				minCount = 1,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[2] =
			{
				minCount = 2,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10348, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[3] = 
			{
				minCount = 3,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[4] = 
			{
				minCount = 4,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0, --最终将就配置1 不是就配置0
				awardList = 
				{
					[1] = {itemid = 10408, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},	
			
			[5] = 
			{
				minCount = 5,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[6] = 
			{
				minCount = 6,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10165, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[7] = 
			{
				minCount = 7,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10259, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 8, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			}
		}
	},
	
	[12] =
	{
		StartTime = {year = 2018, month = 6, day = 13, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 6, day = 19, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = true,
		icon = "tehuihuodong2",
		afterOpen = 1, --自然时间+开服后几天(>=)一块使用
		award = 
		{
			[1] = 
			{
				minCount = 1,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[2] =
			{
				minCount = 2,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10348, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[3] = 
			{
				minCount = 3,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[4] = 
			{
				minCount = 4,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0, --最终将就配置1 不是就配置0
				awardList = 
				{
					[1] = {itemid = 10408, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},	
			
			[5] = 
			{
				minCount = 5,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[6] = 
			{
				minCount = 6,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10165, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[7] = 
			{
				minCount = 7,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10259, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 8, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			}
		}
	},
	
	[13] =
	{
		StartTime = {year = 2018, month = 6, day = 20, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 6, day = 26, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = false,
		icon = "tehuihuodong2",
		afterOpen = 8, --自然时间+开服后几天(>=)一块使用
		award = 
		{
			[1] = 
			{
				minCount = 1,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[2] =
			{
				minCount = 2,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10348, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[3] = 
			{
				minCount = 3,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[4] = 
			{
				minCount = 4,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0, --最终将就配置1 不是就配置0
				awardList = 
				{
					[1] = {itemid = 10408, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},	
			
			[5] = 
			{
				minCount = 5,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[6] = 
			{
				minCount = 6,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10165, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[7] = 
			{
				minCount = 7,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10259, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 8, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			}
		}
	},
	
	[14] =
	{
		StartTime = {year = 2018, month = 6, day = 20, hour = 0, min = 0, sec = 0},
		EndTime = {year = 2018, month = 6, day = 26, hour = 23, min = 59, sec = 59},
		version = 0,
		OpenStartDay = 1,
		OpenEndDay = 2,
		isUseOpen = false,
		isUnionFlag = true,
		icon = "tehuihuodong2",
		afterOpen = 1, --自然时间+开服后几天(>=)一块使用
		award = 
		{
			[1] = 
			{
				minCount = 1,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[2] =
			{
				minCount = 2,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10348, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 2, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},

			[3] = 
			{
				minCount = 3,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[4] = 
			{
				minCount = 4,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0, --最终将就配置1 不是就配置0
				awardList = 
				{
					[1] = {itemid = 10408, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 4, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},	
			
			[5] = 
			{
				minCount = 5,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 40805, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[6] = 
			{
				minCount = 6,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10165, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 6, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			},
			
			[7] = 
			{
				minCount = 7,
				minPay = 1,
				itemCount = 3, --领取这个奖励需要多少个背包空格
				bigAward = 0,
				awardList = 
				{
					[1] = {itemid = 10259, count = 1, bind = 1},
					[2] = {itemid = 10253, count = 8, bind = 1},
					[3] = {itemid = 12014, count = 5, bind = 1},
					[4] = {itemid = 40901, count = 8, bind = 1}
				},
			}
		}
	}
}