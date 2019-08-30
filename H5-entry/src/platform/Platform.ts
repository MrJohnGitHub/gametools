/**
 * 平台数据接口。
 * 由于每款游戏通常需要发布到多个平台上，所以提取出一个统一的接口用于开发者获取平台数据信息
 * 推荐开发者通过这种方式封装平台逻辑，以保证整体结构的稳定
 * 由于不同平台的接口形式各有不同，白鹭推荐开发者将所有接口封装为基于 Promise 的异步形式
 */
declare interface Platform {
    //游戏相关url获取地址
    backUrlAddr?: string;
    backUrlKey?: string;
    platID?: number;
    userID?: string;
    userName?: string;
    channel?: string;
    channelName?: string;
    channelUID?: string;
    account?: string;

    token?: string;
    time?: string;
    resRoot?: string;
    svrID?: string;
    // svrIp?: string;
    // svrPort?: number;
    // gateIp?: string;
    // gatePort?: number;
    wsLoginURL?: string;
    wssLoginURL?: string;
    wsGateURL?: string;
    wssGateURL?: string;

    verData?: any;
    isDebug?: boolean;

    init?(): Promise<any>;
    login?(): Promise<any>;
    logout?(): void;
    initByLocation?(): void;

    getLoginUrl?(): string;

    getGateUrl?(): string;

    //支付接口
    pay?({goodConfig: ChargeConfig, billno: number}): Promise<any>;

    //选服上报
    uploadSelectSvr?(data?: UploadRoleActData): void;

    //创角上报
    uploadCreateRole?(data?: UploadRoleActData): void;

    //进入游戏上报
    uploadEnterGame?(data?: UploadRoleActData): void;

    //角色升级上报
    uploadLvUp?(data?: UploadRoleActData): void;

    //退出游戏上报
    uploadExitGame?(data: UploadRoleActData): void;
}



declare let platform: Platform;

type UploadRoleActData = {
    vipLevel?: number;
    roleId?: number;
    createRoleTime?: number;
    uploadRoleAction?: number;
    roleName?: string;
    serverName?: string;
    roleLevel?: number;
    roleChangeTime?: number;
    serverId?: number;
}