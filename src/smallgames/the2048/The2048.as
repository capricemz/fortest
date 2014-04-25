package smallgames.the2048
{
	import flash.display.Sprite;
	import smallgames.the2048.view.Grid;
	import smallgames.the2048.view.BackDrop;
	
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
		}
		
		private function addGrid():void
		{
			var grid:Grid;
			if(_grids.length)
				grid = _grids.pop();
			else
				grid = new Grid();
			grid.setData(Math.random()*2);
			
		}
		
		private function rmvGird():void
		{
			
		}
	}
}