local talktb = {
	"倒计时结束马上跑，奖励全部要拿到手!",
	"先压压腿，待会跑起来才不会脚抽筋!",
	"奔跑吧兄弟！",
	"大哥，那家伙拿了宝箱！",
	"弄死丫的，把宝箱抢过来！",
	"来迟了来迟了，BOSS都被搞死了，赶紧抢宝箱！！",
	"都怪你啊，来参加活动还要先去做个发型？！",
	"螳螂捕蝉，黄雀在后，我来捡个漏。",
	"哎呀，活动要结束了...",
	"来不及了，今天先放过你！兄弟们，撤！",
	"哇塞！这么多人，要打哪个？",
	"集火那个拿宝箱的",
	"你们就这点战力？都散开，让我来！",
	"活动只剩一小会，赶紧杀人混点经验！"
};
function Map438_OnSpwanJiaRen(mgr,guid,talkdel,talktype)
	mgr:SendObjectTalk(guid,talkdel,talktb[talktype]);
	if talktype == 1 then
		mgr:SendObjectTalk(guid,13,talktb[3]);
	end
	if talktype == 2 then
		mgr:SendObjectTalk(guid,11,talktb[3]);
	end
end

function Map439_OnSpwanCreature(guid,entry,mgr)
	local entrytb = {{7001,4},{7002,5},{7003,6},{7004,7},{7005,8},{7006,9},{7007,10},{7008,11},{7009,12},{7010,13},{7011,14}};
	for i=1,#entrytb do
		if entrytb[i][1] == entry then
			mgr:SendObjectTalk(guid,1,talktb[entrytb[i][2]]);
			break;
		end
	end
end