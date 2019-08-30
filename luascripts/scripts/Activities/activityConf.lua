
--后续活动的配置就放在这里了
--统一的时间配置格式
--支持自然时间配置和开服天数配置

g_consume_ret_award_conf = 
{
	
	start_time = {year = 2016, month = 11, day = 7, hour = 0, min = 0, sec = 0},
	end_time = {year = 2016, month = 12, day = 28, hour = 0, min = 0, sec = 0},
	open_ser_tm = {
		start_day = 8,
		end_day = 10,
	},
	use_open = false,
	version = 1,
	awrad_conf = 
	{

		[1] = 
		{
			min_key = 1800,  --最少消费
			itemCount = 1,
			list = 
			{
				[1] = {itemid = 10313, count = 200, bind = 1}
			}
		},
		[2] = 
		{
			min_key = 5800,  --最少消费
			itemCount = 1,
			list = 
			{
				[1] = {itemid = 10313, count = 500, bind = 1}
			}
		},
		[3] = 
		{
			min_key = 18800,  --最少消费
			itemCount = 1,
			list = 
			{
				[1] = {itemid = 10313, count = 1000, bind = 1}
			}
		},
		[4] = 
		{
			min_key = 38800,  --最少消费
			itemCount = 1,
			list = 
			{
				[1] = {itemid = 10313, count = 2000, bind = 1}
			}
		},
		[5] = 
		{
			min_key = 58800,  --最少消费
			itemCount = 1,
			list = 
			{
				[1] = {itemid = 10313, count = 4000, bind = 1}
			}
		},
		[6] = 
		{
			min_key = 88800,  --最少消费
			itemCount = 1,
			list = 
			{
				[1] = {itemid = 10313, count = 6000, bind = 1}
			}
		},
		[7] = 
		{
			min_key = 168800,  --最少消费
			itemCount = 1,
			list = 
			{
				[1] = {itemid = 10313, count = 10000, bind = 1}
			}
		},
		[8] = 
		{
			min_key = 268800,  --最少消费
			itemCount = 1,
			list = 
			{
				[1] = {itemid = 10313, count = 20000, bind = 1}
			}
		},

	}

} --消费有礼


g_treasure_ret_award_conf = 
{
	start_time = {year = 2016, month = 11, day = 7, hour = 0, min = 0, sec = 0},
	end_time = {year = 2016, month = 12, day = 28, hour = 0, min = 0, sec = 0},
	open_ser_tm = {
		start_day = 8,
		end_day = 10,
	},
	use_open = false,
	version = 1,
	awrad_conf = 
	{

		[1] = 
		{
			min_key = 1,  --寻宝次数
			itemCount = 1,
			list = 
			{
				[1] = {itemid = 10268, count = 1, bind = 1}
			}
		},
		[2] = 
		{
			min_key = 10,  
			itemCount = 1,
			list = 
			{
				[1] = {itemid = 10268, count = 2, bind = 1}
			}
		},
		[3] = 
		{
			min_key = 30,  
			itemCount = 2,
			list = 
			{
				[1] = {itemid = 10268, count = 5, bind = 1},
				[2] = {itemid = 12014, count = 2, bind = 1}
			}
		},
		[4] = 
		{
			min_key = 100,  
			itemCount = 3,
			list = 
			{
				[1] = {itemid = 10268, count = 10, bind = 1},
				[2] = {itemid = 12014, count = 4, bind = 1},
				[3] = {itemid = 10287, count = 2, bind = 1}
			}
		},
		[5] = 
		{
			min_key = 200,  
			itemCount = 3,
			list = 
			{
				[1] = {itemid = 10306, count = 2, bind = 1},
				[2] = {itemid = 12014, count = 6, bind = 1},
				[3] = {itemid = 10287, count = 4, bind = 1}
			}
		},
		[6] = 
		{
			min_key = 300,  
			itemCount = 3,
			list = 
			{
				[1] = {itemid = 10306, count = 3, bind = 1},
				[2] = {itemid = 12014, count = 8, bind = 1},
				[3] = {itemid = 10287, count = 6, bind = 1}
			}
		},
		[7] = 
		{
			min_key = 500,  
			itemCount = 3,
			list = 
			{
				[1] = {itemid = 10306, count = 5, bind = 1},
				[2] = {itemid = 12014, count = 10, bind = 1},
				[3] = {itemid = 10287, count = 8, bind = 1}
			}
		},
		[8] = 
		{
			min_key = 1000,  
			itemCount = 3,
			list = 
			{
				[1] = {itemid = 10314, count = 1, bind = 1},
				[2] = {itemid = 12014, count = 15, bind = 1},
				[3] = {itemid = 10287, count = 10, bind = 1}
			}
		},


	}

} --寻宝有礼

g_gold_return_conf = 
{
	start_time = {year = 2016, month = 11, day = 7, hour = 0, min = 0, sec = 0},
	end_time = {year = 2017, month = 12, day = 28, hour = 0, min = 0, sec = 0},
	open_ser_tm = 
	{
		start_day = 1,
		end_day = 6,
	},
	use_open = true,
	version = 1,
	rate = 0.2 --返还的倍率

} --元宝返还
