package smallgames.the2048.model
{
	import flash.geom.Point;

	/**
	 * 格子位置数据类
	 * @author
	 */	
	public class GridLctDt
	{
		internal var _thisLct:Point;
		internal var _aboveLct:Point;
		internal var _belowLct:Point;
		internal var _leftLct:Point;
		internal var _rightLct:Point;
		public var isEmpty:Boolean = true;
		
		public function get thisLct():Point
		{
			return _thisLct;
		}

		public function get aboveLct():Point
		{
			return _aboveLct;
		}

		public function get belowLct():Point
		{
			return _belowLct;
		}

		public function get leftLct():Point
		{
			return _leftLct;
		}

		public function get rightLct():Point
		{
			return _rightLct;
		}
	}
}