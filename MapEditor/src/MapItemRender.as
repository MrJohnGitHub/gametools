package {
	import flash.filesystem.File;
	
	import mx.events.FlexEvent;
	
	import spark.skins.spark.DefaultItemRenderer;

	public class MapItemRender extends DefaultItemRenderer
	{
		public function MapItemRender()
		{
			super();
		}
		
		override protected function createChildren():void {
			super.createChildren();
			this.labelDisplay.x = 40;
		}
		
		override public function set data(value:Object):void
		{
			super.data = value;
			var file:File = value as File;
			if(file) {
				this.labelDisplay.text = file.name;
			}
		}
	}
}