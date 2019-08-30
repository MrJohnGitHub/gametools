/**
 * Created by John on 2019/5/10.
 */
class PlatLoginScene extends BaseScene {
    public loginView: PlatLoginView;

    public constructor() {
        super();

        this.loginView = new PlatLoginView();
        this.uiLayer.addChild(this.loginView);
    }

    onEnter() {
        super.onEnter();
    }
}
