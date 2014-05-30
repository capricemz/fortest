package smallgames.the2048.ctrler
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.utils.Dictionary;
	
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
		private var _viewGrids:Vector.<Grid>,_viewGridsDic:Dictionary;
		private var _layer:Sprite;
		
		public function Operate(layer:Sprite)
		{
			_layer = layer;
			layer.stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
			_memGrids = new Vector.<Grid>();
			_viewGrids = new Vector.<Grid>();
			_viewGridsDic = new Dictionary();
			addGrid(emptyGridLctDt());
			addGrid(emptyGridLctDt());
		}
		/***/
		protected function onKeyUp(event:KeyboardEvent):void
		{
			var drct:int = event.keyCode;
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
				if(movJudge(grid.gridLctDt,drct))
					movGrid(grid,drct,5);
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
			var grid:Grid,dic:Dictionary;
			grid= usableGrid();
			_viewGrids.push(grid);
			grid.setData(Math.random()*2);
			grid.gridLctDt = gridLctDt;
			if(!_viewGridsDic[gridLctDt.thisLct.x])
				_viewGridsDic[gridLctDt.thisLct.x] = new Dictionary();
			dic = _viewGridsDic[gridLctDt.thisLct.x];
			dic[gridLctDt.thisLct.y] = grid;
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
		/**移动判断*/
		private function movJudge(gridLctDt:GridLctDt,drct:int):Boolean
		{
			var gridLctDtTemp:GridLctDt;
			switch(drct)
			{
				case Keyboard.UP:
					gridLctDtTemp = gridLctDt.aboveLct;
					break;
				case Keyboard.DOWN:
					gridLctDtTemp = gridLctDt.belowLct;
					break;
				case Keyboard.LEFT:
					gridLctDtTemp = gridLctDt.leftLct;
					break;
				case Keyboard.RIGHT:
					gridLctDtTemp = gridLctDt.rightLct;
					break;
			}
			if(gridLctDtTemp.isEmpty)
				return movJudge(gridLctDtTemp,drct);
			else
				return false;
		}
		/**移动格子*/
		private function movGrid(grid:Grid,drct:int,dstc:int):void
		{
			
		}
		/**移除格子*/
		private function rmvGrid(grid:Grid):void
		{
			
		}
	}
}
