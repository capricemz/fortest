package smallgames.the2048
{
	import flash.display.Sprite;
	
	import smallgames.the2048.ctrler.Operate;
	import smallgames.the2048.view.BackDrop;
	import smallgames.the2048.view.Grid;
	
	/**
	 * 2048主程序类
	 * @author
	 */	
	public class The2048 extends Sprite
	{

		private var _grids:Vector.<Grid>;
		
		public function The2048()
		{
			super();
			_grids = new Vector.<Grid>();
			var backDrop:BackDrop = new BackDrop();
			addChild(backDrop);
			var operate:Operate = new Operate(stage);
		}
		
		private function get grid():Grid
		{
			var grid:Grid;
			if(_grids.length)
			{
				grid = _grids.pop();
				grid.reset();
			}
			else
				grid = new Grid();
			return grid;
		}
	}
}