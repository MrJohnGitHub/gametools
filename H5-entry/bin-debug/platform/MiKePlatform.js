var __reflect = (this && this.__reflect) || function (p, c, t) {
    p.__class__ = c, t ? t.push(c) : t = [c], p.__types__ = p.__types__ ? t.concat(p.__types__) : t;
};
var __extends = this && this.__extends || function __extends(t, e) { 
 function r() { 
 this.constructor = t;
}
for (var i in e) e.hasOwnProperty(i) && (t[i] = e[i]);
r.prototype = e.prototype, t.prototype = new r();
};
/**
 * Created by John on 2019/5/13.
 */
var MiKePlatform = (function (_super) {
    __extends(MiKePlatform, _super);
    function MiKePlatform() {
        return _super.call(this) || this;
    }
    Object.defineProperty(MiKePlatform.prototype, "account", {
        get: function () {
            return this.channelName + "-" + this.userID;
        },
        enumerable: true,
        configurable: true
    });
    MiKePlatform.prototype.init = function () {
        return new Promise(function (resolve, reject) {
            window.SDKjh.showInit(function (data) {
                if (+data.status == 0) {
                    resolve();
                }
                else {
                    reject("聚合SDK初始化失败");
                }
            });
        });
    };
    MiKePlatform.prototype.login = function () {
        var _this = this;
        return new Promise(function (resolve, reject) {
            window.SDKjh.showLoginView(function (data) {
                if (+data.status == 0) {
                    _this.userID = data.userId;
                    _this.token = data.accessToken;
                    _this.channelName = data.channelName;
                    _this.channelUID = data.channelUid;
                    resolve();
                }
                else {
                    reject("聚合SDK登录失败");
                }
            });
        });
    };
    MiKePlatform.prototype.getChannelID = function () {
        return this.channelName + "_" + this.channelUID;
    };
    return MiKePlatform;
}(SimplePlatform));
__reflect(MiKePlatform.prototype, "MiKePlatform");
//# sourceMappingURL=MiKePlatform.js.map