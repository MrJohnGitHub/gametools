--活动BOSS条件刷新规则配置

yuanbaoBoss = 
{
	frist_monster = {id = 2293, name = "boss1", facad = 9009, x = 152, y = 173, radius = 4, number = 1, bosstype = 4}, --活动首次刷出的boss
	monsterList = 
	{
		[2293] = {id = 2293, name = "boss1", facad = 9009, x = 152, y = 173, radius = 4, number = 1, bosstype = 4, next_monster = 2316},
		[2316] = {id = 2316, name = "boss2", facad = 9038, x = 152, y = 173, radius = 4, number = 1, bosstype = 4, next_monster = 2148},
		[2148] = {id = 2148, name = "boss3", facad = 9032, x = 152, y = 173, radius = 4, number = 1, bosstype = 4, next_monster = 2149},
		[2149] = {id = 2149, name = "boss4", facad = 9040, x = 152, y = 173, radius = 4, number = 1, bosstype = 4, next_monster = 2150},
		[2150] = {id = 2150, name = "boss5", facad = 9031, x = 152, y = 173, radius = 4, number = 1, bosstype = 4, next_monster = 2150},
	},

	rule = 
	{
		[2293] = {range = 0}, --单位是分钟
		[2316] = {range = 2},
		[2418] = {range = 3},
		[2419] = {range = 5},
	},

	refresh_t = {hour = 11, min = 0, sec = 0}, --刷新的时间点

} --元宝BOSS的刷新配置










