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
		internal var _aboveLct:GridLctDt;
		internal var _belowLct:GridLctDt;
		internal var _leftLct:GridLctDt;
		internal var _rightLct:GridLctDt;
		public var isEmpty:Boolean = true;
		
		public function get thisLct():Point
		{
			return _thisLct;
		}

		public function get aboveLct():GridLctDt
		{
			return _aboveLct;
		}

		public function get belowLct():GridLctDt
		{
			return _belowLct;
		}

		public function get leftLct():GridLctDt
		{
			return _leftLct;
		}

		public function get rightLct():GridLctDt
		{
			return _rightLct;
		}
	}
}