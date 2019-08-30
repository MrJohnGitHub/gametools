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
 * Created by John on 2019/5/10.
 */
var PlatLoginView = (function (_super) {
    __extends(PlatLoginView, _super);
    function PlatLoginView() {
        var _this = _super.call(this) || this;
        _this.skinName = "LoginSceneSkin";
        return _this;
    }
    PlatLoginView.prototype.$onAddToStage = function (stage, nestLv) {
        _super.prototype.$onAddToStage.call(this, stage, nestLv);
        this.loginBtn.addEventListener(egret.TouchEvent.TOUCH_TAP, this.onTouchLogin, this);
        this.accountInput.text = egret.localStorage.getItem("debug_uid");
        this.accountInput.text = egret.localStorage.getItem("debug_token");
    };
    PlatLoginView.prototype.onTouchLogin = function () {
        if (!this.accountInput.text)
            return;
        window.platform.platID = 5000;
        window.platform.userID = this.accountInput.text;
        window.platform.token = this.pwdInput.text;
        egret.localStorage.setItem("debug_uid", window.platform.userID);
        egret.localStorage.setItem("debug_token", window.platform.token);
        App.SceneManager.runScene(SelectServerScene);
    };
    return PlatLoginView;
}(BaseSceneView));
__reflect(PlatLoginView.prototype, "PlatLoginView");
//# sourceMappingURL=PlatLoginView.js.map