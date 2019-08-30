var __reflect = (this && this.__reflect) || function (p, c, t) {
    p.__class__ = c, t ? t.push(c) : t = [c], p.__types__ = p.__types__ ? t.concat(p.__types__) : t;
};
/**
 * create by lichujiong on 2018/6/6
 */
var BaseScene = (function () {
    /**
     * 构造函数
     */
    function BaseScene() {
        this.uiLayer = new eui.UILayer();
        this.uiLayer.percentHeight = 100;
        this.uiLayer.percentWidth = 100;
        this.uiLayer.touchEnabled = false;
    }
    /**
     * 进入Scene调用
     */
    BaseScene.prototype.onEnter = function () {
        var param = [];
        for (var _i = 0; _i < arguments.length; _i++) {
            param[_i] = arguments[_i];
        }
        this.getStage().addChild(this.uiLayer);
    };
    /**
     * 退出Scene调用
     */
    BaseScene.prototype.onExit = function () {
        this.getStage().removeChild(this.uiLayer);
    };
    BaseScene.prototype.getStage = function () {
        return egret.lifecycle.stage;
    };
    return BaseScene;
}());
__reflect(BaseScene.prototype, "BaseScene");
//# sourceMappingURL=BaseScene.js.map