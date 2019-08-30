package
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import mx.controls.Alert;
	import mx.logging.Log;
	import mx.logging.LogEventLevel;
	import mx.logging.LogLogger;
	import mx.logging.targets.TraceTarget;

	public class App
	{
		public static var main: MapEditor;
		public static var logger: LogLogger;
		
		public static function init():void {
			var logTarget:TraceTarget = new TraceTarget();   
			logger = new LogLogger("mapeditor.log");
			logTarget.filters = ["main"];   
			logTarget.level = LogEventLevel.ALL;   
			logTarget.includeCategory = true;   
			logTarget.includeDate = true;   
			logTarget.includeLevel = true;   
			logTarget.includeTime = true;   
			logTarget.addLogger(logger);   
			Log.addTarget(logTarget);   
		}
		
		public static function loadConfig():void {
			var file:File = new File(File.applicationDirectory.nativePath + "\\config.json");
			if(file.exists) {
				var fs:FileStream = new FileStream();
				fs.open(file,FileMode.READ);
				var content:String = fs.readUTFBytes(fs.bytesAvailable);
				Config.config = JSON.parse(content);
			}
		}
		
		public static function loadMapsJsonData():void {
			var file:File = new File(Config.workspace + "\\maps.json");
			if(file.exists) {
				var fs:FileStream = new FileStream();
				fs.open(file,FileMode.READ);
				var content:String = fs.readUTFBytes(fs.bytesAvailable);
				var mapsData: Object = JSON.parse(content);
				fs.close();
				for(var key: String in mapsData) {
					var mapJsonFile: File = new File(Config.workspace + "\\" + key + "\\data.json");					
					fs = new FileStream();
					fs.open(mapJsonFile, FileMode.WRITE);
					mapsData[key]["mapWidth"] = mapsData[key]["pixWidth"];
					mapsData[key]["mapHeight"] = mapsData[key]["pixHeight"];
					
					var grids: Array = [];
					var maxX: int = mapsData[key]["maxX"];
					var maxY: int = mapsData[key]["maxY"];
					var maxGridX: int = mapsData[key]["mapWidth"] / 64;
					var maxGridY: int = mapsData[key]["mapHeight"] / 64;
					if(key == "301030") {
						maxGridX = 16 * 4;
						maxGridY = 11 * 4;
					}
					else if(key == "301035") {
						maxGridX = 15 * 4;
						maxGridY = 7 * 4;
					}
					else if(key == "999998") {
						maxGridX = 12 * 4;
						maxGridY = 7 * 4;
					}
					else if(key == "999999") {
						maxGridX = 35 * 4;
						maxGridY = 26 * 4;
					}
					for(var x: int = 0; x < maxGridX; x++) {
						for(var y: int = 0; y < maxGridY; y++) {
							var value: int = mapsData[key]["grids"][x * maxY + y];
							value = (value & 1) > 0 ? value - 1 : value + 1;
							grids.push(value);
							grids.push(value);
						}
					}
//					for(var index: int = 0; index < mapsData[key]["grids"].length; index++) {
//						var value: int = mapsData[key]["grids"][index];
//						value = value ^ 1;
//						grids.push(value);
//						grids.push(value);
//					}
					mapsData[key]["grids"] = grids;
					delete mapsData[key]["pixWidth"];
					delete mapsData[key]["pixHeight"];
					delete mapsData[key]["maxX"];
					delete mapsData[key]["maxY"];
					delete mapsData[key]["version"];
					fs.writeUTFBytes(JSON.stringify(mapsData[key], null, "\t"));
					fs.close();
				}
			}
			Alert.show("导出完毕。");

		}
		
		public static function saveConfig():void {
			var file:File = new File(File.applicationDirectory.nativePath + "\\config.json");
			var content: String = JSON.stringify(Config.config, null, "\t");
			Alert.show(content);
			var fs:FileStream = new FileStream();
			fs.open(file,FileMode.WRITE);
			fs.writeUTFBytes(content);
			fs.close();
		}
		
		public static function exportMapsData():void {
			var mapsJsonData: Object = {};
			var rootDir: File = new File(Config.workspace);
			if(!rootDir.exists || !rootDir.isDirectory) {
				Alert.show("请设置工作目录。");
				return;
			}
			var fileList: Array = rootDir.getDirectoryListing();
			for each(var file: File in fileList) {
				if(file.isDirectory) {
					var jsonFile: File = new File(file.nativePath + "\\data.json");
					if(jsonFile.exists) {
						var fs:FileStream = new FileStream();
						fs.open(jsonFile,FileMode.READ);
						mapsJsonData[file.name] = JSON.parse(fs.readUTFBytes(fs.bytesAvailable));
					}
				}
			}
			var mapsJsonFile: File = new File(rootDir.nativePath + "\\maps.json");
			fs = new FileStream();
			fs.open(mapsJsonFile, FileMode.WRITE);
			fs.writeUTFBytes(JSON.stringify(mapsJsonData));
			fs.close();
			Alert.show("导出完毕。");
		}
		
		public static function saveMapData(map: String, mapWidth: int, mapHeight: int, grids: Array):void {
//			if(!new File(svrRootPath).exists) {
//				Alert.show("服务器保存目录不存在，请先设置。", "提示");
//				return;
//			}
			var maxGridX: int = mapWidth/Config.GRID_WIDTH >> 0;
			var maxGridY: int = mapHeight/Config.GRID_HEIGHT >> 0;
			var dataFile: File = new File(Config.workspace + "\\" + map + "\\data.json");
			var mapData: Object = {
				mapWidth: mapWidth, 
				mapHeight: mapHeight,
				maxGridX: maxGridX,
				maxGridY: maxGridY,
				grids: grids
			};
			var fs:FileStream = new FileStream();
			fs.open(dataFile,FileMode.WRITE);
			fs.writeUTFBytes(JSON.stringify(mapData, null,"\t"));
			fs.close();
			
			var bytes: ByteArray = new ByteArray();
			bytes.endian = Endian.LITTLE_ENDIAN;
			bytes.writeUnsignedInt(0);
			bytes.writeUnsignedInt(0);
			bytes.writeUnsignedInt(mapWidth/Config.GRID_WIDTH >> 0);
			bytes.writeUnsignedInt(mapHeight/Config.GRID_HEIGHT >> 0);
			bytes.writeUnsignedInt(0);
			bytes.writeUnsignedInt(0);
			for(var y: int = 0; y < maxGridY; y++) {
				for(var x: int = 0; x < maxGridX; x++) {
					var value: int = grids[x * maxGridY + y];
					bytes.writeByte(value);
					bytes.writeByte(0);
				}
			}
			
			var svrDataFile: File = new File(Config.svrRootPath + "\\" + map + "\\tile.hlm");
			fs = new FileStream();
			fs.open(svrDataFile,FileMode.WRITE);
			fs.writeBytes(bytes);
			fs.close();
			
			Alert.show("保存成功。", "提示");
		}
	}
}