package
{
	public class EditMode {
		public static var DRAW_BLOCK: int = 1;
		public static var DRAW_ALPHA: int = 2;
		public static var DRAW_REDNAME: int = 4;
		
		public static function isBlock(value: int): Boolean {
			return (value & DRAW_BLOCK) > 0;
		}
		
		public static function isState(value: int, state: int): Boolean {
			return (value & state) > 0;
		}
		
		public static function getStateColor(state: int): int {
			switch(state) {
				case EditMode.DRAW_BLOCK:
					return 0x0000ff;
				case EditMode.DRAW_ALPHA:
					return 0xffffff;
				case EditMode.DRAW_REDNAME:
					return 0xff0000;
			}
			return -1;
		}
	}

}