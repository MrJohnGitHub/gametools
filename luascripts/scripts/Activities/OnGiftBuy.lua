--活动配置须知：
--活动次数可以在后边增加，次数要求连续递增。
--活动版本号要求依次递增，新加活动需要接上次活动序列，不然老号会开不出活动。
--活动时间可选择自然时间或开服天数，但是时间不能交叉。
--1-神盾礼包
--2-修炼礼包
--3-血玉礼包
--4-转生礼包
--5-宝石礼包
--6-翅膀礼包
--7-魂珠礼包
--8-积分礼包
--9-坐骑礼包
--10-财富礼包
--11-特戒礼包
--12-轮回礼包
--13-魔玉礼包
--14-魔盾礼包
--15-铸魂礼包
--16-声望礼包
--17-熔炼礼包
--18-经验礼包
--19-召唤礼包
--=======================礼包抢购配置===============================
local g_gift_buy_conf = 
{
	[1] = {								--合服第一次活动
		StartTime = {year = 2017, month = 1, day = 21, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2017, month = 1, day = 21, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 4,                                              --开服时间
		OpenEndDay = 4,                                             ---开服时间
		isUnionFlag = true,                                 -- 是否合服
		isUseOpen = true,                                 --true为使用开服时间 false为使用自然事件
		afterOpen = 18,                                      --自然时间+开服后几天(>=)一块使用                                            
		award = 
		{
			[1] = 
			{
				id = 5,					--礼包ID
				need = 4588,
				oldgold	= 11800,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10155,1,1},
					{10410,1,1},
					{10409,5,1},
					{10409,3,1}
					}
			},
			[2] = 
			{
				id = 12,
				need = 7888,
				oldgold	= 12100,
				limit = 2,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10325,1,1},
					{10324,1,1},
					{10287,5,1},
					{10301,2,1}
					}
			},
			[3] = 
			{
				id = 7,
				need = 13888,
				oldgold	= 27200,
				limit = 2,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10242,2,1},
					{10253,1,1},
					{10287,5,1},
					{10301,2,1}
					}
			},
			[4] = 
			{
				id = 11,			
				need = 16888,
				oldgold	= 21600,
				limit = 2,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10166,2,1},
					{10253,1,1},
					{10287,5,1},
					{10301,2,1}
					}
			}
		}
	},

    [2] = {								--合服第二次活动
		StartTime = {year = 2017, month = 1, day = 21, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2017, month = 1, day = 21, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 5,                                              --开服时间
		OpenEndDay = 5,                                             ---开服时间
		isUnionFlag = true,                                 -- 是否合服
		isUseOpen = true,                                --true为使用开服时间 false为使用自然事件
		afterOpen = 19,                                 --自然时间+开服后几天(>=)一块使用                                            
		award = 
		{
			[1] = 
			{
				id = 8,					--礼包ID
				need = 2888,
				oldgold	= 11600,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{31302,1,1},
					{10253,1,1},
					{10287,5,1},
					{10301,2,1}
					}
			},
			[2] = 
			{
				id = 4,
				need = 5888,
				oldgold	= 11600,
				limit = 2,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10412,1,1},
					{10253,1,1},
					{10287,5,1},
					{10301,2,1}
					}
			},
			[3] = 
			{
				id = 7,
				need = 13888,
				oldgold	= 27200,
				limit = 2,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10242,2,1},
					{10253,1,1},
					{10287,5,1},
					{10301,2,1}
					}
			},
			[4] = 
			{
				id = 11,			
				need = 16888,
				oldgold	= 21600,
				limit = 2,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10166,2,1},
					{10253,1,1},
					{10287,5,1},
					{10301,2,1}
					}
			}
		}
	},

	[3] = {								--合服第三次活动
		StartTime = {year = 2017, month = 1, day = 21, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2017, month = 1, day = 21, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 6,                                              --开服时间
		OpenEndDay = 6,                                             ---开服时间
		isUnionFlag = true,                                 -- 为使用开服时间,
		isUseOpen = true,                                 --true为使用开服时间 false为使用自然事件
		afterOpen = 20,                                   --自然时间+开服后几天(>=)一块使用                                            
		award = 
		{
			[1] = 
			{
				id = 5,					--礼包ID
				need = 4588,
				oldgold	= 11800,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10155,1,1},
					{10410,1,1},
					{10409,5,1},
					{10409,3,1}
					}
			},
			[2] = 
			{
				id = 12,
				need = 7888,
				oldgold	= 11210,
				limit = 2,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10325,1,1},
					{10324,1,1},
					{10287,5,1},
					{10301,2,1}
					}
			},
			[3] = 
			{
				id = 7,
				need = 13888,
				oldgold	= 27200,
				limit = 2,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10242,2,1},
					{10253,1,1},
					{10287,5,1},
					{10301,2,1}
					}
			},
			[4] = 
			{
				id = 11,			
				need = 16888,
				oldgold	= 21600,
				limit = 2,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10166,2,1},
					{10253,1,1},
					{10287,5,1},
					{10301,2,1}
					}
			}
		}
	},	

	[4] = {								--合服第四次活动
		StartTime = {year = 2017, month = 1, day = 21, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2017, month = 1, day = 21, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,			      		--活动版本
		OpenStartDay = 7,                                              --开服时间
		OpenEndDay = 7,                                             ---开服时间
		isUnionFlag = true,                                 -- 是否合服
		isUseOpen = true,                               --true为使用开服时间 false为使用自然事件
		afterOpen = 21,                                     --自然时间+开服后几天(>=)一块使用                                            
		award = 
		{
			[1] = 
			{
				id = 8,					--礼包ID
				need = 2888,
				oldgold	= 11600,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 99999,		
				itemCount = 4,	--全服限够次数 大于1000时前端不显示次数
				item = {
					{31302,1,1},
					{10253,1,1},
					{10287,5,1},
					{10301,2,1}
					}
			},
			[2] = 
			{
				id = 4,
				need = 5888,
				oldgold	= 11600,
				limit = 2,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10412,1,1},
					{10253,1,1},
					{10287,5,1},
					{10301,2,1}
					}
			},
			[3] = 
			{
				id = 7,
				need = 13888,
				oldgold	= 27200,
				limit = 2,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10242,2,1},
					{10253,1,1},
					{10287,5,1},
					{10301,2,1}
					}
			},
			[4] = 
			{
				id = 11,			
				need = 16888,
				oldgold	= 21600,
				limit = 2,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10166,2,1},
					{10253,1,1},
					{10287,5,1},
					{10301,2,1}
					}
			}
		}
	},

	[5] = {								--开服第一天
		StartTime = {year = 2017, month = 3, day = 10, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2017, month = 3, day = 10, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 29,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 1,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = true,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 0,                                              --自然时间+开服后几天(>=)一块使用                                            
		award = 
		{
			[1] = 
			{
				id = 6,					--礼包ID
				need = 1888,
				oldgold	= 3600,			--购买消耗元宝
				limit = 3,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40101,30,1},
					{40101,30,1},
					{40101,30,1},
					{40101,30,1}
					}
			},
			[2] = 
			{
				id = 9,
				need = 1888,
				oldgold	= 3600,
				limit = 3,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{40902,18,1},
					{40902,18,1},
					{40902,18,1},
					{40902,18,1}
					}
			},
			[3] = 
			{
				id = 2,
				need = 1888,
				oldgold	= 3200,
				limit = 3,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{12022,1,1},
					{12022,1,1},
					{12022,1,1},
					{40901,1,1}
					}
			},
			[4] = 
			{
				id = 5,			
				need = 1888,
				oldgold	= 3200,
				limit = 3,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10410,1,1},
					{10410,1,1},
					{10253,1,1},
					{40901,1,1}
					}
			}
		}
	},

    [6] = {								--开服第二天
		StartTime = {year = 2017, month = 3, day = 10, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2017, month = 3, day = 10, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 30,					--活动版本
		OpenStartDay = 2,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = true,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 0,                                              --自然时间+开服后几天(>=)一块使用                                            
		award = 
		{
			[1] = 
			{
				id = 9,					--礼包ID
				need = 1888,
				oldgold	= 3600,			--购买消耗元宝
				limit = 3,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40902,18,1},
					{40902,18,1},
					{40902,18,1},
					{40902,18,1}
					}
			},
			[2] = 
			{
				id = 6,
				need = 1888,
				oldgold	= 3600,
				limit = 3,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{40101,30,1},
					{40101,30,1},
					{40101,30,1},
					{40101,30,1}
					}
			},
			[3] = 
			{
				id = 2,
				need = 1888,
				oldgold	= 3200,
				limit = 3,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{12022,1,1},
					{12022,1,1},
					{12022,1,1},
					{40901,1,1}
					}
			},
			[4] = 
			{
				id = 7,			
				need = 1888,
				oldgold	= 3260,
				limit = 3,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10408,1,1},
					{10408,1,1},
					{10253,1,1},
					{40901,1,1}
					}
			}
		}
	},

    [7] = {								--开服第三天
		StartTime = {year = 2017, month = 3, day = 10, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2017, month = 3, day = 10, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 31,					--活动版本
		OpenStartDay = 3,                                              --开服时间
		OpenEndDay = 3,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = true,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 0,                                              --自然时间+开服后几天(>=)一块使用                                            
		award = 
		{
			[1] = 
			{
				id = 2,					--礼包ID
				need = 1888,
				oldgold	= 3200,			--购买消耗元宝
				limit = 3,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{12022,1,1},
					{12022,1,1},
					{12022,1,1},
					{40901,1,1}
					}
			},
			[2] = 
			{
				id = 6,
				need = 1888,
				oldgold	= 3600,
				limit = 3,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{40101,30,1},
					{40101,30,1},
					{40101,30,1},
					{40101,30,1}
					}
			},
			[3] = 
			{
				id = 9,					--礼包ID
				need = 1888,
				oldgold	= 3600,			--购买消耗元宝
				limit = 3,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40902,18,1},
					{40902,18,1},
					{40902,18,1},
					{40902,18,1}
					}
			},
			[4] = 
			{
				id = 5,			
				need = 1888,
				oldgold	= 3200,
				limit = 3,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10410,1,1},
					{10410,1,1},
					{10253,1,1},
					{40901,1,1}
					}
			}
		}
	},	

	[8] = {								--开服第四天
		StartTime = {year = 2017, month = 3, day = 10, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2017, month = 3, day = 10, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 32,					--活动版本
		OpenStartDay = 4,                                              --开服时间
		OpenEndDay = 4,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = true,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 0,                                              --自然时间+开服后几天(>=)一块使用                                            
		award = 
		{
			[1] = 
			{
				id = 5,					--礼包ID
				need = 1888,
				oldgold	= 3200,			--购买消耗元宝
				limit = 3,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10410,1,1},
					{10410,1,1},
					{10253,1,1},
					{40901,1,1}
					}
			},
			[2] = 
			{
				id = 9,
				need = 1888,
				oldgold	= 3600,
				limit = 3,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{40902,18,1},
					{40902,18,1},
					{40902,18,1},
					{40902,18,1}
					}
			},
			[3] = 
			{
				id = 8,					--礼包ID
				need = 1888,
				oldgold	= 3200,			--购买消耗元宝
				limit = 3,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10413,1,1},
					{10413,1,1},
					{10413,1,1},
					{40901,1,1}
					}
			},
			[4] = 
			{
				id = 7,			
				need = 1888,
				oldgold	= 3260,
				limit = 3,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10408,1,1},
					{10408,1,1},
					{10253,1,1},
					{40901,1,1}
					}
			}
		}
	},

	[9] = {								--开服第五天
		StartTime = {year = 2017, month = 3, day = 10, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2017, month = 3, day = 10, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 33,					--活动版本
		OpenStartDay = 5,                                              --开服时间
		OpenEndDay = 5,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = true,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 0,                                              --自然时间+开服后几天(>=)一块使用                                            
		award = 
		{
			[1] = 
			{
				id = 7,					--礼包ID
				need = 1888,
				oldgold	= 3260,			--购买消耗元宝
				limit = 3,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10408,1,1},
					{10408,1,1},
					{10253,1,1},
					{40901,1,1}
					}
			},
			[2] = 
			{
				id = 6,
				need = 1888,
				oldgold	= 3600,
				limit = 3,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{40101,30,1},
					{40101,30,1},
					{40101,30,1},
					{40101,30,1}
					}
			},
			[3] = 
			{
				id = 8,					--礼包ID
				need = 1888,
				oldgold	= 3200,			--购买消耗元宝
				limit = 3,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10413,1,1},
					{10413,1,1},
					{10413,1,1},
					{40901,1,1}
					}
			},
			[4] = 
			{
				id = 2,			
				need = 1888,
				oldgold	= 3200,
				limit = 3,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{12022,1,1},
					{12022,1,1},
					{12022,1,1},
					{40901,1,1}
					}
			}
		}
	},

	[10] = {								--开服第六天
		StartTime = {year = 2017, month = 3, day = 10, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2017, month = 3, day = 10, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 34,					--活动版本
		OpenStartDay = 6,                                              --开服时间
		OpenEndDay = 6,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = true,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 0,                                              --自然时间+开服后几天(>=)一块使用                                            
		award = 
		{
			[1] = 
			{
				id = 8,					--礼包ID
				need = 1888,
				oldgold	= 3200,			--购买消耗元宝
				limit = 3,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10413,1,1},
					{10413,1,1},
					{10413,1,1},
					{40901,1,1}
					}
			},
			[2] = 
			{
				id = 6,
				need = 1888,
				oldgold	= 3600,
				limit = 3,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{40101,30,1},
					{40101,30,1},
					{40101,30,1},
					{40101,30,1}
					}
			},
			[3] = 
			{
				id = 7,					--礼包ID
				need = 1888,
				oldgold	= 3260,			--购买消耗元宝
				limit = 3,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10408,1,1},
					{10408,1,1},
					{10253,1,1},
					{40901,1,1}
					}
			},
			[4] = 
			{
				id = 5,			
				need = 1888,
				oldgold	= 3200,
				limit = 3,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10410,1,1},
					{10410,1,1},
					{10253,1,1},
					{40901,1,1}
					}
			}
		}
	},

	[11] = {								
		StartTime = {year = 2018, month = 9, day = 9, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 9, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 8,                                             --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 8,					--礼包ID
				need = 2988,
				oldgold	= 8000,			--购买消耗元宝
				limit = 40,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10413,2,1},
					{10413,2,1},
					{10413,2,1},
					{10413,2,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4888,
				oldgold	= 12000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,3,1},
					{10348,3,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 2800,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 5,					--礼包ID
				need = 15888,
				oldgold	= 40000,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10155,3,1},
					{10410,4,1},
					{10410,4,1},
					{10410,2,1}
					}
			}
		}
	},

	[12] = {								
		StartTime = {year = 2018, month = 9, day = 10, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 10, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 9,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 8,					--礼包ID
				need = 2988,
				oldgold	= 8000,			--购买消耗元宝
				limit = 40,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10413,2,1},
					{10413,2,1},
					{10413,2,1},
					{10413,2,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4888,
				oldgold	= 12000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,3,1},
					{10348,3,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 2800,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 7,					--礼包ID
				need = 15888,
				oldgold	= 42240,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10242,3,1},
					{10408,1,1},
					{10408,1,1},
					{10408,1,1}
					}
			}
		}
	},

	[13] = {								
		StartTime = {year = 2018, month = 9, day = 11, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 11, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 10,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 8,					--礼包ID
				need = 2988,
				oldgold	= 8000,			--购买消耗元宝
				limit = 40,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10413,2,1},
					{10413,2,1},
					{10413,2,1},
					{10413,2,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4888,
				oldgold	= 12000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,3,1},
					{10348,3,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 2800,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 12,					--礼包ID
				need = 15888,
				oldgold	= 40000,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10325,4,1},
					{10324,4,1},
					{10324,4,1},
					{10324,2,1}
					}
			}
		}
	},

    [14] = {								
		StartTime = {year = 2018, month = 8, day = 7, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 8, day = 7, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 11,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4288,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 2800,				--购买消耗元宝
				limit = 20,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 11,					--礼包ID
				need = 15888,
				oldgold	= 36000,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10166,3,1},
					{10165,2,1},
					{10165,2,1},
					{10165,2,1}
					}
			}
		}
	},

    [15] = {								
		StartTime = {year = 2018, month = 9, day = 9, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 9, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 8,                                             --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 8,					--礼包ID
				need = 2988,
				oldgold	= 8000,			--购买消耗元宝
				limit = 40,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10413,2,1},
					{10413,2,1},
					{10413,2,1},
					{10413,2,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4888,
				oldgold	= 12000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,3,1},
					{10348,3,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 2800,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 5,					--礼包ID
				need = 15888,
				oldgold	= 40000,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10155,3,1},
					{10410,4,1},
					{10410,4,1},
					{10410,2,1}
					}
			}
		}
	},

	[16] = {								
		StartTime = {year = 2018, month = 9, day = 10, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 10, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 9,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 8,					--礼包ID
				need = 2988,
				oldgold	= 8000,			--购买消耗元宝
				limit = 40,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10413,2,1},
					{10413,2,1},
					{10413,2,1},
					{10413,2,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4888,
				oldgold	= 12000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,3,1},
					{10348,3,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 2800,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 7,					--礼包ID
				need = 15888,
				oldgold	= 42240,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10242,3,1},
					{10408,1,1},
					{10408,1,1},
					{10408,1,1}
					}
			}
		}
	},

	[17] = {								
		StartTime = {year = 2018, month = 9, day = 11, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 11, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 10,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 8,					--礼包ID
				need = 2988,
				oldgold	= 8000,			--购买消耗元宝
				limit = 40,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10413,2,1},
					{10413,2,1},
					{10413,2,1},
					{10413,2,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4888,
				oldgold	= 12000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,3,1},
					{10348,3,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 2800,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 12,					--礼包ID
				need = 15888,
				oldgold	= 40000,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10325,4,1},
					{10324,4,1},
					{10324,4,1},
					{10324,2,1}
					}
			}
		}
	},

    [18] = {								
		StartTime = {year = 2018, month = 8, day = 7, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 8, day = 7, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 11,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4288,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 2800,				--购买消耗元宝
				limit = 20,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 11,					--礼包ID
				need = 15888,
				oldgold	= 36000,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10166,3,1},
					{10165,2,1},
					{10165,2,1},
					{10165,2,1}
					}
			}
		}
	},

    [21] = {								
		StartTime = {year = 2018, month = 8, day = 12, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 8, day = 12, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 8,                                             --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 7,					--礼包ID
				need = 3288,
				oldgold	= 6400,				--购买消耗元宝
				limit = 40,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10408,2,1},
					{10408,1,1},
					{10408,1,1},
					{10408,1,1}
					}
			},
			[3] = 
			{
				id = 15,					--礼包ID
				need = 4888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 3,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[4] = 
			{
				id = 16,					--礼包ID
				need = 9888,
				oldgold	= 12700,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10503,1,1},
					{10502,2,1},
					{12014,2,1},
					{10301,1,1}
					}
			}
		}
	},

	[22] = {								
		StartTime = {year = 2018, month = 8, day = 13, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 8, day = 13, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 9,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 7,					--礼包ID
				need = 3288,
				oldgold	= 6400,				--购买消耗元宝
				limit = 40,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10408,2,1},
					{10408,1,1},
					{10408,1,1},
					{10408,1,1}
					}
			},
			[3] = 
			{
				id = 15,					--礼包ID
				need = 4888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 3,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[4] = 
			{
				id = 8,					--礼包ID
				need = 15888,
				oldgold	= 26000,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{31302,2,1},
					{10413,2,1},
					{10413,2,1},
					{10413,2,1}
					}
			}
		}
	},

	[23] = {								
		StartTime = {year = 2018, month = 8, day = 14, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 8, day = 14, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 10,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 7,					--礼包ID
				need = 3288,
				oldgold	= 6400,				--购买消耗元宝
				limit = 40,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10408,2,1},
					{10408,1,1},
					{10408,1,1},
					{10408,1,1}
					}
			},
			[3] = 
			{
				id = 15,					--礼包ID
				need = 4888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 3,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[4] = 
			{
				id = 11,					--礼包ID
				need = 18888,
				oldgold	= 23000,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10166,2,1},
					{10165,1,1},
					{10165,1,1},
					{10165,1,1}
					}
			}
		}
	},

    [24] = {								
		StartTime = {year = 2018, month = 4, day = 24, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 4, day = 24, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 11,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4288,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 2800,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 11,
				need = 15888,
				oldgold	= 36000,
				limit = 2,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10166,3,1},
					{10165,2,1},
					{10165,2,1},
					{10165,2,1}
					}
			}
		}
	},

    [25] = {								
		StartTime = {year = 2018, month = 8, day = 12, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 8, day = 12, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 8,                                             --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 7,					--礼包ID
				need = 3288,
				oldgold	= 6400,				--购买消耗元宝
				limit = 40,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10408,2,1},
					{10408,1,1},
					{10408,1,1},
					{10408,1,1}
					}
			},
			[3] = 
			{
				id = 15,					--礼包ID
				need = 4888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 3,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[4] = 
			{
				id = 16,					--礼包ID
				need = 9888,
				oldgold	= 12700,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10503,1,1},
					{10502,2,1},
					{12014,2,1},
					{10301,1,1}
					}
			}
		}
	},

	[26] = {								
		StartTime = {year = 2018, month = 8, day = 13, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 8, day = 13, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 9,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 7,					--礼包ID
				need = 3288,
				oldgold	= 6400,				--购买消耗元宝
				limit = 40,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10408,2,1},
					{10408,1,1},
					{10408,1,1},
					{10408,1,1}
					}
			},
			[3] = 
			{
				id = 15,					--礼包ID
				need = 4888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 3,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[4] = 
			{
				id = 8,					--礼包ID
				need = 15888,
				oldgold	= 26000,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{31302,2,1},
					{10413,2,1},
					{10413,2,1},
					{10413,2,1}
					}
			}
		}
	},

	[27] = {								
		StartTime = {year = 2018, month = 8, day = 14, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 8, day = 14, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 10,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 7,					--礼包ID
				need = 3288,
				oldgold	= 6400,				--购买消耗元宝
				limit = 40,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10408,2,1},
					{10408,1,1},
					{10408,1,1},
					{10408,1,1}
					}
			},
			[3] = 
			{
				id = 15,					--礼包ID
				need = 4888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 3,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[4] = 
			{
				id = 11,					--礼包ID
				need = 18888,
				oldgold	= 23000,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10166,2,1},
					{10165,1,1},
					{10165,1,1},
					{10165,1,1}
					}
			}
		}
	},

    [28] = {								
		StartTime = {year = 2018, month = 4, day = 24, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 4, day = 24, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 11,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4288,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 2800,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 11,
				need = 15888,
				oldgold	= 36000,
				limit = 2,
				tlimit = 99999,
				itemCount = 4,
				item = {
					{10166,3,1},
					{10165,2,1},
					{10165,2,1},
					{10165,2,1}
					}
			}
		}
	},

	[31] = {								
		StartTime = {year = 2018, month = 5, day = 26, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 5, day = 26, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 8,                                             --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4288,
				oldgold	= 10000,			--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 10000,				--购买消耗元宝
				limit = 20,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 5,					--礼包ID
				need = 15888,
				oldgold	= 40000,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10155,3,1},
					{10410,4,1},
					{10410,4,1},
					{10410,2,1}
					}
			}
		}
	},

	[32] = {								
		StartTime = {year = 2018, month = 5, day = 27, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 5, day = 27, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 9,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4288,
				oldgold	= 10000,			--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 10000,				--购买消耗元宝
				limit = 20,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 7,					--礼包ID
				need = 15888,
				oldgold	= 42240,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10242,3,1},
					{10408,1,1},
					{10408,1,1},
					{10408,1,1}
					}
			}
		}
	},

	[33] = {								
		StartTime = {year = 2018, month = 5, day = 28, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 5, day = 28, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 10,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4288,
				oldgold	= 10000,			--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 10000,				--购买消耗元宝
				limit = 20,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 11,					--礼包ID
				need = 15888,
				oldgold	= 36000,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10166,3,1},
					{10165,2,1},
					{10165,2,1},
					{10165,2,1}
					}
			}
		}
	},

    [34] = {								
		StartTime = {year = 2018, month = 5, day = 29, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 5, day = 29, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 11,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4288,
				oldgold	= 10000,			--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 10000,				--购买消耗元宝
				limit = 20,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 11,					--礼包ID
				need = 15888,
				oldgold	= 36000,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10166,3,1},
					{10165,2,1},
					{10165,2,1},
					{10165,2,1}
					}
			}
		}
	},

    [35] = {								
		StartTime = {year = 2018, month = 5, day = 26, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 5, day = 26, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 8,                                             --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4288,
				oldgold	= 10000,			--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 10000,				--购买消耗元宝
				limit = 20,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 5,					--礼包ID
				need = 15888,
				oldgold	= 40000,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10155,3,1},
					{10410,4,1},
					{10410,4,1},
					{10410,2,1}
					}
			}
		}
	},

	[36] = {								
		StartTime = {year = 2018, month = 5, day = 27, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 5, day = 27, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 9,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4288,
				oldgold	= 10000,			--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 10000,				--购买消耗元宝
				limit = 20,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 7,					--礼包ID
				need = 15888,
				oldgold	= 42240,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10242,3,1},
					{10408,1,1},
					{10408,1,1},
					{10408,1,1}
					}
			}
		}
	},

	[37] = {								
		StartTime = {year = 2018, month = 5, day = 28, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 5, day = 28, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 10,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4288,
				oldgold	= 10000,			--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 10000,				--购买消耗元宝
				limit = 20,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 11,					--礼包ID
				need = 15888,
				oldgold	= 36000,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10166,3,1},
					{10165,2,1},
					{10165,2,1},
					{10165,2,1}
					}
			}
		}
	},

    [38] = {								
		StartTime = {year = 2018, month = 5, day = 29, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 5, day = 29, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 11,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 17,					--礼包ID
				need = 1888,
				oldgold	= 10000,				--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{40901,20,1},
					{40901,10,1},
					{40901,10,1},
					{40901,10,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 4288,
				oldgold	= 10000,			--购买消耗元宝
				limit = 10,				--个人限够次数
				tlimit = 99999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10348,3,1},
					{10348,3,1},
					{10348,2,1},
					{10348,2,1}
					}
			},
			[3] = 
			{
				id = 19,					--礼包ID
				need = 1688,
				oldgold	= 10000,				--购买消耗元宝
				limit = 20,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10432,1,1},
					{10432,1,1},
					{10432,1,1},
					{10432,1,1}
					}
			},
			[4] = 
			{
				id = 11,					--礼包ID
				need = 15888,
				oldgold	= 36000,				--购买消耗元宝
				limit = 2,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10166,3,1},
					{10165,2,1},
					{10165,2,1},
					{10165,2,1}
					}
			}
		}
	},
	
	[41] = {								
		StartTime = {year = 2018, month = 8, day = 29, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 8, day = 29, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 8,                                             --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10445,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10445,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10445,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10445,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

	[42] = {								
		StartTime = {year = 2018, month = 8, day = 30, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 8, day = 30, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 9,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10446,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10446,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10446,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10446,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

	[43] = {								
		StartTime = {year = 2018, month = 8, day = 31, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 8, day = 31, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 10,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10447,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10447,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10447,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10447,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

    [44] = {								
		StartTime = {year = 2018, month = 9, day = 1, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 1, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 11,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10448,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10448,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10448,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10448,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

    [45] = {								
		StartTime = {year = 2018, month = 8, day = 29, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 8, day = 29, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 8,                                             --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10445,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10445,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10445,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10445,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

	[46] = {								
		StartTime = {year = 2018, month = 8, day = 30, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 8, day = 30, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 9,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10446,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10446,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10446,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10446,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

	[47] = {								
		StartTime = {year = 2018, month = 8, day = 31, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 8, day = 31, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 10,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10447,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10447,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10447,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10447,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

    [48] = {								
		StartTime = {year = 2018, month = 9, day = 1, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 1, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 11,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10448,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10448,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10448,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10448,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},
	
	[51] = {								
		StartTime = {year = 2018, month = 9, day = 22, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 22, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 8,                                             --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10449,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10449,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10449,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10449,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

	[52] = {								
		StartTime = {year = 2018, month = 9, day = 23, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 23, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 9,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10450,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10450,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10450,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10450,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

	[53] = {								
		StartTime = {year = 2018, month = 9, day = 24, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 24, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 10,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10451,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10451,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10451,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10451,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

    [54] = {								
		StartTime = {year = 2018, month = 9, day = 25, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 25, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 11,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10452,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10452,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10452,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10452,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

    [55] = {								
		StartTime = {year = 2018, month = 9, day = 22, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 22, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 8,                                             --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10449,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10449,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10449,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10449,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

	[56] = {								
		StartTime = {year = 2018, month = 9, day = 23, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 23, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 9,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10450,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10450,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10450,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10450,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

	[57] = {								
		StartTime = {year = 2018, month = 9, day = 24, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 24, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 10,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10451,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10451,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10451,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10451,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

    [58] = {								
		StartTime = {year = 2018, month = 9, day = 25, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 25, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 11,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10452,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10452,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10452,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10452,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},
	
	[61] = {								
		StartTime = {year = 2018, month = 9, day = 29, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 29, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 8,                                             --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10453,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10453,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10453,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10453,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

	[62] = {								
		StartTime = {year = 2018, month = 9, day = 30, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 30, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 9,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10454,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10454,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10454,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10454,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

	[63] = {								
		StartTime = {year = 2018, month = 10, day = 1, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 10, day = 1, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 10,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10455,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10455,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10455,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10455,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

    [64] = {								
		StartTime = {year = 2018, month = 10, day = 2, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 10, day = 2, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = false,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 11,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10456,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10456,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10456,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10456,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

    [65] = {								
		StartTime = {year = 2018, month = 9, day = 29, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 29, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 8,                                             --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10453,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10453,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10453,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 8,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10453,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

	[66] = {								
		StartTime = {year = 2018, month = 9, day = 30, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 9, day = 30, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 9,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10454,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10454,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10454,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 12,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10454,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

	[67] = {								
		StartTime = {year = 2018, month = 10, day = 1, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 10, day = 1, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 10,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10455,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10455,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10455,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 15,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10455,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	},

    [68] = {								
		StartTime = {year = 2018, month = 10, day = 2, hour = 0, min = 0, sec = 0},                        --自然时间
		EndTime = {year = 2018, month = 10, day = 2, hour = 23, min = 59, sec = 59},                   ---自然时间
		version = 0,					--活动版本
		OpenStartDay = 1,                                              --开服时间
		OpenEndDay = 2,                                             ---开服时间
		isUnionFlag = true,                                        ---是否合服配置
		isUseOpen = false,                                        --true为使用开服时间 false为使用自然事件
		afterOpen = 11,                                              --自然时间+开服后几天(>=)一块使用                                            
	    award = 
		{
			[1] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10456,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[2] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10456,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[3] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10456,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			},
			[4] = 
			{
				id = 16,					--礼包ID
				need = 768,
				oldgold	= 1280,				--购买消耗元宝
				limit = 388,				--个人限够次数
				tlimit = 999999,	
				itemCount = 4,		--全服限够次数 大于1000时前端不显示次数
				item = {
					{10456,1,1},
					{10205,1,1},
					{10205,1,1},
					{10205,1,1}
					}
			}
		}
	}
}

--========================限时秒杀配置==============================
local g_gift_limit_buy_conf = 
{
	open = 0,
	award = 
	{
		[1] = 
		{
			id = 5,					--礼包ID
			need = 2888,				--购买消耗元宝
			limit = 1,				--个人限够次数
			item = {
				{10410,5,1},
				{10252,1,1},
				{10287,4,1},
				{10301,1,1}
				}
		},
		[2] = 
		{
			id = 6,
			need = 1888,
			limit = 1,
			item = {
				{40101,100,1},
				{10252,1,1},
				{10287,4,1},
				{10301,1,1}
				}
		},
		[3] = 
		{
			id = 7,
			need = 3888,
			limit = 1,
			item = {
				{10408,5,1},
				{10252,1,1},
				{10287,4,1},
				{10301,1,1}
				}
		},
		[4] = 
		{
			id = 8,			
			need = 2888,
			limit = 1,
			item = {
				{10413,5,1},
				{10252,1,1},
				{10287,4,1},
				{10301,1,1}
				}
		}
	}
}

function GiftBuyActivityStatus(player)
	local gift_buy_conf,start,over = GetOperActivityConfig(g_gift_buy_conf)
	if gift_buy_conf == nil then
		return 0, 0, 0, 0;
	end
	return 1,start,over,0;
end

function clearOnGiftBuyInfo(player)
	player:set_param(426,0);
	player:set_param(427,0);
	player:set_param(428,0);
	player:set_param(429,0);
	player:set_param(430,0);
end

function GiftBuy(player,type,index)
	local gift_buy_conf,start,over = GetOperActivityConfig(g_gift_buy_conf)
	if gift_buy_conf == nil then
		--player:alert(10,0,0,"活动配置不存在");
		return;
	end

	if g_get_param(81) == 0 then
		if g_chack_param(60,gift_buy_conf["version"]) == 1 then
			g_set_param(61,0);
			g_set_param(62,0);
			g_set_param(63,0);
			g_set_param(64,0);
			g_set_param(81,start);
		end
	elseif g_get_param(81) ~= start then
		g_set_param(61,0);
		g_set_param(62,0);
		g_set_param(63,0);
		g_set_param(64,0);
		g_set_param(81,start);
	end
	if player:get_param(842) == 0 then
		player:set_param(842,start);
		if player:get_param(426) ~= gift_buy_conf["version"] then
			player:set_param(426,gift_buy_conf["version"]);
			player:set_param(427,0);
			player:set_param(428,0);
			player:set_param(429,0);
			player:set_param(430,0);	
		end
	elseif player:get_param(842) ~= start then
		player:set_param(426,gift_buy_conf["version"]);
		player:set_param(427,0);
		player:set_param(428,0);
		player:set_param(429,0);
		player:set_param(430,0);
		player:set_param(842,start);
	end
	if type == 1 then
		if index < 1 or index > 4 then
			player:alert(10,0,0,"位置 "..index.." 不存在");
			return;
		end
		local itemCof = gift_buy_conf["award"][index];
		if itemCof == nil then
			player:alert(10,0,0,"位置 "..index.." 配置不存在");
			return;
		end
		local param = player:get_param(426 + index) + 1;
		if param > itemCof["limit"] then
			player:alert(10,0,0,"可购买次数不足");
			return;
		end
		local needback  = 0
		if itemCof.itemCount then
			needback = itemCof.itemCount			
		end
		if player:num_bag_black() < needback then
			player:alert(10,0,0,"背包空间不足，请及时清理");
			return;
		end
		needback = #itemCof["item"];
		local now_money = player:get_vcoin();
		if now_money < itemCof["need"] then
			player:alert(10,0,0,"元宝不足");
			return;			
		end
		if g_add_param(60 + index,itemCof["tlimit"]) == 0  then
			player:alert(10,0,0,"礼包已被抢完了");
		else
			player:set_param(426 + index,param);
			player:sub_vcoin(itemCof["need"]);
			for i=1,needback do
				player:add_item(itemCof["item"][i][1],itemCof["item"][i][2],itemCof["item"][i][3],0,0,0);
			end
		end
	end
	local obj = {start=start,over=over};
	local item = {};
	local target = {};
	local gift = {};
	local award = gift_buy_conf["award"];
	for i=0,3 do
		target = {};
		target.gift = {};
		target.index = i + 1;
		target.id = award[i + 1]["id"];
		target.hasnum = player:get_param(427 + i);
		target.totalnum = award[i + 1]["limit"];
		target.allhasnum = award[i + 1]["tlimit"] - g_get_param(61 + i);
		target.gold = award[i + 1]["need"];
		target.oldgold = 0;
		if award[i + 1]["oldgold"] ~= nil then
			target.oldgold = award[i + 1]["oldgold"];
		end
		for j=1,#award[i + 1]["item"] do
			gift = {};
			gift.itemid = award[i + 1]["item"][j][1];
			gift.num = award[i + 1]["item"][j][2];
			gift.bind = award[i + 1]["item"][j][3];
			table.insert(target.gift,gift);
		end

		table.insert(item,target);
	end
	obj.items = item;
	player:SendPacketToSelf(4452,0,encode(obj));
end

function GiftLimitBuy(player,type,index)
	local start = player:getCreatureTime();
	local over = start + g_gift_limit_buy_conf["open"]*86400;
	local openDate = os.date("*t", over)
	openDate.hour = 0
	openDate.min = 0
	openDate.sec = 0
	over = os.time(openDate)
	local cur = os.time()
	if cur < start or cur > over then
		return
	end

	if type == 1 then
		if index < 1 or index > 4 then
			player:alert(10,0,0,"礼包 "..index.." 不存在");
			return;
		end
		local itemCof = g_gift_limit_buy_conf["award"][index];
		if itemCof == nil then
			player:alert(10,0,0,"礼包 "..index.." 配置不存在");
			return;
		end
		local param = player:get_param(432 + index - 1) + 1;
		if param > itemCof["limit"] then
			player:alert(10,0,0,"可购买次数不足");
			return;
		end
		local needback = #itemCof["item"];
		if player:num_bag_black() < needback then
			player:alert(10,0,0,"背包空间不足，请及时清理");
			return;
		end
		local now_money = player:get_vcoin();
		if now_money < itemCof["need"] then
			player:alert(10,0,0,"元宝不足");
			return;			
		end

		player:set_param(432 + index - 1,param);
		player:sub_vcoin(itemCof["need"]);
		for i=1,needback do
			player:add_item(itemCof["item"][i][1],itemCof["item"][i][2],itemCof["item"][i][3],0,0,0);
		end		
	end
	local obj = {start=start,over=over};
	local item = {};
	local target = {};
	local gift = {};
	local award = g_gift_limit_buy_conf["award"];
	for i=0,3 do
		target = {};
		target.gift = {};
		target.index = i + 1;
		target.id = award[i + 1]["id"];
		target.hasnum = player:get_param(432 + i);
		target.totalnum = award[i + 1]["limit"];
		target.gold = award[i + 1]["need"];
		target.oldgold = 0;
		if award[i + 1]["oldgold"] ~= nil then
			target.oldgold = award[i + 1]["oldgold"];
		end
		for j=1,#award[i + 1]["item"] do
			gift = {};
			gift.itemid = award[i + 1]["item"][j][1];
			gift.num = award[i + 1]["item"][j][2];
			gift.bind = award[i + 1]["item"][j][3];
			table.insert(target.gift,gift);
		end
		table.insert(item,target);
	end
	obj.items = item;
	player:SendPacketToSelf(4453,0,encode(obj));
end
