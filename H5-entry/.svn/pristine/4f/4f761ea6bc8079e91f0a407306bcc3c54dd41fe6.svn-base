/**
 * Created by John on 2019/5/13.
 */
class MiKePlatform extends SimplePlatform {
    gameID: string;
    subGameID: string;
    channelName: string;
    channelUID: string;
    userID: string;
    token: string;

    constructor() {
        super();
    }

    public get account(): string {
        return `${this.channelName}-${this.userID}`;
    }

    public init(): Promise<any> {
        return new Promise<any>((resolve, reject) => {
            window.SDKjh.showInit((data) => {
                if(+data.status == 0) {
                    resolve();
                }
                else {
                    reject("聚合SDK初始化失败");
                }
            });
        })
    }

    public login(): Promise<any> {
        return new Promise<any>((resolve, reject) => {
            window.SDKjh.showLoginView((data) => {
                if(+data.status == 0) {
                    this.userID = data.userId
                    this.token = data.accessToken;
                    this.channelName = data.channelName;
                    this.channelUID = data.channelUid;
                    resolve();
                }
                else {
                    reject("聚合SDK登录失败");
                }
            });
        })
    }

    public getChannelID(): string {
        return `${this.channelName}_${this.channelUID}`;
    }
}

// TypeScript file
type MiKeSDK = {
    showInit: (callback:(data: { channelName: string, status: string, message: string})=>void)=>void;
    showLoginView: (callback:(data: { userId: string, accessToken: string, status: string, channelName: string, channelUid: string, message: string})=>void)=>void;
}
