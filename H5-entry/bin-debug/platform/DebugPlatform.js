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
 * Created by John on 2019/5/16.
 * 内网平台5000
 */
var DebugPlatform = (function (_super) {
    __extends(DebugPlatform, _super);
    function DebugPlatform() {
        return _super.call(this) || this;
    }
    DebugPlatform.prototype.initByLocation = function () {
        this.platID = PlatType.Debug;
    };
    DebugPlatform.prototype.initBackStage = function () {
        this.backUrlAddr = "10.5.70.4:8090";
        this.backUrlKey = "4c4776e8db27d196ae19ddbb60143488";
    };
    Object.defineProperty(DebugPlatform.prototype, "isDebug", {
        get: function () {
            return true;
        },
        enumerable: true,
        configurable: true
    });
    return DebugPlatform;
}(SimplePlatform));
__reflect(DebugPlatform.prototype, "DebugPlatform");
//# sourceMappingURL=DebugPlatform.js.map