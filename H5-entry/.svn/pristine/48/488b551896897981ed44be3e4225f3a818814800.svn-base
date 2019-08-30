/**
 * create by lichujiong on 2018/6/6
 */
class SceneManager {
    private _currScene: BaseScene;

    /**
     * 构造函数
     */
    public constructor() {
    }

    /**
     * 清空处理
     */
    public clear():void {
        let nowScene = this._currScene;
        if(nowScene){
            nowScene.onExit();
            this._currScene = null;
        }
    }

    /**
     * 切换场景
     * @param clazz 场景类名
     */
    public runScene(clazz: any, ...param:any[]):void {
        let oldScene:BaseScene = this._currScene;
        if (oldScene) {
            if(oldScene instanceof clazz) return;
            oldScene.onExit();
        }
        this._currScene = new clazz();
        this._currScene.onEnter(...param);
    }

    /**
     * 获取当前Scene
     * @returns {number}
     */
    public getCurrScene(): BaseScene {
        return this._currScene;
    }
}
