/**
 * Created by John on 2019/5/16.
 * 内网平台5000
 */
class DebugPlatform extends SimplePlatform {
    public constructor() {
        super();
    }


    public initByLocation() {
        this.platID = PlatType.Debug;
    }

    initBackStage() {
        this.backUrlAddr = "10.5.70.4:8090";
        this.backUrlKey = "4c4776e8db27d196ae19ddbb60143488";
    }

    get isDebug(): boolean {
        return true;
    }
}
