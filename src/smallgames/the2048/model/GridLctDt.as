package smallgames.the2048.model
{
	import flash.geom.Point;

	/**
	 * 格子位置数据类
	 * @author
	 */	
	public class GridLctDt
	{
		public var thisLct:Point;
		public var aboveLct:Point;
		public var belowLct:Point;
		public var leftLct:Point;
		public var rightLct:Point;
		public var isEmpty:Boolean = true;
	}
}