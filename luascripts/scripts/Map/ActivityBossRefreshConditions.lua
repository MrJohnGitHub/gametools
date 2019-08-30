

local function IsCanRefresh(time_t, hour, min, sec)
	local t1 = time_t.hour * 3600 + time_t.min * 60 + time_t.sec
	local t2 = hour * 3600 + min * 60 + sec

	if t1 <= t2 then
		return true
	end 

	return false
end


local function RefreshMonsert(mgr, monster_info)
  local map_id = mgr:GetMapId()
  local obj = 
  {
        [1] = map_id, --地图id
        [2] = monster_info.x,  --x坐标
        [3] = monster_info.y,  --y坐标
        [4] = monster_info.id,  --怪物id
        [5] = monster_info.facad,  --形象id
        [6] = monster_info.name,  --怪物名字
        [7] = monster_info.number,  --怪物数量
        [8] = monster_info.radius,  --刷怪半径
        [19] = monster_info.bosstype       
  }
  mgr:mon_gen(encode(obj))
  mgr:SetActBossExistFlag(1)
end

local function IsSameDay(t1, t2)
	local d1 = os.date("*t", t1)
	d1.hour = 0
	d1.min = 0
	d1.sec = 0
	temp1 = os.time(d1)
	local d2 = os.date("*t", t2)
	d2.hour = 0
	d2.min = 0
	d2.sec = 0
	local temp2 = os.time(d2)

	if temp1 == temp2 then
		return true
	end

	return false
end

local function GetMonsterFreshTime(refresh_t)
	local d = os.date("*t", os.time())
	d.hour = refresh_t.hour
	d.min = refresh_t.min
	d.sec = refresh_t.sec
	return os.time(d)
end


function YuanBaoBossRefreshConditions(mgr,hour,min,sec)
	do
		return
	end
	local lastMonsterid = g_get_param(82)
	local refresh_t = yuanbaoBoss.refresh_t
	local monsterList = yuanbaoBoss.monsterList
	if lastMonsterid ~= 0 then
		local deadTime = g_get_param(83)
		if deadTime == 0 then
			if mgr:GetActBossExistFlag() == 0 then
				local monser_info = monsterList[lastMonsterid]
				if monser_info == nil then
					monser_info = yuanbaoBoss.frist_monster
					g_set_param(82, monser_info.id)
				end
				RefreshMonsert(mgr, monser_info)
			end
			return 
		end
		local refresh_time = g_get_param(84)
		local t2 = refresh_t.hour * 3600 + refresh_t.min * 60 + refresh_t.sec
		
		local isSameDayDead = false
		--先判断怪物刷出来的时间跟死亡的时间是不是同一天
		local dead_diff = deadTime - refresh_time
		if dead_diff < 86400 - t2 then
			isSameDayDead = true
		end

		if isSameDayDead == true and IsSameDay(os.time(), refresh_time) == true then
			return 
		end


		local t1 = math.mod(deadTime, 86400)
		if t1 >= t2 then
			return
		end

		if IsCanRefresh(refresh_t, hour,min,sec) == true then
			local range = yuanbaoBoss.rule and yuanbaoBoss.rule[lastMonsterid] and yuanbaoBoss.rule[lastMonsterid].range
			range = range * 60
			local next_monsterid = lastMonsterid
			if range == 0 or dead_diff <= range then
				next_monsterid = monsterList and monsterList[lastMonsterid] and monsterList[lastMonsterid].next_monster
			end
			if next_monsterid == nil then
				return 
			end
			g_set_param(82, next_monsterid)
			g_set_param(83, 0)
			local rt = GetMonsterFreshTime(refresh_t)
			g_set_param(84, rt)
			--刷怪
			local monser_info = monsterList[next_monsterid]
			RefreshMonsert(mgr, monser_info)
		end
	else
		if IsCanRefresh(refresh_t, hour,min,sec) == true then
			local frist_monster = yuanbaoBoss.frist_monster
			g_set_param(82, frist_monster.id)
			g_set_param(83, 0)
			local rt = GetMonsterFreshTime(refresh_t)
			g_set_param(84, rt)
			--刷怪
			RefreshMonsert(mgr, frist_monster)
		end
	end
end