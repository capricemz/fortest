package smallgames.the2048.ctrler
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import smallgames.the2048.model.Consts;
	import smallgames.the2048.model.GridLctDt;
	import smallgames.the2048.view.Grid;

	/**
	 * 2048操作类
	 * @author
	 */	
	public class Operate
	{
		/**储存的格子*/
		private var _memGrids:Vector.<Grid>;
		/**显示的格子*/
		private var _viewGrids:Vector.<Grid>;
		private var _layer:Sprite
		
		public function Operate(layer:Sprite)
		{
			_layer = layer;
			layer.stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
			_memGrids = new Vector.<Grid>();
			_viewGrids = new Vector.<Grid>();
			addGrid(emptyGridLctDt());
			addGrid(emptyGridLctDt());
		}
		/***/
		protected function onKeyUp(event:KeyboardEvent):void
		{
			var drct:int;
			switch(event.keyCode)
			{
				case Keyboard.UP:
					drct = 0;
					break;
				case Keyboard.DOWN:
					drct = 1;
					break;
				case Keyboard.LEFT:
					drct = 2;
					break;
				case Keyboard.RIGHT:
					drct = 3;
					break;
			}
			refresh(drct);
		}
		/**
		 * 刷新界面
		 * @param drct 移动方向<br>0：上，1：下，2：左，3：右
		 */		
		private function refresh(drct:int):void
		{
			var grid:Grid;
			for each(grid in _viewGrids)
			{
				movGrid(grid);
			}
			var emptyGridLctDt:GridLctDt = emptyGridLctDt();
			if(emptyGridLctDt)
			{
				addGrid(emptyGridLctDt)
			}
			else//已没有空的格子，游戏结束
			{
				
			}
		}
		/**随机取一个空的位置数据对象*/
		private function emptyGridLctDt():GridLctDt
		{
			var gridLctDtLine:Vector.<GridLctDt>,gridLctDt:GridLctDt,emptyGridLctDts:Vector.<GridLctDt> = new Vector.<GridLctDt>;
			for each(gridLctDtLine in Consts.gridLctDts)
			{
				for each(gridLctDt in gridLctDtLine)
				{
					if(gridLctDt.isEmpty)
						emptyGridLctDts.push(gridLctDt);
				}
			}
			if(emptyGridLctDts.length)
			{
				var i:int = Math.random()*emptyGridLctDts.length;
				return emptyGridLctDts[i];
			}
			else
				return null;
		}
		/**添加格子*/
		private function addGrid(gridLctDt:GridLctDt):void
		{
			var grid:Grid = usableGrid();
			_viewGrids.push(grid);
			grid.setData(Math.random()*2);
			grid.gridLctDt = gridLctDt;
			_layer.addChild(grid);
		}
		/**取一个可用的格子对象*/
		private function usableGrid():Grid
		{
			var grid:Grid;
			if(_memGrids.length)
			{
				grid = _memGrids.pop();
				grid.reset();
			}
			else
				grid = new Grid();
			return grid;
		}
		/**刷新格子*/
		private function updGrid(grid:Grid):void
		{
			
		}
		/**移动格子*/
		private function movGrid(grid:Grid):void
		{
			
		}
		/**移除格子*/
		private function rmvGrid(grid:Grid):void
		{
			
		}
	}
}
