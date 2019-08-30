package
{
	public class Config
	{
		public static var config: Object;
		public static var GRID_WIDTH: int = 64;
		public static var GRID_HEIGHT: int = 32;
		
		public static var MAP_TILE_SIZE: int = 256;
		
		public static function get workspace():String {
			return Config.config["workspace"];
		}
		
		public static function set workspace(path: String):void {
			Config.config["workspace"] = path;
		}
		
		public static function set svrRootPath(path: String):void {
			Config.config["svrRootPath"] = path;
		}
		
		public static function get svrRootPath(): String {
			var path: String = Config.config["svrRootPath"];
			if(!path) {
				path = Config.workspace;
			}
			return path;
		}
	}
}