package com.john
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	public class FileUtils
	{
		public static var appDataRootPath: String = "C:\\ProgramData\\ResPacker\\";
		
		public static function resolveAppDataPath(path: String): String {
			return FileUtils.appDataRootPath + path;
		}
		
		public static function existFile(path: String): Boolean {
			var file: File = new File(path);
			return file.exists;
		}
		
		public static function readFile(path: String, encoding: String = "utf-8"): String {
			var file: File = new File(path);
			var stream: FileStream = new FileStream();
			stream.open(file,FileMode.READ);
			var content: String = stream.readMultiByte(stream.bytesAvailable, encoding);
			stream.close();
			return content;
		}
		
		public static function writeFile(path: String, content: String, encoding: String = "utf-8"): void {
			var file: File = new File(path);
			var stream: FileStream = new FileStream();
			stream.open(file,FileMode.WRITE);
			stream.writeMultiByte(content, encoding);
			stream.close();
		}
		
		public static function copyFile(fromPath: String, toPath: String): void {
//			var content: String = FileUtils.readFile(fromPath, encoding);
//			FileUtils.writeFile(toPath, content, encoding);
			
			new File(fromPath).copyTo(new File(toPath), true);
		}
		
		public static function readJsonFile(path: String, encoding: String): Object {
			var content: String = FileUtils.readFile(path, encoding);
			return JSON.parse(content);
		}
	}
}