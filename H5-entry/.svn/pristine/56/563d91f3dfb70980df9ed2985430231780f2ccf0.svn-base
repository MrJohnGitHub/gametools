/**
 * Created by John on 2019/5/16.
 */
class SimplePlatform {
    platID: number;
    userID: string = "";
    userName?: string;
    channel?: string;
    channelName?: string;
    channelUID: string;
    token: string = "";
    resRoot: string = "";
    svrName: string = "";
    svrID: string = "";
    wsLoginURL = "";
    wssLoginURL = "";
    wsGateURL = "";
    wssGateURL = "";
    svrIp: string = "";
    svrPort: number = 0;
    gateIp: string = "";
    gatePort: number = 0;
    time?: string;

    //后台地址
    backUrlAddr: string;
    //后台请求加密key
    backUrlKey: string;

    constructor() {
        this.initByLocation();
        this.initBackStage();
    }

    get isDebug(): boolean {
        return false;
    }
    
    public get account(): string {
        return `${this.channelName}-${this.userID}`;
    }

    initByLocation() {
        this.platID = +LocationParam.getValue("plat_id") || 0;
        this.userID = LocationParam.getValue("uid") || "";
        this.channel = LocationParam.getValue("channel") || "";
        this.channelUID = LocationParam.getValue("channelUid") || "";
        this.token = LocationParam.getValue("token") || "";
        this.resRoot = LocationParam.getValue("resurl") || "";
        this.svrID = LocationParam.getValue("sid") || "";
        this.svrName = LocationParam.getValue("sname") || "";
        this.wsLoginURL = LocationParam.getValue("wsurl") || "";
        this.wssLoginURL = LocationParam.getValue("wssurl") || "";
    }

    initBackStage() {
        this.backUrlAddr = "home.xh5.mikeyouxi.com";
        this.backUrlKey = "4c4776e8db27d196ae19ddbb60143488";
    }

    public init(): Promise<any> {
        return new Promise<any>((resolve, reject) => {
            resolve();
        })
    }

    public login(): Promise<any> {
        return new Promise<any>((resolve, reject) => {
            resolve();
        })
    }

    getLoginUrl(): string {
        if (LocationParam.isHttps()) {
            return `wss://${this.wssLoginURL}`
        }
        return `ws://${this.wsLoginURL}`
    }

    getGateUrl(): string {
        if (LocationParam.isHttps()) {
            return `wss://${this.wssGateURL}`
        }
        return `ws://${this.wsGateURL}`
    }

    //选服上报
    uploadSelectSvr(data) {

    }

    //创角上报
    uploadCreateRole(data) {

    }

    uploadEnterGame(data) {

    }

    //升级上报
    uploadLvUp(data) {

    }

    //退出游戏上报
    uploadExitGame(data) {

    }
}