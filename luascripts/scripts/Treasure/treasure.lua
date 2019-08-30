--宝藏

function OnTreasureOpen(player) --开服前7天与7天后在界面上显示的道具图标
	local nkqts = g_get_day();
	local njob = player:get_job();
	local nsex = player:get_gender();
	local n1 = "";
	if nkqts >= 1 then
		if nsex == 1 then
			if njob == 1 then
			n1 = "20166,22231,21305,21405,21505,21605,20221,20421,20721,20821,21021,21121";
			elseif njob == 2 then
			n1 = "20166,22231,21310,21410,21510,21610,20242,20442,20742,20842,21042,21142";
			elseif njob == 3 then
			n1 = "20166,22231,21315,21415,21515,21615,20263,20463,20763,20863,21063,21163";
			end
		else
			if njob == 1 then
			n1 = "20166,22232,21305,21405,21505,21605,20221,20421,20721,20821,21021,21121";
			elseif njob == 2 then
			n1 = "20166,22232,21310,21410,21510,21610,20242,20442,20742,20842,21042,21142";
			elseif njob == 3 then
			n1 = "20166,22232,21315,21415,21515,21615,20263,20463,20763,20863,21063,21163";
			end
		end
	end
	
	if njob == 1 then
		player:SendTreasureInfo(0,0,"{\"goldnum\":200,\"goldtype\":2,\"point\":"..player:get_param(216)..",\"items\":["..n1.."]}");
	elseif njob == 2 then
		player:SendTreasureInfo(0,0,"{\"goldnum\":200,\"goldtype\":2,\"point\":"..player:get_param(216)..",\"items\":["..n1.."]}");
	elseif njob == 3 then
		player:SendTreasureInfo(0,0,"{\"goldnum\":200,\"goldtype\":2,\"point\":"..player:get_param(216)..",\"items\":["..n1.."]}");
	end
end



function OnLuckDraw(player, draw_count, isautobuy)
	local shen_sepcial = 1500;		--个人保底库累计次数
	local g_day = 1;				--开服第N天开启个人保底库
	
	if draw_count >= 1 and draw_count <= 50 then
		local nBlankCount = player:num_treasure_bag_black();
--		player:alert(2,0,0,"宝藏仓库剩余格子数："..nBlankCount);
		if nBlankCount < draw_count then
			player:alert(10,0,0,"您的宝藏仓库已满,请先整理宝藏仓库");
			return 1;
		end
				
		local nkqts = g_get_day();
		local nGold = draw_count * 200;
		local key_num = player:package_item(10268);
		if key_num >= draw_count then --挖宝钥匙全部满足
			player:remove_item(10268,draw_count,0);
			player:alert(10,0,0,"当前扣除"..draw_count.."把挖宝钥匙!");
		elseif ((key_num + player:get_vcoin() / 200) >= draw_count) and key_num >= 1 and isautobuy then  --挖宝钥匙+元宝满足
			player:remove_item(10268,key_num,0);
			player:alert(10,0,0,"当前扣除"..key_num.."把挖宝钥匙!");
			player:sub_vcoin((draw_count - key_num) * 200);
		elseif player:get_vcoin() >= nGold and isautobuy then --元宝满足
			player:sub_vcoin(200 * draw_count);
		else
			player:alert(10,0,0,"挖宝钥匙不足,无法挖掘宝藏");
			return 1;
		end		
		player:set_param(216,player:get_param(216) + draw_count);
		
		local target = {};
		local treasuremsg = {};
		
		local item_bind = 0;
		local awarditemid = 0;
		local datatype = 0;
		if nkqts < 10 then
			datatype = nkqts;
		else
			datatype = 10;
		end
		
		local specialitem = nil;
		local g_num = g_get_param(8);
		if g_num == 0 then
			g_num = math.random(g_special_wabao[datatype][1],g_special_wabao[datatype][2]);
		elseif draw_count >= g_num then
			g_num = math.random(g_special_wabao[datatype][1],g_special_wabao[datatype][2]);
			specialitem = g_special_wabao[datatype][3];
			draw_count = draw_count - 1;					
		else
			g_num = g_num - draw_count;
		end
		g_set_param(8,g_num);
		
		local nAllItem = nwabao[datatype];
		local nAllItemCount = #nwabao[datatype];		
		--暂时给一个效果		
		local tAwardCfg = nil;
		local tempitemid = 0;
		local tempcolor = 0;
		for i = 1, draw_count do			
			local nNowRate = 0;
			for j = 1, nAllItemCount do
				local nowCfg = nAllItem[j];
				nNowRate = math.random(1,nowCfg[1]);
	--			player:alert(2,0,0,"类型："..datatype.."，配置INDEX："..j..",配置概率："..nowCfg[1].."，触发概率："..nNowRate);
				if 1 == nNowRate then
					tAwardCfg = nowCfg;
					break;
				end				
			end
	--		player:alert(2,0,0,"成功挖到"..tAwardCfg[1].."："..tAwardCfg[4]);			
			
			awarditemid = tAwardCfg[2];
			local itemname = tAwardCfg[4];
			local type = tAwardCfg[3];
			local color = tAwardCfg[7];
			local zoumadeng = tAwardCfg[9];	
			if tempcolor <= tAwardCfg[8] then
				tempitemid = awarditemid;
				tempcolor = tAwardCfg[8];
			end
			if tAwardCfg[5] ~= 0 then
				local value = g_get_param(tAwardCfg[5]);
				if value == 0 or g_add_param(tAwardCfg[5],tAwardCfg[6]) == 0 then
					awarditemid = nAllItem[1][2];
					itemname = nAllItem[1][4];
					type = 0;
					color = 1;
					zoumadeng = 0;				
				end
			end
			item_bind = tAwardCfg[10];
			
			if g_day <= nkqts then
				local param260 = player:get_param(260) + 1;
				if awarditemid == 20121 or awarditemid == 22227 or awarditemid == 22228 then
					player:set_param(260,0);
				elseif param260 >= shen_sepcial then
					player:set_param(260,0);
					local n_rand = math.random(1,3);
					if n_rand == 1 then
						awarditemid = 20121;
						itemname = "焚天神剑";
					elseif n_rand == 2 then
						awarditemid = 22227;
						itemname = "焚天神甲";
					else
						awarditemid = 22228;
						itemname = "焚天神衣";
					end
					color = 6;
					type = 1;
					zoumadeng = 1;
					item_bind = 0;
				else
					player:set_param(260,param260);
				end
			end
			player:add_treasure_item(awarditemid,1,item_bind);
			
			local cl_str;
			if color == 1 then
				cl_str = "fefffd";
			elseif color == 2 then
				cl_str = "ee6503";
			elseif color == 3 then
				cl_str = "0be140";
			elseif color == 4 then
				cl_str = "00ccff";
			elseif color == 5 then
				cl_str = "be0af1";
			elseif color == 6 then
				cl_str = "ff0000";
			else
				cl_str = "fefffd";
			end
			
			table.insert(treasuremsg,0); --自己的提示
			table.insert(treasuremsg,0); --要与c++对应:int lang = lua_tonumber(L, -1);
			table.insert(treasuremsg, "<font color='#f5d39d'>你挖到了:<font color='#"..cl_str.."'><a href='event:"..awarditemid.."'><u>"..itemname.."</u></a></font><br>");
			
			if type == 1 then 
				table.insert(treasuremsg,1); --全服提示
				table.insert(treasuremsg,awarditemid);
				table.insert(treasuremsg,"<font color='#00ccff'>"..player:GetName().."</font><font color='#f5d39d'>获得:</font><font color='#"..cl_str.."'><a href='event:"..awarditemid.."'><u>"..itemname.."</u></a></font><br>");	
			
				table.insert(target,13); --聊天框提示				
				table.insert(target,"<font color='#00ccff'>"..player:GetName().."</font><font color='#Ffe536'>在寻宝中获得</font>{_equip,"..awarditemid.."} ".."<font color='#0be140'>{_showSysWin,去寻宝,OPEN_TAOBAO}</font>");
			end
			if zoumadeng == 1 then
				table.insert(target,14); --上面提示
				table.insert(target,"<font color='#00ccff'>"..player:GetName().."</font><font color='#Ffe536'>在寻宝中获得</font><font color='#"..cl_str.."'>"..itemname.."</font>");
			end
		end
		
		if specialitem ~= nil then
			local nNowRate = 0;
			for j = 1, #specialitem do
				local nowCfg = specialitem[j];
				nNowRate = math.random(1,nowCfg[1]);
	--			player:alert(2,0,0,"(特殊)类型："..datatype.."，配置INDEX："..j..",配置概率："..nowCfg[1].."，触发概率："..nNowRate);
				if 1 == nNowRate then
					tAwardCfg = nowCfg;
					break;
				end				
			end			
	--		player:alert(2,0,0,"(特殊)成功挖到"..tAwardCfg[2].."："..tAwardCfg[4]);			
			
			awarditemid = tAwardCfg[2];
			local itemname = tAwardCfg[4];
			local type = tAwardCfg[3];
			local color = tAwardCfg[7];
			local zoumadeng = tAwardCfg[9];
			if tempcolor <= tAwardCfg[8] then
				tempitemid = awarditemid;
				tempcolor = tAwardCfg[8];
			end
			if tAwardCfg[5] ~= 0 then
				local value = g_get_param(tAwardCfg[5]);
				if value == 0 or g_add_param(tAwardCfg[5],tAwardCfg[6]) == 0 then
					awarditemid = nAllItem[1][2];
					itemname = nAllItem[1][4];
					type = 0;
					color = 1;	
					zoumadeng = 0;			
				end
			end
			item_bind = tAwardCfg[10];
			
			if g_day <= nkqts then
				local param260 = player:get_param(260) + 1;
				if awarditemid == 20121 or awarditemid == 22227 or awarditemid == 22228 then
					player:set_param(260,0);
				elseif param260 >= shen_sepcial then
					player:set_param(260,0);
					local n_rand = math.random(1,3);
					if n_rand == 1 then
						awarditemid = 20121;
						itemname = "焚天神剑";
					elseif n_rand == 2 then
						awarditemid = 22227;
						itemname = "焚天神甲";
					else
						awarditemid = 22228;
						itemname = "焚天神衣";
					end
					color = 6;
					type = 1;
					zoumadeng = 1;
					item_bind = 0;
				else
					player:set_param(260,param260);
				end
			end
			player:add_treasure_item(awarditemid,1,item_bind);
			
			local cl_str;
			if color == 1 then
				cl_str = "dddddd";
			elseif color == 2 then
				cl_str = "e4b550";
			elseif color == 3 then
				cl_str = "79ff37";
			elseif color == 4 then
				cl_str = "7cd8ff";
			elseif color == 5 then
				cl_str = "ff19fc";
			elseif color == 6 then
				cl_str = "ff0808";
			else
				cl_str = "dddddd";
			end
			
			table.insert(treasuremsg,0); --自己的提示
			table.insert(treasuremsg,0); --要与c++对应:int lang = lua_tonumber(L, -1);
			table.insert(treasuremsg, "<font color='#f5d39d'>你挖到了:<font color='#"..cl_str.."'><a href='event:"..awarditemid.."'><u>"..itemname.."</u></a></font><br>");
			
			if type == 1 then 
				table.insert(treasuremsg,1); --全服提示
				table.insert(treasuremsg,awarditemid);
				table.insert(treasuremsg,"<font color='#00ccff'>"..player:GetName().."</font><font color='#f5d39d'>获得:</font><font color='#"..cl_str.."'><a href='event:"..awarditemid.."'><u>"..itemname.."</u></a></font><br>");			
											
				table.insert(target,13); --聊天框提示				
				table.insert(target,"<font color='#00ccff'>"..player:GetName().."</font><font color='#Ffe536'>在寻宝中获得</font>{_equip,"..awarditemid.."} ".."<font color='#0be140'>{_showSysWin,去寻宝,OPEN_TAOBAO}</font>");
			end
			if zoumadeng == 1 then
				table.insert(target,14); --上面提示
				table.insert(target,"<font color='#00ccff'>"..player:GetName().."</font><font color='#Ffe536'>在寻宝中获得</font><font color='#"..cl_str.."'>"..itemname.."</font>");
			end
		end
		
		SendGlobalMsg(target);
		player:SendTreasureNewsMessage(treasuremsg);
		player:FinishFeats(14, draw_count);
		AddTeadsureCount(player, draw_count)
		AddNewTreasureGiftParamCount(player, draw_count)
		return tempitemid or awarditemid or 0;
	end
end