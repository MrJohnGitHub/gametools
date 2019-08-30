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
var SelectServerScene = (function (_super) {
    __extends(SelectServerScene, _super);
    function SelectServerScene() {
        var _this = _super.call(this) || this;
        _this.selectServerView = new SelectServerView();
        _this.uiLayer.addChild(_this.selectServerView);
        return _this;
    }
    return SelectServerScene;
}(BaseScene));
__reflect(SelectServerScene.prototype, "SelectServerScene");
//# sourceMappingURL=SelectServerScene.js.map