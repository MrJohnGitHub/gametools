local function CheckActOpening(config, id)
	local t = tonumber(os.date("%H%M",os.time())); 
	if id == 6 then
		--syzf
		local start = config[1][1]
		local endTime = config[3][2]
		if t >= start and t < endTime then
			return true
		else
			return false
		end
	elseif id == 3 then
		local start = config[1][1]
		local endTime = config[1][3]
		if t >= start and t < endTime then
			return true
		else
			return false
		end
	elseif id == 7 then
		local start = config[1][3]
		local endTime = config[1][4]
		if t >= start and t < endTime then
			return true
		else
			return false
		end
	else
		if #config > 1 then
			return false
		end

		local start = config[1][1]
		local endTime = config[1][2]
		if t >= start and t < endTime then
			return true
		else
			return false
		end
	end
	return false
end

local function GetActConfig(type, config)
	if type == 1 then
		local now = os.time() + 60
		local endTime = now + 60 * 10
		local start = tonumber(os.date("%H%M",now))
		endTime = tonumber(os.date("%H%M",endTime)) 
		return {start, endTime}
	else
		local now = os.time() + 60
		local endTime = tonumber(os.date("%H%M",now))
		return {config[1][1], endTime}
	end
end

local function HandlerOpenAct(player, config, act_name)
	if #config > 1 then
		for i=#config, 2, -1 do
			table.remove(config, i)
		end
	end
	local ret = GetActConfig(1, config)
	config[1] = ret
	player:alert(12, 1, 0, act_name.."已经通过GM开启,开始时间:"..ret[1]..", 结束时间："..ret[2])
end

local function HandlerCloseAct(player, config, act_name)
	if #config > 1 then
		for i=#config, 2, -1 do
			table.remove(config, i)
		end
	end
	local ret = GetActConfig(2, config)
	config[1] = ret
	player:alert(12, 1, 0, act_name.."已经通过GM关闭,开始时间:"..ret[1]..", 结束时间："..ret[2])
end

local function HandlerOpenSyzfAct(player, config, act_name)
	local now = os.time()
	local start1 = now + 60
	local end1 = start1 + 60 * 3
	local start2 = end1
	local end2 = start2 + 60 * 10
	local start3 = start2 
	local end3 = end2 + 60 * 45
	start1 = tonumber(os.date("%H%M",start1))
	end1 = tonumber(os.date("%H%M",end1))
	start2 = tonumber(os.date("%H%M",start2))
	end2 = tonumber(os.date("%H%M",end2))
	start3 = tonumber(os.date("%H%M",start3))
	end3 = tonumber(os.date("%H%M",end3))

	config[1] = {start1, end1}
	config[2] = {start2, end2}
	config[3] = {start3, end3}
	player:alert(12, 1, 0, act_name.."已经通过GM开启,活动开始时间:"..config[1][1]..",活动结束时间："..config[3][2])
end

local function HandlerCloseSyzfAct(player, config, act_name)
	local now = os.time()
	local end3 = now + 60
	local start3 = end3 - 60 * 45
	local start2 = start3
	local end2 = start2 + 60 * 15
	local end1 = start2
	local start1 = end1 - 60 * 5

	start1 = tonumber(os.date("%H%M",start1))
	end1 = tonumber(os.date("%H%M",end1))

	start2 = tonumber(os.date("%H%M",start2))
	end2 = tonumber(os.date("%H%M",end2))

	start3 = tonumber(os.date("%H%M",start3))
	end3 = tonumber(os.date("%H%M",end3))

	config[1] = {start1, end1}
	config[2] = {start2, end2}
	config[3] = {start3, end3}
	player:alert(12, 1, 0, act_name.."已经通过GM关闭,活动开始时间:"..config[1][1]..",活动结束时间："..config[3][2])
end

local function HandlerOpenCityKnifeAct(player, config, act_name)
	local start = os.time() + 60 
	local endTime = start + 60 * 10
	start = tonumber(os.date("%H%M",start))
	endTime = tonumber(os.date("%H%M",endTime))
	config.activity_cityknife_tm[1] = {start, endTime}
	player:alert(12, 1, 0, act_name.."已经通过GM开启,开始时间:"..start..", 结束时间："..endTime)
	return config
end

local function HandlerCloseCityKnifeAct(player, config, act_name)
	local endTime = os.time() + 60
	endTime = tonumber(os.date("%H%M",endTime))
	config.activity_cityknife_tm[1][2] = endTime 
	player:alert(12, 1, 0, act_name.."已经通过GM关闭,开始时间:"..config.activity_cityknife_tm[1][1]..", 结束时间："..endTime)
	return config
end

local function HandlerOpenWK(player, config, act_name)
	local start = os.time() + 60
	local mid = start + 60 * 9
	local endT = mid + 60
	start = tonumber(os.date("%H%M",start))
	mid = tonumber(os.date("%H%M",mid))
	endT = tonumber(os.date("%H%M",endT))
	config[1] = {start, mid, endT}
	player:alert(12, 1, 0, act_name.."已经通过GM开启,开始时间:"..start..", 结束时间："..endT)
end

local function HandlerCloseWK(player, config, act_name)
	local endT = os.time() + 60
	local mid = endT - 60
	local start = mid - 60*9
	start = tonumber(os.date("%H%M",start))
	mid = tonumber(os.date("%H%M",mid))
	endT = tonumber(os.date("%H%M",endT))
	config[1] = {start, mid, endT}
	player:alert(12, 1, 0, act_name.."已经通过GM关闭,开始时间:"..start..", 结束时间："..endT)
end

local function HandlerOpenMiGongAct(player, config, act_name)
	if #config > 1 then
		for i=#config, 2, -1 do
			table.remove(config, i)
		end
	end
	local start = os.time() + 60
	local startbefor5min = start - 5 * 60
	local startbefor1min = startbefor5min + 4 * 60
	local endtime = start + 20 * 60
	local kicktime = endtime + 30 * 60
	start = tonumber(os.date("%H%M",start))
	startbefor5min = tonumber(os.date("%H%M",startbefor5min))
	startbefor1min = tonumber(os.date("%H%M",startbefor1min))
	endtime = tonumber(os.date("%H%M",endtime))
	kicktime = tonumber(os.date("%H%M",kicktime))
	config[1] = {startbefor5min, startbefor1min, start, endtime, kicktime}
	player:alert(12, 1, 0, act_name.."已经通过GM开启,开始时间:"..start..", 结束时间："..endtime..",踢人时间:"..kicktime)
end

local function HandlerCloseMiGongAct(player, config, act_name)
	if #config > 1 then
		for i=#config, 2, -1 do
			table.remove(config, i)
		end
	end

	local now = os.time() + 60
	local endTime = tonumber(os.date("%H%M",now))
	local kicktime =tonumber(os.date("%H%M",now + 60))
	config[1][4] = endTime
	config[1][5] = kicktime
	local start = config[1][3]
	player:alert(12, 1, 0, act_name.."已经通过GM关闭,开始时间:"..start..", 结束时间："..endTime..",踢人时间:"..kicktime)
end


local function HandlerOpenRunningManAct(player, config, act_name)
	if #config > 1 then
		for i=#config, 2, -1 do
			table.remove(config, i)
		end
	end
	local start = os.time() + 60
	local endTime = start + 60 * 3
	start = tonumber(os.date("%H%M",start))
	endTime = tonumber(os.date("%H%M",endTime))
	config[1] = {start, endTime}
	player:alert(12, 1, 0, act_name.."已经通过GM开启,开始时间:"..start..", 结束时间："..endTime)
end

local function HandlerCloseRunningManAct(player, config, act_name)
	if #config > 1 then
		for i=#config, 2, -1 do
			table.remove(config, i)
		end
	end
	local endTime = os.time() + 60
	local start = endTime - 60 * 3
	start = tonumber(os.date("%H%M",start))
	endTime = tonumber(os.date("%H%M",endTime))
	config[1] = {start, endTime}
	player:alert(12, 1, 0, act_name.."已经通过GM关闭,开始时间:"..start..", 结束时间："..endTime)
end

local function HandlerOpenSpecialRing(player, config, act_name)
	if #config > 1 then
		for i=#config, 2, -1 do
			table.remove(config, i)
		end
	end
	local start = os.time() + 60
	local endTime = start + 60 * 15
	start = tonumber(os.date("%H%M",start))
	endTime = tonumber(os.date("%H%M",endTime))
	config[1] = {start, endTime}
	player:alert(12, 1, 0, act_name.."已经通过GM开启,开始时间:"..start..", 结束时间："..endTime)
end

local function HandlerCloseSpecialRing(player, config, act_name)
	if #config > 1 then
		for i=#config, 2, -1 do
			table.remove(config, i)
		end
	end
	local endTime = os.time() + 60
	local start = endTime - 60 * 15
	start = tonumber(os.date("%H%M",start))
	endTime = tonumber(os.date("%H%M",endTime))
	config[1] = {start, endTime}
	player:alert(12, 1, 0, act_name.."已经通过GM关闭,开始时间:"..start..", 结束时间："..endTime)
end

local function HandlerOpenYzwcAct(player, config, act_name)
	if #config > 1 then
		for i=#config, 2, -1 do
			table.remove(config, i)
		end
	end
	local start = os.time() + 60
	local endTime = start + 60 * 20
	start = tonumber(os.date("%H%M",start))
	endTime = tonumber(os.date("%H%M",endTime))
	config[1] = {start, endTime}
	player:alert(12, 1, 0, act_name.."已经通过GM开启,开始时间:"..start..", 结束时间："..endTime)
end

local function HandlerCloseYzwcAct(player, config, act_name)
	-- body
	if #config > 1 then
		for i=#config, 2, -1 do
			table.remove(config, i)
		end
	end
	local endTime = os.time() + 60
	local start = endTime - 60 * 20
	start = tonumber(os.date("%H%M",start))
	endTime = tonumber(os.date("%H%M",endTime))
	config[1] = {start, endTime}
	player:alert(12, 1, 0, act_name.."已经通过GM关闭,开始时间:"..start..", 结束时间："..endTime)
end


local GMActHandlerSetting = {
	[1] = {config = activity_pk, OpenHandler = HandlerOpenAct, CloseHanler = HandlerCloseAct, act_name = "pk泡点活动"},
	[2] = {config = activity_qxzb_tm, OpenHandler = HandlerOpenAct, CloseHanler = HandlerCloseAct, act_name ="群雄争霸"},
	[3] = {config = activity_wk, OpenHandler = HandlerOpenWK, CloseHanler = HandlerCloseWK, act_name = "挖矿"},
	--[4] = {config = activity_wk, OpenHandler = HandlerOpenAct, CloseHanler = HandlerCloseAct},
	[5] = {config = activity_mobaichengzhu, OpenHandler = HandlerOpenAct, CloseHanler = HandlerCloseAct, act_name = "膜拜城主"},
	[6] = {config = activity_shuiyuzhengfeng, OpenHandler = HandlerOpenSyzfAct, CloseHanler = HandlerCloseSyzfAct, act_name = "谁与争锋"},
	[7] = {config = activity_migong, OpenHandler = HandlerOpenMiGongAct, CloseHanler = HandlerCloseMiGongAct, act_name = "迷宫"},
	[8] = {config = activity_zhengfengduomiao, OpenHandler = HandlerOpenAct, CloseHanler = HandlerCloseAct, act_name = "争分夺秒"},
	[9] = {config = activity_cityknife_tm, OpenHandler = HandlerOpenAct, CloseHanler = HandlerCloseAct, act_name = "城主之刃"},
	--[10] = {config = activity_wk, OpenHandler = HandlerOpenAct, CloseHanler = HandlerCloseAct},
	[11] = {config = activity_runningman, OpenHandler = HandlerOpenRunningManAct, CloseHanler = HandlerCloseRunningManAct, act_name = "奔跑吧兄弟"},
	[12] = {config = activity_duobaoqibing, OpenHandler = HandlerOpenAct, CloseHanler = HandlerCloseAct, act_name = "夺宝奇兵"},
	--[13] = {config = activity_wk, OpenHandler = HandlerOpenAct, CloseHanler = HandlerCloseAct},
	--[14] = {config = activity_wk, OpenHandler = HandlerOpenAct, CloseHanler = HandlerCloseAct},
	[15] = {config = activity_special_ring, OpenHandler = HandlerOpenSpecialRing, CloseHanler = HandlerCloseSpecialRing, act_name = "特戒活动"},
	[16] = {config = g_yzwc_config.tm, OpenHandler = HandlerOpenYzwcAct, CloseHanler = HandlerCloseYzwcAct, act_name = "夜战王城"},
}
--GM命令开启活动
function OnGmOpenActById(player, id)
	local config = GMActHandlerSetting[id] and GMActHandlerSetting[id].config
	if config ~= nil then
		local handler 
		if CheckActOpening(config, id) then
			handler = GMActHandlerSetting[id] and GMActHandlerSetting[id].CloseHanler
		else
			handler = GMActHandlerSetting[id] and GMActHandlerSetting[id].OpenHandler
		end

		if handler ~= nil then
			local act_name = GMActHandlerSetting[id] and GMActHandlerSetting[id].act_name
			handler(player, config, act_name)
			-- print_r(config)
		else
			print("handler is nil")
		end
	else
		print("config is nil by id:", id)
	end
end
