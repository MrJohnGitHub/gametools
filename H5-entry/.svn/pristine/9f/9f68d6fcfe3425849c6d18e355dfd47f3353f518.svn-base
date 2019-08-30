var __reflect = (this && this.__reflect) || function (p, c, t) {
    p.__class__ = c, t ? t.push(c) : t = [c], p.__types__ = p.__types__ ? t.concat(p.__types__) : t;
};
/**
 * Created by John on 2019/5/10.
 */
var App = (function () {
    function App() {
    }
    App.getYueWanDebugUrl = function () {
        var time = Date.now();
        var gameUrl = this.gameUrl;
        var key = this.signKey;
        var gameId = 1703;
        var encodeGameUrl = encodeURIComponent(gameUrl).toLowerCase();
        var sign = MD5.hex_md5("debug_url=" + encodeGameUrl + "&j_game_id=" + gameId + "&j_game_secret=" + key + "&time=" + time);
        return "http://japi.game-props.com/h5/entryPage?debug_url=" + gameUrl + "&j_game_id=" + gameId + "&time=" + time + "&sign=" + sign;
    };
    App.SceneManager = new SceneManager();
    App.gameUrl = "http://10.5.10.19:8200/H5-frontend/h5entry/client.html?plat_id=5001";
    App.signKey = "7ed3417b7a5103e5104738a040c2e0a0";
    return App;
}());
__reflect(App.prototype, "App");
//# sourceMappingURL=App.js.map