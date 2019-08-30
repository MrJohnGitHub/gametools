/**
 * Created by John on 2019/5/10.
 */
class App {
    static SceneManager = new SceneManager();

    static gameUrl = `http://10.5.10.19:8200/H5-frontend/h5entry/client.html?plat_id=5001`;
    static signKey = `7ed3417b7a5103e5104738a040c2e0a0`;
    static getYueWanDebugUrl(): string {
        let time = Date.now();
        let gameUrl = this.gameUrl;
        let key = this.signKey;
        let gameId = 1703;
        let encodeGameUrl = encodeURIComponent(gameUrl).toLowerCase();
        let sign = MD5.hex_md5(`debug_url=${encodeGameUrl}&j_game_id=${gameId}&j_game_secret=${key}&time=${time}`);
        return `http://japi.game-props.com/h5/entryPage?debug_url=${gameUrl}&j_game_id=${gameId}&time=${time}&sign=${sign}`;
    }
}
