class Main extends eui.UILayer {
    public uiLayer: eui.UILayer;
    public backImg: eui.Image;
    protected createChildren(): void {
        super.createChildren();

        egret.lifecycle.addLifecycleListener((context) => {
            // custom lifecycle plugin
        })

        egret.lifecycle.onPause = () => {
            // egret.ticker.pause();
        }

        egret.lifecycle.onResume = () => {
            // egret.ticker.resume();
        }

        RES.getVirtualUrl = (url: string) => {
            if(window.publishVer) {
                return `${window.publishVer}/${url}`;
            }
            return `${url}?v=${window.debugVer}`;
        }

        this.uiLayer = new eui.UILayer();
        this.uiLayer.percentHeight = 100;
        this.uiLayer.percentWidth = 100;
        this.uiLayer.touchEnabled = false;
        egret.lifecycle.stage.addChild(this.uiLayer);

        this.backImg = new eui.Image();
        this.backImg.horizontalCenter = this.backImg.verticalCenter = 0;
        this.uiLayer.addChild(this.backImg);
        

        //inject the custom material parser
        //注入自定义的素材解析器
        let assetAdapter = new AssetAdapter();
        egret.registerImplementation("eui.IAssetAdapter", assetAdapter);
        egret.registerImplementation("eui.IThemeAdapter", new ThemeAdapter());

        egret.ImageLoader.crossOrigin = "anonymous";
        LocationParam.parseLocation();
        this.initPlatform();
        this.loginPlat();
        this.runGame().catch(e => {
            console.log(e);
        })
    }

    initPlatform() {
        let platID = LocationParam.getValue("plat_id") || PlatType.Debug;
        switch (+platID) {
            case PlatType.MiKe:
                window.platform = new MiKePlatform();
                break;
            case PlatType.YueWan:
                window.platform = new YueWanPlatform();
                break;
            case PlatType.Debug:
                window.platform = new DebugPlatform();
                break;
        }
    }

    async loginPlat() {
        if(window.platform.platID) {
            try {
                await BackStageReqUtils.loadBackStageConfig();
                await window.platform.init();
                await window.platform.login();
                BackStageReqUtils.sendOpenReq();
                let data = await BackStageReqUtils.sendBackStageReq(BackStageReqUtils.getNowSvrTimeAddr(), {nowtime: (Date.now() / 1000) >> 0});
                if(+data.stat == 0) {
                    BackStageReqUtils.updateNowSvrTime(data.data);
                }
                if(this.uiLayer.parent) {
                    this.uiLayer.parent.removeChild(this.uiLayer);
                }
                this.showSelectServerScene();
            }
            catch(e) {
                this.loginPlat();
            }
        }
    }

    private loadResComplete: boolean;

    private async runGame() {
        await this.loadResource();
        this.backImg.source = "denglubg_jpg";
        this.loadResComplete = true;
        this.showSelectServerScene();
    }

    private async loadResource() {
        try {
            let path = DEBUG ? "resource/default.res.json" : "resource/res.pub.json";
            await RES.loadConfig(path, "resource/");
            await this.loadTheme();
            // await RES.loadGroup("preload");
        }
        catch (e) {
            console.error(e);
        }
    }

    private loadTheme() {
        return new Promise((resolve, reject) => {
            // load skin theme configuration file, you can manually modify the file. And replace the default skin.
            //加载皮肤主题配置文件,可以手动修改这个文件。替换默认皮肤。
            let theme = new eui.Theme("resource/default.thm.json", this.stage);
            theme.addEventListener(eui.UIEvent.COMPLETE, () => {
                resolve();
            }, this);

        })
    }

    public showSelectServerScene() {
        if (!this.loadResComplete) return;
        if(window.platform.isDebug) {
            App.SceneManager.runScene(PlatLoginScene);
            return;
        }
        if(!window.platform.userID) return;
        App.SceneManager.runScene(SelectServerScene);
    }
}
