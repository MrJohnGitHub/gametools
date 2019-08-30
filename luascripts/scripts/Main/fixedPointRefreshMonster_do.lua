--固定点刷怪的配置

g_fixedPointRefreshMonster = 
{

	[7] = --地图ID 
	{
		boss_list = 
		{
			--怪物ID, 外观， 名字， 坐标x, y坐标， 刷怪半径， 权重， 是否广播, 广播内容
			[1] = 
			{
				id = 2146, 							--怪物ID
				facad = 9042, 						--外观
				name = "boss1", 					--名字
				x = 143, 							--x坐标
				y = 192,  							--y坐标
				radius = 4, 						--刷怪半径
				weight = 1, 						--权重
				boss_type = 4,						--boss类型
				isBrocast = 0, 						--是否广播 0不广播 1广播
				brocastStr = "" 					--广播的内容

			},

			[2] = 
			{
				id = 2147, 
				facad = 9038, 
				name = "boss2", 
				x = 143, 
				y = 192, 
				radius = 4, 
				weight = 2, 
				boss_type = 4,						--boss类型
				isBrocast = 0, 
				brocastStr = ""
			},

			[3] = 
			{
				id = 2148, 
				facad = 9032, 
				name = "boss3", 
				x = 143, 
				y = 192, 
				radius = 4, 
				weight = 3, 
				boss_type = 4,						--boss类型
				isBrocast = 0, 
				brocastStr = ""
			},

			[4] = 
			{
				id = 2149, 
				facad = 9040, 
				name = "boss4", 
				x = 143, 
				y = 192, 
				radius = 4, 
				boss_type = 4,						--boss类型
				weight = 10, 
				isBrocast = 1, 
				brocastStr = "<font color='#ff0000'>神级BOSS</font>出现在<font color='#00ccff'>天星城（假）</font><font color='#0be140'>[</font><a href= 'event:M2411,7,143,192'><u><font color='#0be140'>传</font></u></a><font color='#0be140'>]</font>"
			},
		},

		re_random_t = 
		{
			[2146] = {min_t = 1}, --死亡后多久重新刷新怪，单位是分钟
			[2147] = {min_t = 2},
			[2148] = {min_t = 3},
			[2149] = {min_t = 5},
		},

		begin_random_t = {hour = 0, min = 1, sec = 0},  --开始随机的时间

	},
	--配完一个地图的配置的时候最后是用=====隔开起来，不然以后配置多了就容易混乱
	--=========================================================================================================

}



