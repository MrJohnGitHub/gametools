var __reflect = (this && this.__reflect) || function (p, c, t) {
    p.__class__ = c, t ? t.push(c) : t = [c], p.__types__ = p.__types__ ? t.concat(p.__types__) : t;
};
/**
 * create by lichujiong on 2018/6/6
 */
var SceneManager = (function () {
    /**
     * 构造函数
     */
    function SceneManager() {
    }
    /**
     * 清空处理
     */
    SceneManager.prototype.clear = function () {
        var nowScene = this._currScene;
        if (nowScene) {
            nowScene.onExit();
            this._currScene = null;
        }
    };
    /**
     * 切换场景
     * @param clazz 场景类名
     */
    SceneManager.prototype.runScene = function (clazz) {
        var param = [];
        for (var _i = 1; _i < arguments.length; _i++) {
            param[_i - 1] = arguments[_i];
        }
        var oldScene = this._currScene;
        if (oldScene) {
            if (oldScene instanceof clazz)
                return;
            oldScene.onExit();
        }
        this._currScene = new clazz();
        (_a = this._currScene).onEnter.apply(_a, param);
        var _a;
    };
    /**
     * 获取当前Scene
     * @returns {number}
     */
    SceneManager.prototype.getCurrScene = function () {
        return this._currScene;
    };
    return SceneManager;
}());
__reflect(SceneManager.prototype, "SceneManager");
//# sourceMappingURL=SceneManager.js.map