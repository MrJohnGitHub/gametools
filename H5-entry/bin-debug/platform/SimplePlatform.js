var __reflect = (this && this.__reflect) || function (p, c, t) {
    p.__class__ = c, t ? t.push(c) : t = [c], p.__types__ = p.__types__ ? t.concat(p.__types__) : t;
};
/**
 * Created by John on 2019/5/16.
 */
var SimplePlatform = (function () {
    function SimplePlatform() {
        this.userID = "";
        this.token = "";
        this.resRoot = "";
        this.svrName = "";
        this.svrID = "";
        this.wsLoginURL = "";
        this.wssLoginURL = "";
        this.wsGateURL = "";
        this.wssGateURL = "";
        this.svrIp = "";
        this.svrPort = 0;
        this.gateIp = "";
        this.gatePort = 0;
        this.initByLocation();
        this.initBackStage();
    }
    Object.defineProperty(SimplePlatform.prototype, "isDebug", {
        get: function () {
            return false;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(SimplePlatform.prototype, "account", {
        get: function () {
            return this.channelName + "-" + this.userID;
        },
        enumerable: true,
        configurable: true
    });
    SimplePlatform.prototype.initByLocation = function () {
        this.platID = +LocationParam.getValue("plat_id") || 0;
        this.userID = LocationParam.getValue("uid") || "";
        this.channel = LocationParam.getValue("channel") || "";
        this.channelUID = LocationParam.getValue("channelUid") || "";
        this.token = LocationParam.getValue("token") || "";
        this.resRoot = LocationParam.getValue("resurl") || "";
        this.svrID = LocationParam.getValue("sid") || "";
        this.svrName = LocationParam.getValue("sname") || "";
        this.wsLoginURL = LocationParam.getValue("wsurl") || "";
        this.wssLoginURL = LocationParam.getValue("wssurl") || "";
    };
    SimplePlatform.prototype.initBackStage = function () {
        this.backUrlAddr = "home.xh5.mikeyouxi.com";
        this.backUrlKey = "4c4776e8db27d196ae19ddbb60143488";
    };
    SimplePlatform.prototype.init = function () {
        return new Promise(function (resolve, reject) {
            resolve();
        });
    };
    SimplePlatform.prototype.login = function () {
        return new Promise(function (resolve, reject) {
            resolve();
        });
    };
    SimplePlatform.prototype.getLoginUrl = function () {
        if (LocationParam.isHttps()) {
            return "wss://" + this.wssLoginURL;
        }
        return "ws://" + this.wsLoginURL;
    };
    SimplePlatform.prototype.getGateUrl = function () {
        if (LocationParam.isHttps()) {
            return "wss://" + this.wssGateURL;
        }
        return "ws://" + this.wsGateURL;
    };
    //选服上报
    SimplePlatform.prototype.uploadSelectSvr = function (data) {
    };
    //创角上报
    SimplePlatform.prototype.uploadCreateRole = function (data) {
    };
    SimplePlatform.prototype.uploadEnterGame = function (data) {
    };
    //升级上报
    SimplePlatform.prototype.uploadLvUp = function (data) {
    };
    //退出游戏上报
    SimplePlatform.prototype.uploadExitGame = function (data) {
    };
    return SimplePlatform;
}());
__reflect(SimplePlatform.prototype, "SimplePlatform");
//# sourceMappingURL=SimplePlatform.js.map