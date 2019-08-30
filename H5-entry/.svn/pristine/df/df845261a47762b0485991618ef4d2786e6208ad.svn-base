var __reflect = (this && this.__reflect) || function (p, c, t) {
    p.__class__ = c, t ? t.push(c) : t = [c], p.__types__ = p.__types__ ? t.concat(p.__types__) : t;
};
/**
 * Created by John on 2019/5/10.
 */
var LocationParam = (function () {
    function LocationParam() {
    }
    LocationParam.parseLocation = function () {
        var href = window.location.href;
        var index = href.indexOf("?");
        var search = href.substr(index + 1); //取得所有参数   stringvar.substr(start [, length ]
        var param = {};
        var arr = search.split("&"); //各个参数放到数组里
        for (var i = 0; i < arr.length; i++) {
            var eqIndex = arr[i].indexOf("=");
            if (eqIndex > 0) {
                var key = arr[i].substring(0, eqIndex);
                var value = arr[i].substr(eqIndex + 1);
                param[key] = value;
            }
        }
        this.param = param;
        this._isHttps = window.location.protocol.indexOf("https:") >= 0;
    };
    LocationParam.isHttps = function () {
        return this._isHttps;
    };
    /**
     * 获取指定参数值
     * @param key
     */
    LocationParam.getValue = function (key) {
        return this.param[key];
    };
    LocationParam.getProtocol = function () {
        return window.location.protocol + "//";
    };
    return LocationParam;
}());
__reflect(LocationParam.prototype, "LocationParam");
//# sourceMappingURL=LocationParam.js.map