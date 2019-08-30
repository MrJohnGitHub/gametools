/**
 * Created by John on 2019/5/13.
 */
declare interface Window {
    platform: Platform;
    // hasSDK: () => boolean;
    //聚合SDK
    SDKjh: MiKeSDK;
    publishVer: string;
    debugVer: string;
    JSLIB?: any;
}

// window.hasSDK = () => {
//     if(window.SDKjh) return true;
//     return false;
// }
