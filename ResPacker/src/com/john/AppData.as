package com.john
{
	import flash.filesystem.File;

	public class AppData
	{
		public static var SVN_BIN_DIR: String = "-svnBinDir";
		public static var CMD_EXE_DIR: String = "-cmd";
		public static var NOTEPAD_EXE_DIR: String = "-notepad";
		
		private static var appConfig: Object;
		public static var packspaceConfig: Object;
		
		public static function loadAppConfig(): void {
			FileUtils.copyFile(File.applicationDirectory.resolvePath("app.ini").nativePath, FileUtils.resolveAppDataPath("app.ini"));
			
			var content: String = FileUtils.readFile(File.applicationDirectory.resolvePath("app.ini").nativePath);
			var cfgStrArr: Array = content.split("\r\n");
			AppData.appConfig = {};
			for each(var cfgStr: String in cfgStrArr) {
				var arr: Array = cfgStr.split("=");
				AppData.appConfig[arr[0]] = arr[1];
			}
		}
		
		public static function saveAppConfig(): void {
			var content: String = "";
			for(var key: String in AppData.appConfig) {
				content += key + "=" + AppData.appConfig[key] + "\n";
			}
		}
		
		public static function loadPackSpaces(): void {
			var appPath: String = File.applicationDirectory.nativePath;
			var content: String = FileUtils.readFile(File.applicationDirectory.resolvePath("app.conf").nativePath);
			AppData.packspaceConfig = JSON.parse(content);
		}
		
		public static function get svnBinRootPath(): String {
			return AppData.appConfig[AppData.SVN_BIN_DIR];
		}
		
		public static function get svnProcAppPath(): String {
			return AppData.svnBinRootPath + "TortoiseProc.exe";;
		}
		
		public static function get cmdAppPath(): String {
			return AppData.appConfig[AppData.CMD_EXE_DIR];
		}
		
		public static function get notepadAppPath(): String {
			return AppData.appConfig[AppData.NOTEPAD_EXE_DIR];
		}
	}
}