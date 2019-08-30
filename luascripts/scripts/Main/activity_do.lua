require("scripts.Activities.activity_include")
require("scripts.lua.json4_include")
RegisterServerHook(42,"OnSendActivityList")
RegisterServerHook(43,"OnSendActivityDetail")
RegisterServerHook(104,"OnSendNewFbDetail")
RegisterServerHook(105,"OnSendSyzfReward")
RegisterServerHook(106,"OnSendQxzbReward");
RegisterServerHook(107,"OnSendCityKnifeReward")
RegisterServerHook(118,"OnHandlerLottery")
RegisterServerHook(119,"OnGetLotteryKeepDay")
RegisterServerHook(120,"OnCheckCanGetGiftById")
RegisterServerHook(121,"OnSendLevelGift")
RegisterServerHook(122,"OnGetLevelGiftId")
RegisterServerHook(123,"OnEnterQxzb")
RegisterServerHook(125,"OnGetPoolInitCount")

RegisterServerHook(129,"HandleReqOpenSerActInfo")
RegisterServerHook(130,"ReqGetOpenSerActAward")

RegisterServerHook(131,"NotifyCanGetOpenSerActAwardWithoutKeepPay")

RegisterServerHook(133,"OnHandlerGetActRankInfo")
RegisterServerHook(134,"OnActivityOverSendAward")
RegisterServerHook(135,"CheckCanInActRank")

RegisterServerHook(136,"HandleReqGetCloseBetaActInfo")
RegisterServerHook(137,"HandleReqGetCloseBetaActAward")


RegisterServerHook(142,"HandlerBuyInvestmentPlan")
RegisterServerHook(143,"HandlerGetInvestmentPlanAward")
RegisterServerHook(144,"HandlerGetInvestmentPlanInfo")
RegisterServerHook(145,"HandlerGetFanTianGifState")

RegisterServerHook(146, "CheckIsCloseBeta")
RegisterServerHook(147, "HandlerRequestRebateInfo")
RegisterServerHook(148, "RebateGold")


--
RegisterServerHook(149, "ReqSealMagicBoxInfo")
RegisterServerHook(150, "ReqGetSealMagicBox")
RegisterServerHook(151, "ReqRefreshSealMagicBox")
RegisterServerHook(152, "ReqOpenSealMagicBox")
RegisterServerHook(153, "ReqBuySealMagicBoxTime")
RegisterServerHook(154, "ReqCanShowSealMagicBoxIcon")
RegisterServerHook(155, "ReqGetMagicBoxAward")
RegisterServerHook(156, "AddMagicCount")

RegisterServerHook(158, "ReqFristPayRebateBoxInfo")
RegisterServerHook(159, "ReqBuyFristPayRebateBoxAward")

RegisterServerHook(163, "GetPlayerRealRank")
RegisterServerHook(164, "MailSendPayRankAward")

RegisterServerHook(165, "NotifyInvestmentPlanHasAward")

RegisterServerHook(166, "CheckActIsOver")
RegisterServerHook(167, "DigInfo")
RegisterServerHook(169, "ReqCompleteMagicBox")

RegisterServerHook(174, "HandleReqGetYzwcAward")
RegisterServerHook(175, "YzwcOverMailSendJoinDurationAward")
RegisterServerHook(176, "YzwcOverMailSendKillAward")
RegisterServerHook(177, "YzwcOverMailSendRankAward")

RegisterServerHook(179, "HandleReqPayAwardInfo")
RegisterServerHook(180, "HandleReqGetPayAward")
RegisterServerHook(181, "HandleReqSinglePayInfo")
RegisterServerHook(182, "HandleReqGetSinglePayAward")
RegisterServerHook(183, "HandleReqPayActivityIconStatus")

RegisterServerHook(195, "ReqActivityInfo")
RegisterServerHook(193, "ReqGetActivityAward")
RegisterServerHook(194, "CheckConsumeActivityIsOpen")
RegisterServerHook(196, "CheckOneActivityIsOpen")
RegisterServerHook(197, "GiftBuy")
RegisterServerHook(198, "GiftLimitBuy")

RegisterServerHook(199, "HandlerReqActivityInfo")
RegisterServerHook(200, "HandlerReqGetActivityAwardByIndex")
RegisterServerHook(201, "HandlerGatherOpenActivityInfo")

RegisterServerHook(202, "getConsumeActivityRealRank")
RegisterServerHook(203, "MailSendConsumeRankAward")
RegisterServerHook(204, "MailSendNewPayRankAward")
RegisterServerHook(205, "getNewPayActivityRealRank")

RegisterServerHook(206, "getSoulBeadActivityRealRank")
RegisterServerHook(207, "MailSendSoulBeadAward")
RegisterServerHook(208, "DuringActivityAddSoulBeadScore")
RegisterServerHook(209, "AddGoldRetActivityParamCount")


RegisterServerHook(214, "GetOperActivitiRealRankByActID")
RegisterServerHook(215, "MailSendGemScoreCompAward")
RegisterServerHook(216, "MailSendBossScoreCompAward")
RegisterServerHook(217, "DuringActivityAddGemScoreCompScore")
RegisterServerHook(218, "DuringActivityAddBossScoreCompScore")

RegisterServerHook(219, "HandlerConsumeDialLottery")
RegisterServerHook(220, "CheckConsumeDialIsOpen")
