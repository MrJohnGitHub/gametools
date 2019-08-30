/**
 * Created by John on 2019/5/13.
 */
class RequestUtils {

    public static sendSimpleReq(url: string, param?: any, responseType = egret.HttpResponseType.TEXT): Promise<any> {
        return new Promise<any>((resolve, reject) => {
            let req = new egret.HttpRequest();
            req.responseType = responseType;
            let respHandler = (evt: egret.Event) => {
                switch (evt.type) {
                    case egret.Event.COMPLETE:
                        resolve(req.response);
                        break;
                    case egret.IOErrorEvent.IO_ERROR:
                        reject(`加载失败：${url}`);
                        break;
                }
            };
            req.once(egret.Event.COMPLETE, respHandler, this);
            req.once(egret.IOErrorEvent.IO_ERROR, respHandler, this);
            if (param) {
                let searchStr = this.param2ReqSearchStr(param);
                url += `?${searchStr}`
            }
            req.open(`${LocationParam.getProtocol()}${url}`, egret.HttpMethod.GET);
            req.send();
        });
    }

    public static param2ReqSearchStr(param: any) {
        let keys = Object.keys(param);
        let str = "";
        for (let i = 0; i < keys.length; i++) {
            let key = keys[i];
            if (i > 0) str += "&";
            let value = param[key];
            str += `${key}=${value}`;
        }
        return str;
    }
}
