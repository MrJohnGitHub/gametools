/**
 * create by lichujiong on 2018/6/6
 */
class BaseScene {
    public uiLayer: eui.UILayer;

    /**
     * 构造函数
     */
    public constructor() {
        this.uiLayer = new eui.UILayer();
        this.uiLayer.percentHeight = 100;
        this.uiLayer.percentWidth = 100;
        this.uiLayer.touchEnabled = false;
    }

    /**
     * 进入Scene调用
     */
    public onEnter(...param) {
        this.getStage().addChild(this.uiLayer);
    }

    /**
     * 退出Scene调用
     */
    public onExit() {
        this.getStage().removeChild(this.uiLayer);
    }

    public getStage(): egret.Stage {
        return egret.lifecycle.stage;
    }
}
