function ontalk1912(npc,event,player)
	if player:get_task_state(3) == 66 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
我这里合成很多装备!
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">2300000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>
#&item10145#&<font color="#28FF28">盾牌精华(小) * 1</font>

#&todoM2402,1#&talk_finish_bt#&]]);
	elseif player:get_task_state(3) == 195 then
		player:gui_high_focus(101,3,30,35,"点击npc寻路");
		player:gui_high_focus(0,2,265,467,"请点击链接");
		player:echo(0,npc:GetLowGUID(),[[
#&task_task#&
#&task_describe#&
我这里合成很多装备!
#&task_target#&

#&talk_line#&
#&task_award#&
经验奖励：
#&item19005#&<font color="#28FF28">3400000</font>
金币奖励:
#&item19004#&<font color="#28FF28">0</font>

#&todoM2402,261#&talk_finish_bt#&]]);
	else
		local job = player:get_job();
		local level = player:get_level();
		local n1,n2,n3,n4,n5 = 3,4,5,6,7;
		local n6,n7,n8,n9,n10 = 0,0,0,0,0;
		local s1,s2,s3,s4,s5 = "","","","","";
		local sjob = "";
		if job == 1 then
			sjob = "<font color='#ff5f20'>合成战士装备</font>";
		elseif job == 2 then
			sjob = "<font color='#ff5f20'>合成法师装备</font>";
		elseif job == 3 then
			sjob = "<font color='#ff5f20'>合成道士装备</font>";
		end

		s5 = "6C6C6C"
		s4 = "6C6C6C"
		s3 = "6C6C6C"
		s2 = "6C6C6C"
		s1 = "6C6C6C"

		if level >= 90 then
			local num_item = 0;
			local itemid = 0;
			for i=1,18 do
				 itemid = Itemtable[5][i];
				 num_item = player:package_item(itemid);
				if num_item >= 1 then
					n10 = n10 + num_item;
				end
				if n10 >= Itemtable[5][19] then
					s5 = "21d119"
				end
			end
		end
		if level >= 85 then
			local num_item = 0;
			local itemid = 0;
			for i=1,18 do
				 itemid = Itemtable[4][i];
				 num_item = player:package_item(itemid);
				if num_item >= 1 then
					n9 = n9 + num_item;
				end
				if n9 >= Itemtable[4][19] then
					s4 = "21d119"
				end
			end
		end
		if level >= 80 then
			local num_item = 0;
			local itemid = 0;
			for i=1,18 do
				 itemid = Itemtable[3][i];
				 num_item = player:package_item(itemid);
				if num_item >= 1 then
					n8 = n8 + num_item;
				end
				if n8 >= Itemtable[3][19] then
					s3 = "21d119"
				end
			end
		end
		if level >= 70 then
			local num_item = 0;
			local itemid = 0;
			for i=1,18 do
				 itemid = Itemtable[2][i];
				 num_item = player:package_item(itemid);
				if num_item >= 1 then
					n7 = n7 + num_item;
				end
				if n7 >= Itemtable[2][19] then
					 s2 = "21d119"
				end
			end
		end
		if level >= 60 then
			local num_item = 0;
			local itemid = 0;
			for i=1,18 do
				itemid = Itemtable[1][i];
				num_item = player:package_item(itemid);
				if num_item >= 1 then
					n6 = n6 + num_item;
				end
				if n6 >= Itemtable[1][19] then
					s1 = "21d119"
				end
			end
		end

	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
作为一名战士，要时刻保持武器的锋利。
#&task_content#&

#&talk_line#&
                     	   ]]..sjob..[[ 

#&talk_line#&


                     	<font color='#]]..s1..[['><u><a href='event:M2402,]]..n1..[['>合成70级首饰</a></u></font> <u><a href='event:M2402,]]..n1..[[|[font color="#21d119"]合成介绍[/font]：\n使用9件合成1件'>(]]..n6..[[/9)</a></u>

                     	<font color='#]]..s2..[['><u><a href='event:M2402,]]..n2..[['>合成75级首饰</a></u></font> <u><a href='event:M2402,]]..n2..[[|[font color="#21d119"]合成介绍[/font]：\n使用3件合成1件'>(]]..n7..[[/3)</a></u>

                     	<font color='#]]..s3..[['><u><a href='event:M2402,]]..n3..[['>合成80级首饰</a></u></font> <u><a href='event:M2402,]]..n3..[[|[font color="#21d119"]合成介绍[/font]：\n使用3件合成1件'>(]]..n8..[[/3)</a></u> 

                     	<font color='#]]..s4..[['><u><a href='event:M2402,]]..n4..[['>合成85级首饰</a></u></font> <u><a href='event:M2402,]]..n4..[[|[font color="#21d119"]合成介绍[/font]：\n使用3件合成1件'>(]]..n9..[[/3)</a></u>

                     	<font color='#]]..s5..[['><u><a href='event:M2402,]]..n5..[['>合成90级首饰</a></u></font> <u><a href='event:M2402,]]..n5..[[|[font color="#21d119"]合成介绍[/font]：\n使用3件合成1件'>(]]..n10..[[/3)</a></u> 

#&talk_line#&

  ]]);
  end
end


function ontalk1912_1(npc,event,player)
	if player:num_bag_black() < 1 then
		player:alert(21,0,0,"您的背包空间不足1格,无法领取奖励");
	elseif player:get_task_state(3) == 66 then
		player:set_task_state(3,67);
		player:push_task_data(1,1);
		player:add_exp(2300000);

		player:add_gamemoney_bind(0);
		player:add_item(10145,1,1,0,0);
		player:find_road_goto(17,131,146,1717);
	end
end

function ontalk1912_261(npc,event,player)

end


Itemtable = {
	[1] = {40006,40007,40008,50006,50007,50008,60006,60007,60008,70006,70007,70008,90006,90007,90008,100006,100007,100008,9,100000},
	[2] = {40009,40010,40011,50009,50010,50011,60009,60010,60011,70009,70010,70011,90009,90010,90011,100009,100010,100011,3,200000},
	[3] = {40012,40013,40014,50012,50013,50014,60012,60013,60014,70012,70013,70014,90012,90013,90014,100012,100013,100014,3,500000},
	[4] = {40015,40016,40017,50015,50016,50017,60015,60016,60017,70015,70016,70017,90015,90016,90017,100015,100016,100017,3,750000},
	[5] = {40018,40019,40020,50018,50019,50020,60018,60019,60020,70018,70019,70020,90018,90019,90020,100018,100019,100020,3,1000000}
};

function ontalk1912_665(npc,event,player)
	ontalk1912(npc,event,player);
end

function ontalk1912_666(npc,event,player)
	local n1 = 0;
	local num_item = 0;
	local itemid = 0;
	for i=1,18 do
		itemid = Itemtable[1][i];
		num_item = player:package_item(itemid);
		if num_item >= 1 then
			n1 = n1 + num_item;
		end
		if n1 >= Itemtable[1][19] then
			return 1;
		end
	end
end

function ontalk1912_667(npc,event,player)
	local n1 = 0;
	local num_item = 0;
	local itemid = 0;
	for i=1,18 do
		 itemid = Itemtable[2][i];
		 num_item = player:package_item(itemid);
		if num_item >= 1 then
			n1 = n1 + num_item;
		end
		if n1 >= Itemtable[2][19] then
			return 1;
		end
	end
end

function ontalk1912_668(npc,event,player)
	local n1 = 0;
	local num_item = 0;
	local itemid = 0;
	for i=1,18 do
		 itemid = Itemtable[3][i];
		 num_item = player:package_item(itemid);
		if num_item >= 1 then
			n1 = n1 + num_item;
		end
		if n1 >= Itemtable[3][19] then
			return 1;
		end
	end
end

function ontalk1912_669(npc,event,player)
	local n1 = 0;
	local num_item = 0;
	local itemid = 0;
	for i=1,18 do
		 itemid = Itemtable[4][i];
		 num_item = player:package_item(itemid);
		if num_item >= 1 then
			n1 = n1 + num_item;
		end
		if n1 >= Itemtable[4][19] then
			return 1;
		end
	end
end

function ontalk1912_670(npc,event,player)
	local n1 = 0;
	local num_item = 0;
	local itemid = 0;
	for i=1,18 do
		 itemid = Itemtable[5][i];
		 num_item = player:package_item(itemid);
		if num_item >= 1 then
			n1 = n1 + num_item;
		end
		if n1 >= Itemtable[5][19] then
			return 1;
		end
	end
end

function CreatureNpcFun1912(npc,event,player,funid)
	local Npc1912Funid = {
	[1] = ontalk1912_1,
	[2] = ontalk1912_2,
	[3] = ontalk1912_3,
	[4] = ontalk1912_4,
	[5] = ontalk1912_5,
	[6] = ontalk1912_6,
	[7] = ontalk1912_7,
	[8] = ontalk1912_8,
	[9] = ontalk1912_9,
	[10] = ontalk1912_10,
	[11] = ontalk1912_11,
	[12] = ontalk1912_12,
	[13] = ontalk1912_13,
	[14] = ontalk1912_14,
	[15] = ontalk1912_15,
	[16] = ontalk1912_16,
	[17] = ontalk1912_17,
	[31] = ontalk1912_31,
	[32] = ontalk1912_32,
	[33] = ontalk1912_33,
	[34] = ontalk1912_34,
	[35] = ontalk1912_35,
	[36] = ontalk1912_36,
	[37] = ontalk1912_37,
	[38] = ontalk1912_38,
	[39] = ontalk1912_39,
	[40] = ontalk1912_40,
	[41] = ontalk1912_41,
	[42] = ontalk1912_42,
	[43] = ontalk1912_43,
	[44] = ontalk1912_44,
	[45] = ontalk1912_45,
	[46] = ontalk1912_46,
	[47] = ontalk1912_47,
	[48] = ontalk1912_48,
	[49] = ontalk1912_49,
	[50] = ontalk1912_50,
	[51] = ontalk1912_51,
	[52] = ontalk1912_52,
	[53] = ontalk1912_53,
	[54] = ontalk1912_54,
	[55] = ontalk1912_55,
	[56] = ontalk1912_56,
	[57] = ontalk1912_57,
	[58] = ontalk1912_58,
	[59] = ontalk1912_59,
	[60] = ontalk1912_60,
	[131] = ontalk1912_131,
	[132] = ontalk1912_132,
	[133] = ontalk1912_133,
	[134] = ontalk1912_134,
	[135] = ontalk1912_135,
	[136] = ontalk1912_136,
	[137] = ontalk1912_137,
	[138] = ontalk1912_138,
	[139] = ontalk1912_139,
	[140] = ontalk1912_140,
	[141] = ontalk1912_141,
	[142] = ontalk1912_142,
	[143] = ontalk1912_143,
	[144] = ontalk1912_144,
	[145] = ontalk1912_145,
	[146] = ontalk1912_146,
	[147] = ontalk1912_147,
	[148] = ontalk1912_148,
	[149] = ontalk1912_149,
	[150] = ontalk1912_150,
	[151] = ontalk1912_151,
	[152] = ontalk1912_152,
	[153] = ontalk1912_153,
	[154] = ontalk1912_154,
	[155] = ontalk1912_155,
	[156] = ontalk1912_156,
	[157] = ontalk1912_157,
	[158] = ontalk1912_158,
	[159] = ontalk1912_159,
	[160] = ontalk1912_160,
	[231] = ontalk1912_231,
	[232] = ontalk1912_232,
	[233] = ontalk1912_233,
	[234] = ontalk1912_234,
	[235] = ontalk1912_235,
	[236] = ontalk1912_236,
	[237] = ontalk1912_237,
	[238] = ontalk1912_238,
	[239] = ontalk1912_239,
	[240] = ontalk1912_240,
	[241] = ontalk1912_241,
	[242] = ontalk1912_242,
	[243] = ontalk1912_243,
	[244] = ontalk1912_244,
	[245] = ontalk1912_245,
	[246] = ontalk1912_246,
	[247] = ontalk1912_247,
	[248] = ontalk1912_248,
	[249] = ontalk1912_249,
	[250] = ontalk1912_250,
	[251] = ontalk1912_251,
	[252] = ontalk1912_252,
	[253] = ontalk1912_253,
	[254] = ontalk1912_254,
	[255] = ontalk1912_255,
	[256] = ontalk1912_256,
	[257] = ontalk1912_257,
	[258] = ontalk1912_258,
	[259] = ontalk1912_259,
	[260] = ontalk1912_260,
	[261] = ontalk1912_261,
	[665] = ontalk1912_665
};
	if Npc1912Funid[funid] ~=  nil then
		Npc1912Funid[funid](npc,event,player);
		return;
	end
end

function ontalk1912_7(npc,event,player)
	local s1 = "6C6C6C";
	if ontalk1912_670(npc,0,player) == 1 then
		s1 = "21d119";
	end
	local job = player:get_job();
	local level = player:get_level();
	if level < 90 then
		player:alert(21,0,0,"对不起,您的级别不足90无法合成!")
		return;
	end
	local s2 = "合成需要金币：1000000";
	if player:get_gamemoney_bind() < 1000000 then
		s2 = "<font color='#ff0000'>合成需要金币：1000000(金币不足!)</font>";
	end
	if job == 1 then
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
作为一名战士，要时刻保持武器的锋利。
#&task_content#&

#&talk_line#&

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,55|40021'>90级头盔</a></u> <u><a href='event:M2402,55'>合成</a></u></font>

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,56|50021'>90级戒指</a></u> <u><a href='event:M2402,56'>合成</a></u></font>

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,57|60021'>90级手镯</a></u> <u><a href='event:M2402,57'>合成</a></u></font>

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,58|70021'>90级项链</a></u> <u><a href='event:M2402,58'>合成</a></u></font>

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,59|90021'>90级腰带</a></u> <u><a href='event:M2402,59'>合成</a></u></font>

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,60|100021'>90级靴子</a></u> <u><a href='event:M2402,60'>合成</a></u></font>
                
                ]]..s2..[[

                
                <u><a href='event:M2402,665'>返回</a></u>
  ]]);
	elseif job == 2 then
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
作为一名战士，要时刻保持武器的锋利。
#&task_content#&

#&talk_line#&

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,155|40022'>90级头盔</a></u> <u><a href='event:M2402,155'>合成</a></u></font>

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,156|50022'>90级戒指</a></u> <u><a href='event:M2402,156'>合成</a></u></font>

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,157|60022'>90级手镯</a></u> <u><a href='event:M2402,157'>合成</a></u></font>

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,158|70022'>90级项链</a></u> <u><a href='event:M2402,158'>合成</a></u></font>

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,159|90022'>90级腰带</a></u> <u><a href='event:M2402,159'>合成</a></u></font>

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,160|100022'>90级靴子</a></u> <u><a href='event:M2402,160'>合成</a></u></font>
                
                ]]..s2..[[

                
                <u><a href='event:M2402,665'>返回</a></u>
  ]]);
	elseif job == 3 then
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
作为一名战士，要时刻保持武器的锋利。
#&task_content#&

#&talk_line#&

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,255|40023'>90级头盔</a></u> <u><a href='event:M2402,255'>合成</a></u></font>

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,256|50023'>90级戒指</a></u> <u><a href='event:M2402,256'>合成</a></u></font>

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,257|60023'>90级手镯</a></u> <u><a href='event:M2402,257'>合成</a></u></font>

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,258|70023'>90级项链</a></u> <u><a href='event:M2402,258'>合成</a></u></font>

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,259|90023'>90级腰带</a></u> <u><a href='event:M2402,259'>合成</a></u></font>

                <font color='#]]..s1..[['>任意85级首饰 * 3 = <u><a href='event:M2402,260|100023'>90级靴子</a></u> <u><a href='event:M2402,260'>合成</a></u></font>
                
                ]]..s2..[[

                
                <u><a href='event:M2402,665'>返回</a></u>
  ]]);
	end
end

function ontalk1912_55(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,40018);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_56(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,50018);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_57(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,60018);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_58(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,70018);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_59(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,90018);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_60(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,100018);
	ontalk1912_3333(npc,0,player,0)
end


function ontalk1912_155(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,40019);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_156(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,50019);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_157(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,60019);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_158(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,70019);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_159(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,90019);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_160(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,100019);
	ontalk1912_3333(npc,0,player,0)
end


function ontalk1912_255(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,40020);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_256(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,50020);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_257(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,60020);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_258(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,70020);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_259(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,90020);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_260(npc,event,player)
	player:set_param(460,5);
	player:set_param(449,100020);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_6(npc,event,player)
	local s1 = "6C6C6C";
	if ontalk1912_669(npc,0,player) == 1 then
		s1 = "21d119";
	end
	local level = player:get_level();
	if level < 85 then
		player:alert(21,0,0,"对不起,您的级别不足85无法合成!")
		return;
	end
	local s2 = "合成需要金币：750000";
	if player:get_gamemoney_bind() < 750000 then
		s2 = "<font color='#ff0000'>合成需要金币：750000(金币不足!)</font>";
	end
	local job = player:get_job();
	if job == 1 then
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
作为一名战士，要时刻保持武器的锋利。
#&task_content#&

#&talk_line#&

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,49|40018'>85级头盔</a></u> <u><a href='event:M2402,49'>合成</a></u></font>

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,50|50018'>85级戒指</a></u> <u><a href='event:M2402,50'>合成</a></u></font>

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,51|60018'>85级手镯</a></u> <u><a href='event:M2402,51'>合成</a></u></font>

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,52|70018'>85级项链</a></u> <u><a href='event:M2402,52'>合成</a></u></font>

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,53|90018'>85级腰带</a></u> <u><a href='event:M2402,53'>合成</a></u></font>

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,54|100018'>85级靴子</a></u> <u><a href='event:M2402,54'>合成</a></u></font>
                
                ]]..s2..[[

                
                <u><a href='event:M2402,665'>返回</a></u>
  ]]);
	elseif job == 2 then
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
作为一名战士，要时刻保持武器的锋利。
#&task_content#&

#&talk_line#&

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,149|40019'>85级头盔</a></u> <u><a href='event:M2402,149'>合成</a></u></font>

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,150|50019'>85级戒指</a></u> <u><a href='event:M2402,150'>合成</a></u></font>

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,151|60019'>85级手镯</a></u> <u><a href='event:M2402,151'>合成</a></u></font>

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,152|70019'>85级项链</a></u> <u><a href='event:M2402,152'>合成</a></u></font>

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,153|90019'>85级腰带</a></u> <u><a href='event:M2402,153'>合成</a></u></font>

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,154|100019'>85级靴子</a></u> <u><a href='event:M2402,154'>合成</a></u></font>
                
                ]]..s2..[[
                
                
                <u><a href='event:M2402,665'>返回</a></u>
  ]]);
	elseif job == 3 then
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
作为一名战士，要时刻保持武器的锋利。
#&task_content#&

#&talk_line#&

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,249|40020'>85级头盔</a></u> <u><a href='event:M2402,249'>合成</a></u></font>

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,250|50020'>85级戒指</a></u> <u><a href='event:M2402,250'>合成</a></u></font>

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,251|60020'>85级手镯</a></u> <u><a href='event:M2402,251'>合成</a></u></font>

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,252|70020'>85级项链</a></u> <u><a href='event:M2402,252'>合成</a></u></font>

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,253|90020'>85级腰带</a></u> <u><a href='event:M2402,253'>合成</a></u></font>

                <font color='#]]..s1..[['>任意80级首饰 * 3 = <u><a href='event:M2402,254|100020'>85级靴子</a></u> <u><a href='event:M2402,254'>合成</a></u></font>
                
                ]]..s2..[[
                
                
                <u><a href='event:M2402,665'>返回</a></u>
  ]]);
	end
end

function ontalk1912_49(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,40015);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_50(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,50015);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_51(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,60015);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_52(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,70015);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_53(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,90015);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_54(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,100015);
	ontalk1912_3333(npc,0,player,0)
end


function ontalk1912_149(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,40016);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_150(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,50016);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_151(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,60016);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_152(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,70016);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_153(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,90016);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_154(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,100016);
	ontalk1912_3333(npc,0,player,0)
end


function ontalk1912_249(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,40017);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_250(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,50017);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_251(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,60017);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_252(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,70017);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_253(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,90017);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_254(npc,event,player)
	player:set_param(460,4);
	player:set_param(449,100017);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_5(npc,event,player)
	local s1 = "6C6C6C";
	if ontalk1912_668(npc,0,player) == 1 then
		s1 = "21d119";
	end
	local level = player:get_level();
	if level < 80 then
		player:alert(21,0,0,"对不起,您的级别不足80无法合成!")
		return;
	end
	local s2 = "合成需要金币：500000";
	if player:get_gamemoney_bind() < 500000 then
		s2 = "<font color='#ff0000'>合成需要金币：500000(金币不足!)</font>";
	end
	local job = player:get_job();
	if job == 1 then
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
作为一名战士，要时刻保持武器的锋利。
#&task_content#&

#&talk_line#&

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,43|40015'>80级头盔</a></u> <u><a href='event:M2402,43'>合成</a></u></font>

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,44|50015'>80级戒指</a></u> <u><a href='event:M2402,44'>合成</a></u></font>

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,45|60015'>80级手镯</a></u> <u><a href='event:M2402,45'>合成</a></u></font>

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,46|70015'>80级项链</a></u> <u><a href='event:M2402,46'>合成</a></u></font>

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,47|90015'>80级腰带</a></u> <u><a href='event:M2402,47'>合成</a></u></font>

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,48|100015'>80级靴子</a></u> <u><a href='event:M2402,48'>合成</a></u></font>
                
                ]]..s2..[[

                
                <u><a href='event:M2402,665'>返回</a></u>
  ]]);
	elseif job == 2 then
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
作为一名战士，要时刻保持武器的锋利。
#&task_content#&

#&talk_line#&

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,143|40016'>80级头盔</a></u> <u><a href='event:M2402,143'>合成</a></u></font>

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,144|50016'>80级戒指</a></u> <u><a href='event:M2402,144'>合成</a></u></font>

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,145|60016'>80级手镯</a></u> <u><a href='event:M2402,145'>合成</a></u></font>

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,146|70016'>80级项链</a></u> <u><a href='event:M2402,146'>合成</a></u></font>

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,147|90016'>80级腰带</a></u> <u><a href='event:M2402,147'>合成</a></u></font>

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,148|100016'>80级靴子</a></u> <u><a href='event:M2402,148'>合成</a></u></font>
                
                ]]..s2..[[
                
                
                <u><a href='event:M2402,665'>返回</a></u>
  ]]);
	elseif job == 3 then
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
作为一名战士，要时刻保持武器的锋利。
#&task_content#&

#&talk_line#&

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,243|40017'>80级头盔</a></u> <u><a href='event:M2402,243'>合成</a></u></font>

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,244|50017'>80级戒指</a></u> <u><a href='event:M2402,244'>合成</a></u></font>

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,245|60017'>80级手镯</a></u> <u><a href='event:M2402,245'>合成</a></u></font>

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,246|70017'>80级项链</a></u> <u><a href='event:M2402,246'>合成</a></u></font>

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,247|90017'>80级腰带</a></u> <u><a href='event:M2402,247'>合成</a></u></font>

                <font color='#]]..s1..[['>任意75级首饰 * 3 = <u><a href='event:M2402,248|100017'>80级靴子</a></u> <u><a href='event:M2402,248'>合成</a></u></font>
                
                ]]..s2..[[
                
                
                <u><a href='event:M2402,665'>返回</a></u>
  ]]);
	end
end

function ontalk1912_43(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,40012);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_44(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,50012);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_45(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,60012);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_46(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,70012);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_47(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,90012);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_48(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,100012);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_143(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,40013);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_144(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,50013);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_145(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,60013);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_146(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,70013);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_147(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,90013);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_148(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,100013);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_243(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,40014);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_244(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,50014);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_245(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,60014);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_246(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,70014);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_247(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,90014);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_248(npc,event,player)
	player:set_param(460,3);
	player:set_param(449,100014);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_4(npc,event,player)
	local s1 = "6C6C6C";
	if ontalk1912_667(npc,0,player) == 1 then
		s1 = "21d119";
	end
	local level = player:get_level();
	if level < 70 then
		player:alert(21,0,0,"对不起,您的级别不足70无法合成!")
		return;
	end
	local s2 = "合成需要金币：200000";
	if player:get_gamemoney_bind() < 200000 then
		s2 = "<font color='#ff0000'>合成需要金币：200000(金币不足!)</font>";
	end
	local job = player:get_job();
	if job == 1 then
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
作为一名战士，要时刻保持武器的锋利。
#&task_content#&

#&talk_line#&

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,37|40012'>75级头盔</a></u> <u><a href='event:M2402,37'>合成</a></u></font>

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,38|50012'>75级戒指</a></u> <u><a href='event:M2402,38'>合成</a></u></font>

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,39|60012'>75级手镯</a></u> <u><a href='event:M2402,39'>合成</a></u></font>

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,40|70012'>75级项链</a></u> <u><a href='event:M2402,40'>合成</a></u></font>

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,41|90012'>75级腰带</a></u> <u><a href='event:M2402,41'>合成</a></u></font>

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,42|100012'>75级靴子</a></u> <u><a href='event:M2402,42'>合成</a></u></font>
                
                ]]..s2..[[

                
                <u><a href='event:M2402,665'>返回</a></u>
  ]]);
	elseif job == 2 then
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
作为一名战士，要时刻保持武器的锋利。
#&task_content#&

#&talk_line#&

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,137|40013'>75级头盔</a></u> <u><a href='event:M2402,137'>合成</a></u></font>

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,138|50013'>75级戒指</a></u> <u><a href='event:M2402,138'>合成</a></u></font>

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,139|60013'>75级手镯</a></u> <u><a href='event:M2402,139'>合成</a></u></font>

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,140|70013'>75级项链</a></u> <u><a href='event:M2402,140'>合成</a></u></font>

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,141|90013'>75级腰带</a></u> <u><a href='event:M2402,141'>合成</a></u></font>

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,142|100013'>75级靴子</a></u> <u><a href='event:M2402,142'>合成</a></u></font>
                
                ]]..s2..[[
                
                
                <u><a href='event:M2402,665'>返回</a></u>
  ]]);
	elseif job == 3 then
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
作为一名战士，要时刻保持武器的锋利。
#&task_content#&

#&talk_line#&

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,237|40014'>75级头盔</a></u> <u><a href='event:M2402,237'>合成</a></u></font>

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,238|50014'>75级戒指</a></u> <u><a href='event:M2402,238'>合成</a></u></font>

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,239|60014'>75级手镯</a></u> <u><a href='event:M2402,239'>合成</a></u></font>

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,240|70014'>75级项链</a></u> <u><a href='event:M2402,240'>合成</a></u></font>

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,241|90014'>75级腰带</a></u> <u><a href='event:M2402,241'>合成</a></u></font>

                <font color='#]]..s1..[['>任意70级首饰 * 3 = <u><a href='event:M2402,242|100014'>75级靴子</a></u> <u><a href='event:M2402,242'>合成</a></u></font>
                
                ]]..s2..[[
                
                
                <u><a href='event:M2402,665'>返回</a></u>
  ]]);
	end
end

function ontalk1912_37(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,40009);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_38(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,50009);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_39(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,60009);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_40(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,70009);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_41(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,90009);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_42(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,100009);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_137(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,40010);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_138(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,50010);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_139(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,60010);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_140(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,70010);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_141(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,90010);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_142(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,100010);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_237(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,40011);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_238(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,50011);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_239(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,60011);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_240(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,70011);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_241(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,90011);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_242(npc,event,player)
	player:set_param(460,2);
	player:set_param(449,100011);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_3(npc,event,player)
	local s1 = "6C6C6C";
	if ontalk1912_666(npc,0,player) == 1 then
		s1 = "21d119";
	end
	local level = player:get_level();
	if level < 60 then
		player:alert(21,0,0,"对不起,您的级别不足60无法合成!")
		return;
	end
	local s2 = "合成需要金币：100000";
	if player:get_gamemoney_bind() < 100000 then
		s2 = "<font color='#ff0000'>合成需要金币：100000(金币不足!)</font>";
	end
	local job = player:get_job();
	if job == 1 then
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
作为一名战士，要时刻保持武器的锋利。
#&task_content#&

#&talk_line#&

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,31|40009'>70级头盔</a></u> <u><a href='event:M2402,31'>合成</a></u></font>

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,32|50009'>70级戒指</a></u> <u><a href='event:M2402,32'>合成</a></u></font>

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,33|60009'>70级手镯</a></u> <u><a href='event:M2402,33'>合成</a></u></font>

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,34|70009'>70级项链</a></u> <u><a href='event:M2402,34'>合成</a></u></font>

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,35|90009'>70级腰带</a></u> <u><a href='event:M2402,35'>合成</a></u></font>

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,36|100009'>70级靴子</a></u> <u><a href='event:M2402,36'>合成</a></u></font>

                ]]..s2..[[
                

                <u><a href='event:M2402,665'>返回</a></u>
  ]]);
	elseif job == 2 then
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
作为一名战士，要时刻保持武器的锋利。
#&task_content#&

#&talk_line#&

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,131|40010'>70级头盔</a></u> <u><a href='event:M2402,131'>合成</a></u></font>

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,132|50010'>70级戒指</a></u> <u><a href='event:M2402,132'>合成</a></u></font>

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,133|60010'>70级手镯</a></u> <u><a href='event:M2402,133'>合成</a></u></font>

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,134|70010'>70级项链</a></u> <u><a href='event:M2402,134'>合成</a></u></font>

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,135|90010'>70级腰带</a></u> <u><a href='event:M2402,135'>合成</a></u></font>

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,136|100010'>70级靴子</a></u> <u><a href='event:M2402,136'>合成</a></u></font>
                
                ]]..s2..[[
                
                
                <u><a href='event:M2402,665'>返回</a></u>
  ]]);
	elseif job == 3 then
	player:echo(0,npc:GetLowGUID(),[[
#&task_describe#&
作为一名战士，要时刻保持武器的锋利。
#&task_content#&

#&talk_line#&

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,231|40011'>70级头盔</a></u> <u><a href='event:M2402,231'>合成</a></u></font>

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,232|50011'>70级戒指</a></u> <u><a href='event:M2402,232'>合成</a></u></font>

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,233|60011'>70级手镯</a></u> <u><a href='event:M2402,233'>合成</a></u></font>

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,234|70011'>70级项链</a></u> <u><a href='event:M2402,234'>合成</a></u></font>

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,235|90011'>70级腰带</a></u> <u><a href='event:M2402,235'>合成</a></u></font>

                <font color='#]]..s1..[['>任意60级首饰 * 9 = <u><a href='event:M2402,236|100011'>70级靴子</a></u> <u><a href='event:M2402,236'>合成</a></u></font>

                ]]..s2..[[
                

                <u><a href='event:M2402,665'>返回</a></u>
  ]]);
	end
end

function ontalk1912_31(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,40006);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_32(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,50006);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_33(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,60006);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_34(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,70006);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_35(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,90006);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_36(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,100006);
	ontalk1912_3333(npc,0,player,0)
end


function ontalk1912_131(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,40007);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_132(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,50007);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_133(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,60007);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_134(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,70007);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_135(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,90007);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_136(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,100007);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_231(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,40008);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_232(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,50008);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_233(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,60008);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_234(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,70008);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_235(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,90008);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_236(npc,event,player)
	player:set_param(460,1);
	player:set_param(449,100008);
	ontalk1912_3333(npc,0,player,0)
end

function ontalk1912_3333(npc,event,player)
	local item = 0;
	local itemb = Itemtable[player:get_param(460)][19];
	local obja = {0,0,0,0,0,0,0,0,0};
	local objb = {0,0,0,0,0,0,0,0,0};
	for i = 1,18 do
		local itemid = Itemtable[player:get_param(460)][i];
		local num_item = player:package_item(itemid);
		if num_item >= 1 then
			for i = 1,9 do
                if obja[i] == 0 then
                	if itemb >= num_item then
                		itemb = itemb - num_item;
                		obja[i] = num_item;
                		item = item + num_item;
                	else
                		obja[i] = itemb;
                		item = item + itemb;
                		itemb = 0;
                	end
                	objb[i] = itemid;
                	break
                end
			end
			if item >= Itemtable[player:get_param(460)][19] then
                if player:get_gamemoney_bind() >= Itemtable[player:get_param(460)][20] then
                	player:sub_gamemoney_bind(Itemtable[player:get_param(460)][20]);
                	for i = 1,9 do
                		if obja[i] >= 1 then
                			player:remove_item(objb[i],obja[i],0);
                		end
                	end
                	player:add_item(player:get_param(449) + 3,1,0,0,0);
					g_broadcast(14,0,0,"<font color='#28ff28'>["..player:GetName().."]</font>通过合成获得了<font color='#28ff28'>["..g_get_item_name(player:get_param(449) + 3).."]</font>!");

                	break
                else
                	player:alert(21,0,0,"对不起,您的金币不足"..Itemtable[player:get_param(460)][20].."合成失败!")
                	break;
                end
			end
		end
	end
	if item < Itemtable[player:get_param(460)][19] then
		player:alert(21,0,0,"对不起,材料不足合成失败")
	end
	local param460 = player:get_param(460);
	if param460 == 1 then
		ontalk1912_3(npc,0,player,0);
	elseif param460 == 2 then
		ontalk1912_4(npc,0,player,0);
	elseif param460 == 3 then
		ontalk1912_5(npc,0,player,0);
	elseif param460 == 4 then
		ontalk1912_6(npc,0,player,0);
	elseif param460 == 5 then
		ontalk1912_7(npc,0,player,0);
	end
	player:set_param(460,0);
	player:set_param(449,0);
end

function CreatureNpcSceneNpcStatus1912(npc,event,player,npcid)
	if npcid == 1203 then
		if player:get_task_state(3) == 66 then
			player:show_npc_flags(npcid,1);
		else
			player:show_npc_flags(npcid,0);
		end
	end
end
