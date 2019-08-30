var __reflect = (this && this.__reflect) || function (p, c, t) {
    p.__class__ = c, t ? t.push(c) : t = [c], p.__types__ = p.__types__ ? t.concat(p.__types__) : t;
};
/**
 * Created by John on 2019/5/13.
 */
var RequestUtils = (function () {
    function RequestUtils() {
    }
    RequestUtils.sendSimpleReq = function (url, param, responseType) {
        var _this = this;
        if (responseType === void 0) { responseType = egret.HttpResponseType.TEXT; }
        return new Promise(function (resolve, reject) {
            var req = new egret.HttpRequest();
            req.responseType = responseType;
            var respHandler = function (evt) {
                switch (evt.type) {
                    case egret.Event.COMPLETE:
                        resolve(req.response);
                        break;
                    case egret.IOErrorEvent.IO_ERROR:
                        reject("\u52A0\u8F7D\u5931\u8D25\uFF1A" + url);
                        break;
                }
            };
            req.once(egret.Event.COMPLETE, respHandler, _this);
            req.once(egret.IOErrorEvent.IO_ERROR, respHandler, _this);
            if (param) {
                var searchStr = _this.param2ReqSearchStr(param);
                url += "?" + searchStr;
            }
            req.open("" + LocationParam.getProtocol() + url, egret.HttpMethod.GET);
            req.send();
        });
    };
    RequestUtils.param2ReqSearchStr = function (param) {
        var keys = Object.keys(param);
        var str = "";
        for (var i = 0; i < keys.length; i++) {
            var key = keys[i];
            if (i > 0)
                str += "&";
            var value = param[key];
            str += key + "=" + value;
        }
        return str;
    };
    return RequestUtils;
}());
__reflect(RequestUtils.prototype, "RequestUtils");
//# sourceMappingURL=RequestUtils.js.map