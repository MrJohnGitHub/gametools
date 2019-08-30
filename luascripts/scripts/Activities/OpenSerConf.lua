--[[

	配置说明
	config里面的level是表示对应活动可以领取奖励的限制，举例子：神翼竞技里面就表示翅膀达到X阶
	award里面的itemId:是物品就填物品ID， 金币填1，绑金填2  元宝填100 绑元填101

--]]

OpenSerActSetting = {
	['keepPay'] = {
		startDay = 1,
		endDay = 7,
		vesion = 1, --充值活动这个还需要配置一个版本号，如果用作自然日改动的话，这个版本号就递增
		natural_time = {
			startTime = {year = 2015, month = 1, day = 1, hour = 0, min = 0, sec = 0},
			endTime = {year = 2016, month = 1, day = 1, hour = 0, min = 0, sec = 0},	
			vaild = false, --自然时间是否生效， 不生效填false， 生效填true
		},

		dangci_config = {
			[1] = 1,

		}, --这里是档次配置， 比如1000是一个档次， 8800是一个档次 等等
		config = {
			[1] = {
				dangci = 1,
				payMoney = 1,  --表示充值多少，由策划配置
				keepDay = 1,	--表示连续几天
				itemCount = 1, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 40101, count = 48},
				},	
			},

			[2] = {
				dangci = 1,
				payMoney = 1,
				keepDay = 2,
				itemCount = 2, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 40902, count = 48},
					[2] = {itemId = 10186, count = 40},
				},

			},

			[3] = {
				dangci = 1,
				payMoney = 1,
				keepDay = 3,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 12022, count = 2},
					[2] = {itemId = 10186, count = 80},
					[3] = {itemId = 40901, count = 3},
				},
			},

			[4] = {
				dangci = 1,
				payMoney = 1,
				keepDay = 4,
				itemCount = 5, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10410, count = 2},
					[2] = {itemId = 10186, count = 120},
					[3] = {itemId = 40901, count = 6},
					[4] = {itemId = 10301, count = 2},
				}
			},

			[5] = {
				dangci = 1,
				payMoney = 1,
				keepDay = 5,
				itemCount = 7, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10408, count = 2},
					[2] = {itemId = 10186, count = 200},
					[3] = {itemId = 40901, count = 10},
					[4] = {itemId = 10301, count = 4},
				}
			},
		}
	},--连续充值
	['shenyu'] = {
		startDay = 1,  --开服第3天到开服第8天
		endDay = 1,
		config = {
			[1] = {
				level = 2,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 40101, count = 10},
					[2] = {itemId = 10205, count = 50},
					[3] = {itemId = 10287, count = 1},
				},
			},
			[2] = {
				level = 3,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 40101, count = 20},
					[2] = {itemId = 10205, count = 100},
					[3] = {itemId = 10287, count = 2},
				},
			},

			[3] = {
				level = 4,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 40101, count = 40},
					[2] = {itemId = 10205, count = 500},
					[3] = {itemId = 10287, count = 4},
				},
			},
			[4] = {
				level = 5,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10297, count = 1},
					[2] = {itemId = 10205, count = 1000},
					[3] = {itemId = 10287, count = 8},
				},
			},
			[5] = {
				level = 6,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10298, count = 1},
					[2] = {itemId = 10205, count = 2000},
					[3] = {itemId = 10287, count = 12},
				},
			},
			[6] = {
				level = 7,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 40101, count = 400},
					[2] = {itemId = 10205, count = 4000},
					[3] = {itemId = 10287, count = 16},
				},
			},			
		}, 
	}, --神玉竞技

	['mount'] = {
		startDay = 2,  --开服第3天到开服第8天
		endDay = 2,
		vesion = 1, --充值活动这个还需要配置一个版本号，如果用作自然日改动的话，这个版本号就递增
		natural_time = {
			startTime = {year = 2015, month = 1, day = 1, hour = 0, min = 0, sec = 0},
			endTime = {year = 2016, month = 1, day = 1, hour = 0, min = 0, sec = 0},	
			vaild = false, --自然时间是否生效， 不生效填false， 生效填true
		},
		config = {
			[1] = {
				level = 1,
				star = 3,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 40902, count = 8},
					[2] = {itemId = 10205, count = 100},
					[3] = {itemId = 10287, count = 1},
				},
			},
			[2] = {
				level = 2,
				star = 1,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 40902, count = 18},
					[2] = {itemId = 10205, count = 200},
					[3] = {itemId = 10287, count = 2},
				},
			},

			[3] = {
				level = 2,
				star = 4,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 40902, count = 28},
					[2] = {itemId = 10205, count = 400},
					[3] = {itemId = 10287, count = 4},
				},
			},
			[4] = {
				level = 3,
				star = 0,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 40902, count = 38},
					[2] = {itemId = 10205, count = 800},
					[3] = {itemId = 27305, count = 1},
				},
			},
			[5] = {
				level = 4,
				star = 0,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10297, count = 1},
					[2] = {itemId = 40903, count = 1},
					[3] = {itemId = 10287, count = 12},
				},
			},
			[6] = {
				level = 4,
				star = 3,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10298, count = 1},
					[2] = {itemId = 40904, count = 1},
					[3] = {itemId = 10287, count = 18},
				},
			},		
			[7] = {
				level = 5,
				star = 0,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 40902, count = 188},
					[2] = {itemId = 40905, count = 1},
					[3] = {itemId = 10287, count = 25},
				},
			},				
		}, 
	}, --坐骑竞技

	['baoshi'] = {
		startDay = 4, 
		endDay = 4,
		config = {
			[1] = {
				level = 3,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10409, count = 2},
					[2] = {itemId = 10205, count = 20},
					[3] = {itemId = 10287, count = 1},
				},
			},
			[2] = {
				level = 5,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10410, count = 1},
					[2] = {itemId = 10205, count = 50},
					[3] = {itemId = 10287, count = 2},
				},
			},
			[3] = {
				level = 6,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10297, count = 1},
					[2] = {itemId = 10205, count = 100},
					[3] = {itemId = 10287, count = 4},
				},
			},
			[4] = {
				level = 8,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10298, count = 1},
					[2] = {itemId = 10205, count = 200},
					[3] = {itemId = 10287, count = 8},
				},
			},	
			[5] = {
				level = 10,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10155, count = 1},
					[2] = {itemId = 10205, count = 400},
					[3] = {itemId = 10287, count = 12},
				},
			},	
			[6] = {
				level = 12,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10155, count = 3},
					[2] = {itemId = 10205, count = 1000},
					[3] = {itemId = 10287, count = 16},
				},
			},				
		},
	}, --宝石竞技
	['hunzhu'] = {
		startDay = 5, 
		endDay = 5,
		config = {
			[1] = {
				level = 1,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10407, count = 5},
					[2] = {itemId = 10205, count = 20},
					[3] = {itemId = 10285, count = 2},
				},
			},
			[2] = {
				level = 2,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10408, count = 2},
					[2] = {itemId = 10205, count = 200},
					[3] = {itemId = 10287, count = 1},
				},
			},
			[3] = {
				level = 3,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10408, count = 4},
					[2] = {itemId = 10205, count = 400},
					[3] = {itemId = 10287, count = 2},
				},
			},
			[4] = {
				level = 4,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10298, count = 1},
					[2] = {itemId = 10205, count = 800},
					[3] = {itemId = 10287, count = 4},
				},
			},
			[5] = {
				level = 5,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10299, count = 1},
					[2] = {itemId = 10205, count = 1600},
					[3] = {itemId = 10287, count = 8},
				},
			},		
			[6] = {
				level = 6,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10242, count = 2},
					[2] = {itemId = 10205, count = 2400},
					[3] = {itemId = 10287, count = 12},
				},
			},			
		},
	}, --魂珠竞技
	['xueyu'] = {
		startDay = 1, 
		endDay = 7,
		config = {
			[1] = {
				level = 2,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10147, count = 15},
					[2] = {itemId = 12014, count = 1},
					[3] = {itemId = 10285, count = 2},
				},
			},
			[2] = {
				level = 3,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10148, count = 20},
					[2] = {itemId = 12014, count = 2},
					[3] = {itemId = 10285, count = 4},
				},
			},
			[3] = {
				level = 4,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10148, count = 25},
					[2] = {itemId = 12014, count = 3},
					[3] = {itemId = 10285, count = 6},
				},
			},
			[4] = {
				level = 5,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10148, count = 30},
					[2] = {itemId = 12014, count = 4},
					[3] = {itemId = 10285, count = 8},
				},
			},		
			[5] = {
				level = 6,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10148, count = 40},
					[2] = {itemId = 12014, count = 5},
					[3] = {itemId = 10285, count = 10},
				},
			},		
			[6] = {
				level = 7,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10186, count = 50},
					[2] = {itemId = 12014, count = 6},
					[3] = {itemId = 10285, count = 20},
				},
			},				
		},
	}, --血玉竞技
	['xiulian'] = {
		startDay = 3, 
		endDay = 3,
		config = {
			[1] = {
				level = 3,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 12021, count = 2},
					[2] = {itemId = 10205, count = 100},
					[3] = {itemId = 10286, count = 1},
				},
			},
			[2] = {
				level = 7,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 12021, count = 5},
					[2] = {itemId = 10205, count = 200},
					[3] = {itemId = 10286, count = 2},
				},
			},
			[3] = {
				level = 12,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 12022, count = 1},
					[2] = {itemId = 10205, count = 400},
					[3] = {itemId = 10286, count = 4},
				},
			},
			[4] = {
				level = 16,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10297, count = 1},
					[2] = {itemId = 10205, count = 600},
					[3] = {itemId = 10286, count = 8},
				},
			},		
			[5] = {
				level = 19,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10298, count = 1},
					[2] = {itemId = 10205, count = 800},
					[3] = {itemId = 10287, count = 5},
				},
			},
			[6] = {
				level = 22,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 12023, count = 1},
					[2] = {itemId = 10205, count = 1200},
					[3] = {itemId = 10287, count = 10},
				},
			},			
		},
	}, --修炼竞技

	['BossScore'] = {
		startDay = 6, 
		endDay = 6,
		config = {
			[1] = {
				level = 103,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 31304, count = 10},
					[2] = {itemId = 10205, count = 200},
					[3] = {itemId = 10285, count = 2},
				},
			},
			[2] = {
				level = 106,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 31304, count = 60},
					[2] = {itemId = 10205, count = 400},
					[3] = {itemId = 10285, count = 4},
				},
			},
			[3] = {
				level = 109,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10413, count = 2},
					[2] = {itemId = 10205, count = 800},
					[3] = {itemId = 10286, count = 5},
				},
			},
			[4] = {
				level = 202,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10298, count = 1},
					[2] = {itemId = 10205, count = 1000},
					[3] = {itemId = 10286, count = 10},
				},
			},		
			[5] = {
				level = 205,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 10299, count = 1},
					[2] = {itemId = 10205, count = 2000},
					[3] = {itemId = 10287, count = 10},
				},
			},
			[6] = {
				level = 208,
				itemCount = 3, --这个配置是指配置的奖励里面有多少个物品，没有就填0
				award = {
					[1] = {itemId = 31302, count = 1},
					[2] = {itemId = 10205, count = 4000},
					[3] = {itemId = 10287, count = 20},
				},
			},			
		},
	}, --BOSS积分

	['CumulativePay'] = {
		startDay = 1, 
		endDay = 7,
		vesion = 1, --充值活动这个还需要配置一个版本号，如果用作自然日改动的话，这个版本号就递增
		natural_time = {
			startTime = {year = 2016, month = 11, day = 4, hour = 0, min = 0, sec = 0},
			endTime = {year = 2016, month = 11, day = 10, hour = 23, min = 59, sec = 59},	
			vaild = false, --自然时间是否生效， 不生效填false， 生效填true
		},
		config = {
			[1] = {
				payCount = 5000, --累计充值达到金额才可以领取
				itemCount = 1,
				award = {
					[1] = {itemId = 10165, count = 1},
				},
			},

			[2] = {
				payCount = 10000,
				itemCount = 2,
				award = {
					[1] = {itemId = 12022, count = 1},
					[2] = {itemId = 10268, count = 2},
				},
			},

			[3] = {
				payCount = 20000,
				itemCount = 3,
				award = {
					[1] = {itemId = 40710, count = 1},
					[2] = {itemId = 10268, count = 4},
					[3] = {itemId = 10287, count = 5},
				},
			},

			[4] = {
				payCount = 40000,
				itemCount = 3,
				award = {
					[1] = {itemId = 10296, count = 1},
					[2] = {itemId = 10268, count = 6},
					[3] = {itemId = 10287, count = 10},
				},
			},
			
			[5] = {
				payCount = 80000,
				itemCount = 4,
				award = {
					[1] = {itemId = 10297, count = 1},
					[2] = {itemId = 10268, count = 8},
					[3] = {itemId = 10287, count = 15},
					[4] = {itemId = 12014, count = 50},
				},
			},
			
			[6] = {
				payCount = 200000,
				itemCount = 5,
				award = {
					[1] = {itemId = 10298, count = 1},
					[2] = {itemId = 10268, count = 12},
					[3] = {itemId = 10287, count = 20},
					[4] = {itemId = 12014, count = 100},
				},
			},
			
			[7] = {
				payCount = 500000,
				itemCount = 6,
				award = {
					[1] = {itemId = 40709, count = 1},
					[2] = {itemId = 10268, count = 20},
					[3] = {itemId = 10287, count = 40},
					[4] = {itemId = 12014, count = 200},
				},
			},
		}
	}, --累充

	["PayRank"] = {
		startDay = 1,
		endDay = 2,
	}, --充值排行榜
	
	['QianghuaDabiao'] = {
		startDay = 1, 
		endDay = 2,
		vesion = 1, 
		natural_time = {
			startTime = {year = 2016, month = 11, day = 4, hour = 0, min = 0, sec = 0},
			endTime = {year = 2016, month = 11, day = 10, hour = 23, min = 59, sec = 59},	
			vaild = false, --自然时间是否生效， 不生效填false， 生效填true
		},
		config = {
			[1] = {
				level = 3,
				itemCount = 1,
				award = {
					[1] = {itemId = 10159, count = 2},
				},
			},

			[2] = {
				level = 5,
				itemCount = 2,
				award = {
					[1] = {itemId = 10159, count = 5},
					[2] = {itemId = 10205, count = 800},
				},
			},
			
			[3] = {
				level = 7,
				itemCount = 4,
				award = {
					[1] = {itemId = 10160, count = 5},
					[2] = {itemId = 10205, count = 2400},
					[3] = {itemId = 10186, count = 128},
				},
			},
			
			[4] = {
				level = 9,
				itemCount = 5,
				award = {
					[1] = {itemId = 10160, count = 10},
					[2] = {itemId = 10205, count = 4800},
					[3] = {itemId = 10186, count = 188},
					[4] = {itemId = 40101, count = 188},
				},
			},
			
			[5] = {
				level = 10,
				itemCount = 7,
				award = {
					[1] = {itemId = 10161, count = 10},
					[2] = {itemId = 10205, count = 7200},
					[3] = {itemId = 10186, count = 388},
					[4] = {itemId = 40902, count = 128},
				},
			}
		}
	}, --强化达标
	
} --开服活动配置

ActOpenSetting = {
	[1] = true,
	[2] = true,
	[3] = true,
	[4] = true,
	[5] = false,
	[6] = true,
	[7] = true,
	[8] = true,
	[9] = true,
	[10] = true,
	[11] = true,
	[12] = true,
	[13] = true,
}


--------------------
--开服活动排行榜奖励
--------------------

ActRankAwardConf = {
	['shenyu'] = {
		rankCount = 3, --配置排行榜显示多少个
		minLevel = 1,
		awardConfig = {
			[1] = { itemId = 10166, count = 4 }, --第一名奖励
			[2] = { itemId = 10166, count = 2 },
			[3] = { itemId = 10166, count = 1 },
		}
	}, --神翼排行榜的奖励

	['mount'] = {
		rankCount = 3, --配置排行榜显示多少个
		minLevel = 1,
		awardConfig = {
			[1] = { itemId = 33610, count = 1 }, --第一名奖励
			[2] = { itemId = 33508, count = 1 },
			[3] = { itemId = 33406, count = 1 },
		}
	}, --坐骑排行榜的奖励

	['baoshi'] = {
		rankCount = 3, --配置排行榜显示多少个
		minLevel = 8,
		awardConfig = {
			[1] = { itemId = 10322, count = 4 }, --第一名奖励
			[2] = { itemId = 10322, count = 2 },
			[3] = { itemId = 10322, count = 1 },
		},
	}, --宝石排行榜的奖励

	['hunzhu'] = {
		rankCount = 3, --配置排行榜显示多少个
		minLevel = 4,
		awardConfig = {
			[1] = { itemId = 10299, count = 1 }, --第一名奖励
			[2] = { itemId = 10298, count = 1 },
			[3] = { itemId = 10297, count = 1 },
		},
	}, --魂珠排行榜的奖励

	['xiulian'] = {
		rankCount = 3, --配置排行榜显示多少个
		minLevel = 12,
		awardConfig = {
			[1] = { itemId = 40807, count = 1 }, --第一名奖励
			[2] = { itemId = 40806, count = 1 },
			[3] = { itemId = 40805, count = 1 },
		},
	}, --修炼排行榜的奖励

	['BossScore'] = {
		rankCount = 3,  --配置排行榜显示多少个
		minLevel = 112, --最小上榜等级 = 当前阶*100 + 当前等级
		awardConfig = {
			[1] = { itemId = 10317, count = 2 }, --第一名奖励
			[2] = { itemId = 10317, count = 1 },
			[3] = { itemId = 10298, count = 1 },
		},
	}, --修炼排行榜的奖励



	['PayRank'] = {

		rankCount = 3, --显示多少个玩家
		awardConfig = {
			[1] = 
			{
				minPay = 250000,
				award = 
				{
					[1] = {itemId = 10299, count = 1},
				},
			},

			[2] = 
			{

				minPay = 180000,
				award = 
				{
					[1] = {itemId = 10298, count = 1},
				},
			},

			[3] = 
			{
				minPay = 150000,
				award = 
				{
					[1] = {itemId = 10297, count = 1},
				},
			},
			
			[4] = 
			{
				minPay = 100000,
				award = 
				{
					[1] = {itemId = 10242, count = 1},
				},
			},
			
			[5] = 
			{
				minPay = 100000,
				award = 
				{
					[1] = {itemId = 10242, count = 1},
				},
			},
			
			[6] = 
			{
				minPay = 1,
				award = 
				{
					[1] = {itemId = 40301, count = 10},
				},
			},
			
			[7] = 
			{
				minPay = 1,
				award = 
				{
					[1] = {itemId = 40301, count = 10},
				},
			},
			
			[8] = 
			{
				minPay = 1,
				award = 
				{
					[1] = {itemId = 40301, count = 10},
				},
			},
			
			[9] = 
			{
				minPay = 1,
				award = 
				{
					[1] = {itemId = 40301, count = 10},
				},
			},
			
			[10] = 
			{
				minPay = 1,
				award = 
				{
					[1] = {itemId = 40301, count = 10},
				},
			},
			
		}

	}, --累充

}


ActIdToActName = {
 	[1] = 'keepPay',
 	[2] = 'shenyu',
 	[3] = 'baoshi',
 	[4] = 'hunzhu',
 	[5] = 'xueyu',
 	[6] = 'xiulian',
 	[9] = "CumulativePay", --累计充值
 	[10] = "PayRank", --充值排行
 	[11] = "BossScore",
 	[12] = 'mount',
 	[13] = 'QianghuaDabiao',

}

ActNameToActId = {
	['keepPay'] = 1,
	['shenyu'] = 2,
	['baoshi'] = 3,
	['hunzhu'] = 4,
	['xueyu'] = 5,
	['xiulian'] = 6,
	['CumulativePay'] = 9,
	['PayRank'] = 10,
	['BossScore'] = 11,
	['mount'] = 12,
	['QianghuaDabiao'] = 13,
}


error_msg = {
	['shenyu'] = '翅膀等级不足，不能领取奖励',
	['baoshi'] = '宝石等级不足，不能领取奖励',
	['hunzhu'] = '魂珠等级不足，不能领取奖励',
	['xueyu'] = '血玉等级不足，不能领取奖励',
	['xiulian'] = '修炼等级不足不能领取奖励',
	['rePeat'] = "该奖励已经领取过",
	['notAward'] = '没有可以领取的奖励',
	['timeOver'] = '不在活动期间内',
	['keepPay'] = '充值累计天数不足，不能领取奖励',
	['payNotEnough'] = "充值累计金额不足,不能领取奖励",
	['awardIndexNotExist'] = "奖励不存在",
	['actNotExist'] = "活动不存在",
	['BossScore'] = "Boss积分等级不足,不能领取奖励",
	['mount'] = '坐骑等级不足,不能领取奖励',
	['QianghuaDabiao'] = '强化等级不足,不能领取奖励',
}

AddItemOptType = {
	['shenyu'] 		= 233,
	['baoshi'] 		= 234,
	['hunzhu'] 		= 235,
	['xueyu'] 		= 236,
	['xiulian'] 	= 237,
	['keepPay'] 	= 238,
	["BossScore"]   = 247,
	["CumulativePay"] = 248,
	["QianghuaDabiao"] = 269,
}

AddMoneyOptType = {
	['shenyu'] 		= 233,
	['baoshi'] 		= 234,
	['hunzhu'] 		= 235,
	['xueyu'] 		= 236,
	['xiulian'] 	= 237,
	['keepPay'] 	= 238,
	["BossScore"]   = 247,
	["CumulativePay"] = 248,
	["QianghuaDabiao"] = 269,
}




ActMailConten = {
	['baoshi'] = {
		['subject'] = {
			[1] = '宝石排行奖励',
			[2] = '宝石排行奖励',
			[3] = '宝石排行奖励',

		},
		['body'] = {
			[1] = "祝贺您获得了开服活动宝石排行榜第<font color='#FFFF000'>1</font>名，现给予您如下奖励，请查收",
			[2] = "祝贺您获得了开服活动宝石排行榜第<font color='#FFFF000'>2</font>名，现给予您如下奖励，请查收",
			[3] = "祝贺您获得了开服活动宝石排行榜第<font color='#FFFF000'>3</font>名，现给予您如下奖励，请查收",
		},
	},

	['hunzhu'] = {
		['subject'] = {
			[1] = '魂珠排行奖励',
			[2] = '魂珠排行奖励',
			[3] = '魂珠排行奖励',
		},
		['body'] = {
			[1] = "祝贺您获得了开服活动魂珠排行榜第<font color='#FFFF000'>1</font>名，现给予您如下奖励，请查收",
			[2] = "祝贺您获得了开服活动魂珠排行榜第<font color='#FFFF000'>2</font>名，现给予您如下奖励，请查收",
			[3] = "祝贺您获得了开服活动魂珠排行榜第<font color='#FFFF000'>3</font>名，现给予您如下奖励，请查收",
		},
	},

	['xiulian'] = {
		['subject'] = {
			[1] = '修炼排行奖励',
			[2] = '修炼排行奖励',
			[3] = '修炼排行奖励',
		},
		['body'] = {
			[1] = "祝贺您获得了开服活动修炼排行榜第<font color='#FFFF000'>1</font>名，现给予您如下奖励，请查收",
			[2] = "祝贺您获得了开服活动修炼排行榜第<font color='#FFFF000'>2</font>名，现给予您如下奖励，请查收",
			[3] = "祝贺您获得了开服活动修炼排行榜第<font color='#FFFF000'>3</font>名，现给予您如下奖励，请查收",
		},
	},

	['shenyu'] = {
		['subject'] = {
			[1] = '神翼排行奖励',
			[2] = '神翼排行奖励',
			[3] = '神翼排行奖励',
		},
		['body'] = {
			[1] = "祝贺您获得了开服活动神翼排行榜第<font color='#FFFF000'>1</font>名，现给予您如下奖励，请查收",
			[2] = "祝贺您获得了开服活动神翼排行榜第<font color='#FFFF000'>2</font>名，现给予您如下奖励，请查收",
			[3] = "祝贺您获得了开服活动神翼排行榜第<font color='#FFFF000'>3</font>名，现给予您如下奖励，请查收",
		},
	},


	['BossScore'] = {
		['subject'] = {
			[1] = 'BOSS积分排行奖励',
			[2] = 'BOSS积分排行奖励',
			[3] = 'BOSS积分排行奖励',
		},
		['body'] = {
			[1] = "祝贺您获得了开服活动BOSS积分排行榜第<font color='#FFFF000'>1</font>名，现给予您如下奖励，请查收",
			[2] = "祝贺您获得了开服活动BOSS积分排行榜第<font color='#FFFF000'>2</font>名，现给予您如下奖励，请查收",
			[3] = "祝贺您获得了开服活动BOSS积分排行榜第<font color='#FFFF000'>3</font>名，现给予您如下奖励，请查收",
		},
	},

	['PayRank'] = {
		['subject'] = {
			[1] = '充值排行榜奖励',
			[2] = '充值排行榜奖励',
			[3] = '充值排行榜奖励',
			[4] = '充值排行榜奖励',
			[5] = '充值排行榜奖励',
			[6] = '充值排行榜奖励',
			[7] = '充值排行榜奖励',
			[8] = '充值排行榜奖励',
			[9] = '充值排行榜奖励',
			[10] = '充值排行榜奖励',
		},

		['body'] = {
			[1] = "祝贺您获得了开服活动充值排行榜第<font color='#FFFF000'>1</font>名，现给予您如下奖励，请查收",
			[2] = "祝贺您获得了开服活动充值排行榜第<font color='#FFFF000'>2</font>名，现给予您如下奖励，请查收",
			[3] = "祝贺您获得了开服活动充值排行榜第<font color='#FFFF000'>3</font>名，现给予您如下奖励，请查收",
			[4] = "祝贺您获得了开服活动充值排行榜第<font color='#FFFF000'>4</font>名，现给予您如下奖励，请查收",
			[5] = "祝贺您获得了开服活动充值排行榜第<font color='#FFFF000'>5</font>名，现给予您如下奖励，请查收",
			[6] = "祝贺您获得了开服活动充值排行榜第<font color='#FFFF000'>6</font>名，现给予您如下奖励，请查收",
			[7] = "祝贺您获得了开服活动充值排行榜第<font color='#FFFF000'>7</font>名，现给予您如下奖励，请查收",
			[8] = "祝贺您获得了开服活动充值排行榜第<font color='#FFFF000'>8</font>名，现给予您如下奖励，请查收",
			[9] = "祝贺您获得了开服活动充值排行榜第<font color='#FFFF000'>9</font>名，现给予您如下奖励，请查收",
			[10] = "祝贺您获得了开服活动充值排行榜第<font color='#FFFF000'>10</font>名，现给予您如下奖励，请查收",
		},

	}, --充值排行榜奖励

	['mount'] = {
		['subject'] = {
			[1] = '坐骑排行奖励',
			[2] = '坐骑排行奖励',
			[3] = '坐骑排行奖励',
		},
		['body'] = {
			[1] = "祝贺您获得了开服活动坐骑排行榜第<font color='#FFFF000'>1</font>名，现给予您如下奖励，请查收",
			[2] = "祝贺您获得了开服活动坐骑排行榜第<font color='#FFFF000'>2</font>名，现给予您如下奖励，请查收",
			[3] = "祝贺您获得了开服活动坐骑排行榜第<font color='#FFFF000'>3</font>名，现给予您如下奖励，请查收",
		},
	},

}

redPacketConf = {
	[7] = {
		money = 500,
	}, 
	[8] = {
		money = 100,
	}
}



