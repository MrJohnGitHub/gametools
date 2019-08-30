/**
 * Created by John on 2019/5/10.
 */
class PlatLoginView extends BaseSceneView {
    public loginBtn: eui.Button;
    public accountInput: eui.Label;
    public pwdInput: eui.Label;

    public constructor() {
        super();
        this.skinName = `LoginSceneSkin`;
    }

    $onAddToStage(stage, nestLv) {
        super.$onAddToStage(stage, nestLv);
        this.loginBtn.addEventListener(egret.TouchEvent.TOUCH_TAP, this.onTouchLogin, this);
        this.accountInput.text = egret.localStorage.getItem("debug_uid");
        this.accountInput.text = egret.localStorage.getItem("debug_token");
    }

    onTouchLogin() {
        if(!this.accountInput.text) return;
        window.platform.platID = 5000;
        window.platform.userID = this.accountInput.text;
        window.platform.token = this.pwdInput.text;
        egret.localStorage.setItem("debug_uid", window.platform.userID);
        egret.localStorage.setItem("debug_token", window.platform.token);
        App.SceneManager.runScene(SelectServerScene);
    }
}
