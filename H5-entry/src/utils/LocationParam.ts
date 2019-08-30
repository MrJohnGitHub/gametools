/**
 * Created by John on 2019/5/10.
 */
class LocationParam {
    protected static param: any;
    protected static _isHttps: boolean;
    public static parseLocation() {
        let href = window.location.href;
        let index = href.indexOf("?")
        let search = href.substr(index + 1); //取得所有参数   stringvar.substr(start [, length ]
        let param = {};
        let arr = search.split("&"); //各个参数放到数组里
        for(let i = 0; i < arr.length; i++){
            let eqIndex = arr[i].indexOf("=");
            if(eqIndex > 0){
                let key = arr[i].substring(0,eqIndex);
                let value = arr[i].substr(eqIndex + 1);
                param[key] = value;
            }
        }
        this.param = param;
        this._isHttps = window.location.protocol.indexOf("https:") >= 0;
    }

    public static isHttps(): boolean {
        return this._isHttps;
    }

    /**
     * 获取指定参数值
     * @param key
     */
    public static getValue(key: string): any {
        return this.param[key];
    }



    public static getProtocol(): string {
        return window.location.protocol + "//";
    }
}
