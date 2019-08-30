--[[
七日目标功能系统
--]]

--[[

任务类型集合：
1 等级
2 玄神宫
3 完成一次封魔宝箱
4 全身强化+X
5 击杀某个特定BOSS
6 血符等级
7 盾等级
8 X件强化+X
9 参加一次攻城
10 坐骑等级达到X
--]]

g_SevenDayTargetAwardConf = 
{

	[1] = 
	{
		[1] = 
		{
			awardList = 
			{
				[1] = {itemid = 10159, count = 1, bind = 1},
				[2] = {itemid = 10147, count = 2, bind = 1},
				[3] = {itemid = 10207, count = 1, bind = 1},
				[4] = {itemid = 12014, count = 1, bind = 1},
			}, --奖励列表
			describe = "角色等级达到60级", 		--任务描述
			taskType = 1, 		--任务类型
			itemCount = 4, 		--奖励物品的数量
		}, --第1个任务的奖励

		[2] = 
		{
			awardList = 
			{
				[1] = {itemid = 10159, count = 2, bind = 1},
				[2] = {itemid = 10147, count = 4, bind = 1},
				[3] = {itemid = 10207, count = 2, bind = 1},
				[4] = {itemid = 12014, count = 1, bind = 1},
			}, --奖励列表
			describe = "角色等级达到65级", 		--任务描述
			taskType = 1, 		--任务类型
			itemCount = 4,
		}, --第2个任务的奖励

		[3] = 
		{
			awardList = 
			{
				[1] = {itemid = 10159, count = 3, bind = 1},
				[2] = {itemid = 10147, count = 6, bind = 1},
				[3] = {itemid = 10207, count = 3, bind = 1},
				[4] = {itemid = 12014, count = 1, bind = 1},
			}, --奖励列表
			describe = "玄神宫通关第5关", 		--任务描述
			taskType = 2, 		--任务类型
			itemCount = 4,
		}, --第3个任务的奖励

		[4] = 
		{
			awardList = 
			{
				[1] = {itemid = 10159, count = 4, bind = 1},
				[2] = {itemid = 10147, count = 8, bind = 1},
				[3] = {itemid = 10207, count = 4, bind = 1},
				[4] = {itemid = 12014, count = 1, bind = 1},
			}, --奖励列表
			describe = "完成一次封魔宝箱", 		--任务描述
			taskType = 3, 		--任务类型
			itemCount = 4,
		}, --第4个任务的奖励

		[5] = 
		{
			awardList = 
			{
				[1] = {itemid = 10161, count = 1, bind = 1},
				[2] = {itemid = 10147, count = 10, bind = 1},
				[3] = {itemid = 10207, count = 5, bind = 1},
				[4] = {itemid = 12014, count = 1, bind = 1},
			}, --奖励列表
			describe = "玄神宫通关第8关", 		--任务描述
			taskType = 2, 		--任务类型
			itemCount = 4,
		}, --第5个任务的奖励

		[6] = 
		{
			awardList = 
			{
				[1] = {itemid = 10338, count = 2, bind = 1},
				[2] = {itemid = 12014, count = 5, bind = 1},
				[3] = {itemid = 10287, count = 2, bind = 1},
			}, --奖励列表
			describe = "", 		--任务描述
			itemCount = 3,	
			extra = 1,			--额外奖励			

		}
	}, --第一天的奖励

[2] = 
	{
		[1] = 
		{
			awardList = 
			{
				[1] = {itemid = 40101, count = 150, bind = 1},
				[2] = {itemid = 10147, count = 2, bind = 1},
				[3] = {itemid = 12014, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "全身强化+6", 		--任务描述
			taskType = 4, 		--任务类型
			itemCount = 4, 		--奖励物品的数量
		}, --第1个任务的奖励

		[2] = 
		{
			awardList = 
			{
				[1] = {itemid = 40101, count = 100, bind = 1},
				[2] = {itemid = 10147, count = 4, bind = 1},
				[3] = {itemid = 12014, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "击杀70级个人BOSS", 		--任务描述
			taskType = 5, 		--任务类型
			itemCount = 4,
		}, --第2个任务的奖励

		[3] = 
		{
			awardList = 
			{
				[1] = {itemid = 40101, count = 150, bind = 1},
				[2] = {itemid = 10147, count = 6, bind = 1},
				[3] = {itemid = 12014, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "玄神宫通关第10关", 		--任务描述
			taskType = 2, 		--任务类型
			itemCount = 4,
		}, --第3个任务的奖励

		[4] = 
		{
			awardList = 
			{
				[1] = {itemid = 40101, count = 200, bind = 1},
				[2] = {itemid = 10147, count = 8, bind = 1},
				[3] = {itemid = 12014, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "击杀个人转一BOSS", 		--任务描述
			taskType = 5, 		--任务类型
			itemCount = 4,
		}, --第4个任务的奖励

		[5] = 
		{
			awardList = 
			{
				[1] = {itemid = 40101, count = 300, bind = 1},
				[2] = {itemid = 10147, count = 10, bind = 1},
				[3] = {itemid = 12014, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "玄神宫通关第12关", 		--任务描述
			taskType = 2, 		--任务类型
			itemCount = 4,
		}, --第5个任务的奖励

		[6] = 
		{
			awardList = 
			{
				[1] = {itemid = 40921, count = 2, bind = 1},
				[2] = {itemid = 10342, count = 1, bind = 1},
				[3] = {itemid = 10287, count = 2, bind = 1},
			}, --奖励列表
			describe = "", 		--任务描述
			itemCount = 3,	
			extra = 1,			--额外奖励	配置1表示是额外奖励

		}
	}, --第二天的奖励

[3] = 
	{
		[1] = 
		{
			awardList = 
			{
				[1] = {itemid = 40902, count = 3, bind = 1},
				[2] = {itemid = 10147, count = 2, bind = 1},
				[3] = {itemid = 10279, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "血玉等级达到8级", 		--任务描述
			taskType = 6, 		--任务类型
			itemCount = 4, 		--奖励物品的数量
		}, --第1个任务的奖励

		[2] = 
		{
			awardList = 
			{
				[1] = {itemid = 40902, count = 6, bind = 1},
				[2] = {itemid = 10147, count = 4, bind = 1},
				[3] = {itemid = 10279, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "血玉等级达到10级", 		--任务描述
			taskType = 6, 		--任务类型
			itemCount = 4,
		}, --第2个任务的奖励

		[3] = 
		{
			awardList = 
			{
				[1] = {itemid = 40902, count = 9, bind = 1},
				[2] = {itemid = 10147, count = 6, bind = 1},
				[3] = {itemid = 10279, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "全身强化加7", 		--任务描述
			taskType = 4, 		--任务类型
			itemCount = 4,
		}, --第3个任务的奖励

		[4] = 
		{
			awardList = 
			{
				[1] = {itemid = 40902, count = 12, bind = 1},
				[2] = {itemid = 10147, count = 8, bind = 1},
				[3] = {itemid = 10279, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "玄神宫通关第13关", 		--任务描述
			taskType = 2, 		--任务类型
			itemCount = 4,
		}, --第4个任务的奖励

		[5] = 
		{
			awardList = 
			{
				[1] = {itemid = 40902, count = 15, bind = 1},
				[2] = {itemid = 10147, count = 10, bind = 1},
				[3] = {itemid = 10279, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "玄神宫通关第14关", 		--任务描述
			taskType = 2, 		--任务类型
			itemCount = 4,
		}, --第5个任务的奖励

		[6] = 
		{
			awardList = 
			{
				[1] = {itemid = 40903, count = 2, bind = 1},
				[2] = {itemid = 10342, count = 1, bind = 1},
				[3] = {itemid = 10287, count = 2, bind = 1},
			}, --奖励列表
			describe = "", 		--任务描述
			itemCount = 3,	
			extra = 1,			--额外奖励			

		}
	}, --第三天的奖励

	[4] = 
	{
		[1] = 
		{
			awardList = 
			{
				[1] = {itemid = 12021, count = 4, bind = 1},
				[2] = {itemid = 10147, count = 2, bind = 1},
				[3] = {itemid = 10300, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "神盾等级达到5级", 		--任务描述
			taskType = 7, 		--任务类型
			itemCount = 4, 		--奖励物品的数量
		}, --第1个任务的奖励

		[2] = 
		{
			awardList = 
			{
				[1] = {itemid = 12021, count = 4, bind = 1},
				[2] = {itemid = 10147, count = 4, bind = 1},
				[3] = {itemid = 10300, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "2件装备强化+8", 		--任务描述
			taskType = 8, 		--任务类型
			itemCount = 4,
		}, --第2个任务的奖励

		[3] = 
		{
			awardList = 
			{
				[1] = {itemid = 12021, count = 4, bind = 1},
				[2] = {itemid = 10147, count = 6, bind = 1},
				[3] = {itemid = 10300, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "角色等级达到75级", 		--任务描述
			taskType = 1, 		--任务类型
			itemCount = 4,
		}, --第3个任务的奖励

		[4] = 
		{
			awardList = 
			{
				[1] = {itemid = 12021, count = 4, bind = 1},
				[2] = {itemid = 10147, count = 8, bind = 1},
				[3] = {itemid = 10300, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "玄神宫通关第15关", 		--任务描述
			taskType = 2, 		--任务类型
			itemCount = 4,
		}, --第4个任务的奖励

		[5] = 
		{
			awardList = 
			{
				[1] = {itemid = 12021, count = 4, bind = 1},
				[2] = {itemid = 10147, count = 10, bind = 1},
				[3] = {itemid = 10300, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "参加一次攻城战", 		--任务描述
			taskType = 9, 		--任务类型
			itemCount = 4,
		}, --第5个任务的奖励

		[6] = 
		{
			awardList = 
			{
				[1] = {itemid = 10343, count = 1, bind = 1},
				[2] = {itemid = 10342, count = 1, bind = 1},
				[3] = {itemid = 10287, count = 2, bind = 1},
			}, --奖励列表
			describe = "", 		--任务描述
			itemCount = 3,	
			extra = 1,			--额外奖励			

		}
	}, --第四天的奖励

	[5] = 
	{
		[1] = 
		{
			awardList = 
			{
				[1] = {itemid = 10153, count = 4, bind = 1},
				[2] = {itemid = 10147, count = 2, bind = 1},
				[3] = {itemid = 10300, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "血玉等级达到11级", 		--任务描述
			taskType = 6, 		--任务类型
			itemCount = 4, 		--奖励物品的数量
		}, --第1个任务的奖励

		[2] = 
		{
			awardList = 
			{
				[1] = {itemid = 10153, count = 4, bind = 1},
				[2] = {itemid = 10147, count = 4, bind = 1},
				[3] = {itemid = 10300, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "角色等级达到77级", 		--任务描述
			taskType = 1, 		--任务类型
			itemCount = 4,
		}, --第2个任务的奖励

		[3] = 
		{
			awardList = 
			{
				[1] = {itemid = 10153, count = 4, bind = 1},
				[2] = {itemid = 10147, count = 6, bind = 1},
				[3] = {itemid = 10300, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "3件装备强化+8", 		--任务描述
			taskType = 8, 		--任务类型
			itemCount = 4,
		}, --第3个任务的奖励

		[4] = 
		{
			awardList = 
			{
				[1] = {itemid = 10153, count = 4, bind = 1},
				[2] = {itemid = 10147, count = 8, bind = 1},
				[3] = {itemid = 10300, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "玄神宫通关第16关", 		--任务描述
			taskType = 2, 		--任务类型
			itemCount = 4,
		}, --第4个任务的奖励

		[5] = 
		{
			awardList = 
			{
				[1] = {itemid = 10153, count = 4, bind = 1},
				[2] = {itemid = 10147, count = 10, bind = 1},
				[3] = {itemid = 10300, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "击杀个人转三BOSS", 		--任务描述
			taskType = 5, 		--任务类型
			itemCount = 4,
		}, --第5个任务的奖励

		[6] = 
		{
			awardList = 
			{
				[1] = {itemid = 10345, count = 1, bind = 1},
				[2] = {itemid = 10342, count = 1, bind = 1},
				[3] = {itemid = 10287, count = 2, bind = 1},
			}, --奖励列表
			describe = "", 		--任务描述
			itemCount = 3,	
			extra = 1,			--额外奖励			

		}
	}, --第五天的奖励

	[6] = 
	{
		[1] = 
		{
			awardList = 
			{
				[1] = {itemid = 10151, count = 4, bind = 1},
				[2] = {itemid = 10147, count = 2, bind = 1},
				[3] = {itemid = 10300, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "坐骑等级达到2阶", 		--任务描述
			taskType = 10, 		--任务类型
			itemCount = 4, 		--奖励物品的数量
		}, --第1个任务的奖励

		[2] = 
		{
			awardList = 
			{
				[1] = {itemid = 10151, count = 4, bind = 1},
				[2] = {itemid = 10147, count = 4, bind = 1},
				[3] = {itemid = 10300, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "神盾等级达到6级", 		--任务描述
			taskType = 7, 		--任务类型
			itemCount = 4,
		}, --第2个任务的奖励

		[3] = 
		{
			awardList = 
			{
				[1] = {itemid = 10151, count = 4, bind = 1},
				[2] = {itemid = 10147, count = 6, bind = 1},
				[3] = {itemid = 10300, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "4件装备达到强化+8", 		--任务描述
			taskType = 8, 		--任务类型
			itemCount = 4,
		}, --第3个任务的奖励

		[4] = 
		{
			awardList = 
			{
				[1] = {itemid = 10151, count = 4, bind = 1},
				[2] = {itemid = 10147, count = 8, bind = 1},
				[3] = {itemid = 10300, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "角色等级达到80级", 		--任务描述
			taskType = 1, 		--任务类型
			itemCount = 4,
		}, --第4个任务的奖励

		[5] = 
		{
			awardList = 
			{
				[1] = {itemid = 10151, count = 4, bind = 1},
				[2] = {itemid = 10147, count = 10, bind = 1},
				[3] = {itemid = 10300, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "玄神宫通关第17关", 		--任务描述
			taskType = 2, 		--任务类型
			itemCount = 4,
		}, --第5个任务的奖励

		[6] = 
		{
			awardList = 
			{
				[1] = {itemid = 10344, count = 1, bind = 1},
				[2] = {itemid = 10342, count = 1, bind = 1},
				[3] = {itemid = 10287, count = 2, bind = 1},
			}, --奖励列表
			describe = "", 		--任务描述
			itemCount = 3,	
			extra = 1,			--额外奖励			

		}
	}, --第六天的奖励

	[7] = 
	{
		[1] = 
		{
			awardList = 
			{
				[1] = {itemid = 31304, count = 20, bind = 1},
				[2] = {itemid = 10147, count = 2, bind = 1},
				[3] = {itemid = 40901, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "血玉等级达到13级", 		--任务描述
			taskType = 6, 		--任务类型
			itemCount = 4, 		--奖励物品的数量
		}, --第1个任务的奖励

		[2] = 
		{
			awardList = 
			{
				[1] = {itemid = 31304, count = 40, bind = 1},
				[2] = {itemid = 10147, count = 4, bind = 1},
				[3] = {itemid = 40901, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "角色等级达到82级", 		--任务描述
			taskType = 1, 		--任务类型
			itemCount = 4,
		}, --第2个任务的奖励

		[3] = 
		{
			awardList = 
			{
				[1] = {itemid = 31304, count = 60, bind = 1},
				[2] = {itemid = 10147, count = 6, bind = 1},
				[3] = {itemid = 40901, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "6件装备强化+8", 		--任务描述
			taskType = 8, 		--任务类型
			itemCount = 4,
		}, --第3个任务的奖励

		[4] = 
		{
			awardList = 
			{
				[1] = {itemid = 31304, count = 80, bind = 1},
				[2] = {itemid = 10147, count = 8, bind = 1},
				[3] = {itemid = 40901, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "玄神宫通关第18关", 		--任务描述
			taskType = 2, 		--任务类型
			itemCount = 4,
		}, --第4个任务的奖励

		[5] = 
		{
			awardList = 
			{
				[1] = {itemid = 31304, count = 100, bind = 1},
				[2] = {itemid = 10147, count = 10, bind = 1},
				[3] = {itemid = 40901, count = 1, bind = 1},
				[4] = {itemid = 10295, count = 1, bind = 1},
			}, --奖励列表
			describe = "击杀个人转五BOSS", 		--任务描述
			taskType = 5, 		--任务类型
			itemCount = 4,
		}, --第5个任务的奖励

		[6] = 
		{
			awardList = 
			{
				[1] = {itemid = 10346, count = 1, bind = 1},
				[2] = {itemid = 10342, count = 1, bind = 1},
				[3] = {itemid = 10287, count = 2, bind = 1},
			}, --奖励列表
			describe = "", 		--任务描述
			itemCount = 3,	
			extra = 1,			--额外奖励			

		}
	}, --第七天的奖励
}


--任务种类
--击杀特定boss这个任务种类 key就填怪物的ID
--装备 和 强化 这个任务种类 key是数量，param1是等级要求
g_TargetTask = 
{
	[1] =
	{
		[1] = {key = 60, taskType = 1},
		[2] = {key = 65, taskType = 1},
		[3] = {key = 5, taskType = 2},
		[4] = {key = 1, taskType = 3},
		[5] = {key = 8, taskType = 2},
		
	},

	[2] =
	{
		[1] = {key = 13, param1 = 6, taskType = 4},
		[2] = {key = 2143, taskType = 5},
		[3] = {key = 10, taskType = 2},
		[4] = {key = 2144, taskType = 5},
		[5] = {key = 12, taskType = 2},
	},

	[3] = 
	{
		[1] = {key = 8, taskType = 6},
		[2] = {key = 10, taskType = 6},
		[3] = {key = 13, param1 = 7, taskType = 4},
		[4] = {key = 13, taskType = 2},
		[5] = {key = 14, taskType = 2},
	},

	[4] = 
	{
		[1] = {key = 5, taskType = 7},
		[2] = {key = 2, param1 = 8, taskType = 8},
		[3] = {key = 75, taskType = 1},
		[4] = {key = 15, taskType = 2},
		[5] = {key = 1, param1 = 1, taskType = 9},
	},

	[5] = 
	{
		[1] = {key = 11, taskType = 6},
		[2] = {key = 77, taskType = 1},
		[3] = {key = 3, param1 = 8, taskType = 8},
		[4] = {key = 16, taskType = 2},
		[5] = {key = 2145, taskType = 5},
	},

	[6] = 
	{
		[1] = {key = 2, taskType = 10},
		[2] = {key = 6, taskType = 7},
		[3] = {key = 4, param1 = 8, taskType = 8},
		[4] = {key = 80, taskType = 1},
		[5] = {key = 17, taskType = 2},
	},

	[7] = 
	{
		[1] = {key = 13, taskType = 6},
		[2] = {key = 82, taskType = 1},
		[3] = {key = 6, param1 = 8, taskType = 8},
		[4] = {key = 18, taskType = 2},
		[5] = {key = 7040, taskType = 5},
	},
}

local S2C_REQ_SEVEN_DAY_TARGET_INFO = 4950
local S2C_REQ_GET_SEVEN_DAY_TARGET_AWARD = 4951
local S2C_NOTIFY_SEVEN_DAY_TARGET_TASK_FINISH = 4952
local OPT_TYPE = 266
local CONSUME_TYPE = 266
local FLY = 0


function CheckSevenDayTargetLevelTaskIsFinish(player, key)
	if player:GetLevel() >= key then
			return true
	end

	return false
end

function CheckSevenDayTargetXueYuTaskIsFinish(player, key)
	if player:GetNalchmyLevelByType(1) >= key then
			return true
	end

	return false
end

function CheckSevenDayTargetShenDunTaskIsFinish(player, key)
	if player:GetNalchmyLevelByType(2) >= key then
			return true
	end

	return false	
end

function CheckSevenDayTargetMountTaskIsFinish(player, key)
	local mountAdvance, star = player:get_mount_info()
	if mountAdvance >= key then
			return true
	end

	return false
end

function CheckSevenDayTargetEquipTaskIsFinish(player, key, param1)
	if player:GetDressEquipCount(param1) >= key then
			return true
	end

	return false
end

function CheckSevenDayTargetEquipStrongTaskIsFinish(player, key, param1)
	if player:GetEquipStrongCount(param1) >= key then
		return true
	end

	return false
end

function CheckSevenDayTargetXuanShenGongTaskIsFinish(player, key)
	if player:get_param(600) >= key then
			return true
	end

	return false
end

function CheckSevenDayTargetSealMagicBoxIsFinish(player, key)
	if player:get_param(805) >= key then
		return true
	end

	return false
end

function CheckSevenDayTaragetKillSpecilBoss(player, key, param1)
	local killCount = player:GetKillBossCountById(key)
	if killCount >= param1 then
		return true
	end
	return false
end

function CheckSevenDayTargetJoinCastlIsFinish(player, key)
	if player:get_param(803) >= key then
		return true
	end

	return false
end

CheckSevenDayTargetFinishHandleList = 
{
		[1] = {finishHandler = CheckSevenDayTargetLevelTaskIsFinish},
		[2] = {finishHandler = CheckSevenDayTargetXuanShenGongTaskIsFinish},
		[3] = {finishHandler = CheckSevenDayTargetSealMagicBoxIsFinish},
		[4] = {finishHandler = CheckSevenDayTargetEquipTaskIsFinish},
		[5] = {finishHandler = CheckSevenDayTaragetKillSpecilBoss},
		[6] = {finishHandler = CheckSevenDayTargetXueYuTaskIsFinish},
		[7] = {finishHandler = CheckSevenDayTargetShenDunTaskIsFinish},
		[8] = {finishHandler = CheckSevenDayTargetEquipStrongTaskIsFinish},
		[9] = {finishHandler = CheckSevenDayTargetJoinCastlIsFinish},
		[10] = {finishHandler = CheckSevenDayTargetMountTaskIsFinish},
}

function CheckSevenDayTargetSystemCanShow(player)
	local createTime = player:getCreatureTime()
	local whichDay = GetTodayIsWhichDay(createTime)
	if whichDay > 7 then
		return false, whichDay
	end

	return true, whichDay
end

--击杀怪的时候走一个单独的接口
function KillSpecilBossNotifySevenDayTargetFinish(player, monsterId)
	print("KillSpecilBossNotifySevenDayTargetFinish monsterId:",monsterId)
	local isOpen, whichDay = CheckSevenDayTargetSystemCanShow(player)
	if isOpen == false then
		return 
	end
	local notify = false
	local retMsg = {}
	for i = 1, #g_SevenDayTargetAwardConf do
		if i > whichDay then
			break
		end
		local paramKey = 789 + i
		local action, misc, type_ = player:get_param_all_info(paramKey)
		local taskConf = g_SevenDayTargetAwardConf[i]

		local taskConf = g_SevenDayTargetAwardConf[i]
		for index = 1, #taskConf do
			if taskConf[index].taskType and taskConf[index].taskType == 5 then
				if GetBitFlagByIndex(action, index) ~= 1 then
					local confitionsConf = g_TargetTask[i] and g_TargetTask[i][index]
					if confitionsConf and confitionsConf.taskType == 5 then
						local key = confitionsConf.key
						if key == monsterId then
							action = player:set_param_action_index_flag(paramKey, index)
							notify = true
							local info = {finishFlag = action, awardFlag = misc, whichDay = i}
							table.insert(retMsg, info)
						end
					end
				end
			end
		end
	end

	if notify == true then
		print_r(retMsg)
		player:SendPacketToSelf(S2C_NOTIFY_SEVEN_DAY_TARGET_TASK_FINISH, 0, encode(retMsg))
	end
end

function NotifySevenDayTargetFinish(player, taskType)
	-- if taskType == 5 then
	-- 	--击杀特定怪走单独的接口
	-- 	return 
	-- end
	local isOpen, whichDay = CheckSevenDayTargetSystemCanShow(player)
	if isOpen == false then
		return 
	end
	local retMsg = {}
	local notify = false
	for i = 1, #g_SevenDayTargetAwardConf do
		if i > whichDay then
			break
		end

		local paramKey = 789 + i
		local action, misc, type_ = player:get_param_all_info(paramKey)
		local taskConf = g_SevenDayTargetAwardConf[i]
		for index = 1, #taskConf do
			if taskConf[index].taskType and taskConf[index].taskType == taskType then
				if GetBitFlagByIndex(action, index) ~= 1 then
					--之前没有完成过这个任务
					local confitionsConf = g_TargetTask[i] and g_TargetTask[i][index]
					if confitionsConf ~= nil and confitionsConf.taskType == taskType then
						local key = confitionsConf.key
						local param1 = confitionsConf.param1 or 1
						local func = CheckSevenDayTargetFinishHandleList[taskType] and CheckSevenDayTargetFinishHandleList[taskType].finishHandler
						if func ~= nil then
							local retCode = func(player, key, param1)
							if retCode == true then
								action = player:set_param_action_index_flag(paramKey, index)
								notify = true
								local info = {finishFlag = action, awardFlag = misc, whichDay = i}
								table.insert(retMsg, info)
							end
						else
							print("NotifySevenDayTargetFinish can not found the func by the taskType:",taskType)
						end
					else
						local errMsg = "NotifySevenDayTargetFinish can not found the confitionsConf by whichDay:"..i.." and taskType:"..taskType
						print(errMsg)
					end
				end
			end
		end
	end

	if notify == true then
		print_r(retMsg)
		player:SendPacketToSelf(S2C_NOTIFY_SEVEN_DAY_TARGET_TASK_FINISH, 0, encode(retMsg))
	end
end

function CheckCanGetSevenDayTargetAwardByIndex(player, whichDay, index)
	local bFlag, passDay = CheckSevenDayTargetSystemCanShow(player)
	if bFlag == false then
		return false, "活动已经结束"
	end

	if passDay < whichDay then
		return false, "活动还没开放到这一天"
	end

	local conf = g_SevenDayTargetAwardConf[whichDay] and g_SevenDayTargetAwardConf[whichDay][index]
	if conf == nil then
		return false, "活动配置有误"
	end

	local paramKey = 789 + whichDay
	local action, misc, type_ = player:get_param_all_info(paramKey)

	if conf.extra and conf.extra == 1 then
		if action ~= 31 then
			return false, "没有全部任务达成,不能领取额外奖励"
		end
	else
		if GetBitFlagByIndex(action, index) ~= 1 then
			return false, "没有完成任务,不能领取奖励"
		end
	end

	if GetBitFlagByIndex(misc, index) == 1 then
		return false, "不能重复领取奖励"
	end

	return true

end


function GatherSevenDayTargetInfo(player)
	local createTime = player:getCreatureTime()
	local whichDay = GetTodayIsWhichDay(createTime)
	local retMsg = { whichDay = whichDay }
	local index = 1
	for i = 790, 796 do
		local actionName = 'finishFlag'..index
		local flagName = 'awardFlag'..index
		local action, misc, type_ = player:get_param_all_info(i)
		retMsg[actionName] = action
		retMsg[flagName] = misc
		index = index + 1
	end

	return retMsg
end

--跨天自动检测是否完成七日目标
function AutoCheckSevenDayTargetFinish(player)
	for taskType = 1, 10 do
		NotifySevenDayTargetFinish(player, taskType)
	end
end

--------------------------------游戏协议-----------------------------------------------------------

function HandlerReqSevenDayTargetInfo(player)
	local retMsg = GatherSevenDayTargetInfo(player)
	print_r(retMsg)
	player:SendPacketToSelf(S2C_REQ_SEVEN_DAY_TARGET_INFO, 0, encode(retMsg))
end



function HandlerReqGetSevenDayTaragetAwardByIndex(player, whichDay, index)

	local conf = g_SevenDayTargetAwardConf[whichDay] and g_SevenDayTargetAwardConf[whichDay][index]
	if conf == nil then
		--配置有问题
		return 
	end

	local itemCount = conf.itemCount
	if player:num_bag_black(0) < itemCount then
		local errMsg = "背包不足,请先清理背包"
		player:alert(10,0,0,errMsg)
		return 
	end

	local retCode, errMsg = CheckCanGetSevenDayTargetAwardByIndex(player, whichDay, index)
	if retCode == false then
		player:alert(10,0,0,errMsg)
		return 
	end
	local paramKey = 789 + whichDay
	local misc = player:set_param_misc_index_flag(paramKey, index)
	for k, v in pairs(conf.awardList or {}) do
		player:NewAddItem(v.itemid, v.count, OPT_TYPE, CONSUME_TYPE, FLY, v.bind)
	end
	local action = player:get_param(paramKey)
	local retMsg = {whichDay = whichDay, awardFlag = misc, finishFlag = action}
	print_r(retMsg)
	player:SendPacketToSelf(S2C_REQ_GET_SEVEN_DAY_TARGET_AWARD, 0, encode(retMsg))
end



