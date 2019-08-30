/**
 * Created by John on 2019/5/16.
 */
class BackStageReqUtils {
    public static backStageConfigs: BackStageConfig[];

    private static _svrTime: number;
    private static _syncTime: number;
    static updateNowSvrTime(time: number) {
        this._svrTime = +time;
        this._syncTime = egret.getTimer();
    }

    static getNowSvrTime(): number {
        if(!this._svrTime) return Date.now() / 1000;
        return this._svrTime + (egret.getTimer() - this._syncTime) / 1000;
    }

    //加载后台配置数据
    static async loadBackStageConfig() {
        let param = {
            ptid: window.platform.platID,
            time: Date.now(),
            version: 0
        };
        try {
            let response = await this.sendBackStageReq(`${window.platform.backUrlAddr}/Server/gameconfig`, param);
            this.backStageConfigs = response.data;
        }
        catch (e) {
            console.error(e);
        }
    }

    static async sendUserLogin() {
        let url = `${this.backStageConfigs[0].apiUrl}/Login/userlogin`;
        let param = {
            ptid: window.platform.platID,
            zid: window.platform.svrID,
            account: window.platform.account
        }
        try {
            let response = await this.sendBackStageReq(`${url}`, param);
            this.backStageConfigs = response.data;
        }
        catch (e) {
            console.error(e);
        }
    }

    //后台请求参数转换
    static md5BackStageReqParam(param): string {
        let keys = Object.keys(param);
        keys.sort();
        let str = "";
        let md5Str = "";
        for (let i = 0; i < keys.length; i++) {
            let key = keys[i];
            if (i > 0) str += "&";
            let value = param[key];
            str += `${key}=${value}`;
        }
        md5Str = `${str}&key=${window.platform.backUrlKey}`;
        let sign = MD5.hex_md5(md5Str);
        str += `&sign=${sign}`;
        return str;
    }

    //发起后台请求
    static sendBackStageReq(url: string, param?: any): Promise<any> {
        return new Promise<any>((resolve, reject) => {
            let req = new egret.HttpRequest();
            req.responseType = egret.HttpResponseType.TEXT;
            let respHandler = (evt: egret.Event) => {
                switch (evt.type) {
                    case egret.Event.COMPLETE:
                        let data = JSON.parse(req.response);
                        resolve(data);
                        break;
                    case egret.IOErrorEvent.IO_ERROR:
                        console.log(`请求失败：${url}`);
                        reject(data);
                        break;
                }
            };
            req.once(egret.Event.COMPLETE, respHandler, this);
            req.once(egret.IOErrorEvent.IO_ERROR, respHandler, this);
            if (param) {
                let searchStr = this.md5BackStageReqParam(param);
                url += `?${searchStr}`
            }
            req.open(`${LocationParam.getProtocol()}${url}`, egret.HttpMethod.GET);
            req.send();
        })
    }

    static sendOpenReq() {
        let appid = 3;
        let ua = navigator.userAgent.toLowerCase();
        if(ua.indexOf("android") >= 0) {
            appid = 1;
        }
        else if(ua.indexOf("ios") >= 0 || ua.indexOf("ipad") >= 0) {
            appid = 2;
        }
        BackStageReqUtils.sendBackStageReq(BackStageReqUtils.getOpenAddr(), 
        {ptid: window.platform.platID, appid: appid, phonecode: MD5.hex_md5(ua), time: (Date.now()/1000) >> 0});
    }

    /**
     * 获取游戏客户端入口地址
     */
    static getGameClientAddr(): string {
        return `${this.backStageConfigs[0].resBaseUrl}`;
    }

    /**
     * 获取悦玩登录校验地址
     */
    static getYueWanLoginAddr(): string {
        return `${this.backStageConfigs[0].commurl}/YuewanLogin/login`;
    }

    /**
     * 获取后台公告地址
     */
    static getGongGaoAddr(): string {
        return `${this.backStageConfigs[0].apiUrl}/server/gonggao`;
    }

    /**
     * 获取最近登录信息
     */
    static getMySvrListAddr(): string {
        return `${this.backStageConfigs[0].apiUrl}/Newserver/selectzone`;
    }

    /**
     * 获取一页服务器信息
     */
    static getPageSvrListAddr(): string {
        return `${this.backStageConfigs[0].apiUrl}/Newserver/list`;
    }

    /**
     * 获取单个服务器的信息
     */
    static getSingleSvrInfoAddr(): string {
        return `${this.backStageConfigs[0].apiUrl}/Newserver/info`;
    }

    /**
     * 用户登录数据收集接口
     */
    static getLoginRecordAddr(): string {
        return `${this.backStageConfigs[0].apiUrl}/Login/userlogin`;
    }

    /**
     * 获取服务器时间
     */
    static getNowSvrTimeAddr(): string {
        return `${this.backStageConfigs[0].commurl}/Server/nowtime`;
    }

    /**
     * 激活数据收集接口地址
     */
    static getOpenAddr(): string {
        return `${this.backStageConfigs[0].apiUrl}/Open/addlog`;
    }
}


type BackStageConfig = {
    apiUrl: string;
    cdn2: string;
    cdnUrl: string;
    cdnnum: string;
    commurl: string;
    dataBaseUrl: string;
    resBaseUrl: string;
    zcdnnum: string;
}
