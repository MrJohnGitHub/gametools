/**
 * Created by John on 2019/5/10.
 */
class SelectServerScene extends BaseScene {
    public selectServerView: SelectServerView;
    public constructor() {
        super();

        this.selectServerView = new SelectServerView();
        this.uiLayer.addChild(this.selectServerView);
    }
}
