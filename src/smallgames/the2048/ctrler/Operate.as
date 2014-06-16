package smallgames.the2048.ctrler
{
	import flash.display.Sprite;
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
				var movTgt:GridLctDt = movTgt(grid,grid.gridLctDt,drct);
				movGrid(grid,movTgt);
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
			dic[gridLctDt.thisLct.y] = _viewGrids.length-1;
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
		/**
		 * 计算移动目标
		 * @param grid 当前格子
		 * @param gridLctDt 当前格子位置信息
		 * @param drct 方向
		 * @return 目标格子位置信息
		 */
		private function movTgt(grid:Grid,gridLctDt:GridLctDt,drct:int):GridLctDt
		{
			var gridLctDtTemp:GridLctDt;//下一格
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
			if(!gridLctDtTemp)
				return gridLctDt;
			if(gridLctDtTemp.isEmpty)
			{
				return movTgt(grid,gridLctDtTemp,drct);
			}
			else
			{
				var thisLct:Point = gridLctDtTemp.thisLct;
				if(_viewGridsDic[thisLct.x])//防报空
				{
					var tgtGridIndex:int = _viewGridsDic[thisLct.x][thisLct.y] as int;
					var tgtGrid:Grid = _viewGrids[tgtGridIndex];
					if(tgtGrid && tgtGrid.num == grid.num)//值相等
					{
						grid.grow();
						rmvGrid(tgtGrid,tgtGridIndex);
						return gridLctDtTemp;
					}
					else
					{
						return gridLctDt;
					}
				}
				else
				{
					return gridLctDt;
				}
			}
		}
		/**移动格子*/
		private function movGrid(grid:Grid,tgt:GridLctDt):void
		{
			grid.gridLctDt.isEmpty = true;
			grid.gridLctDt = tgt;
		}
		/**移除格子*/
		private function rmvGrid(grid:Grid,index:int):void
		{
			if(grid.parent)
				grid.parent.removeChild(grid);
			_viewGrids.splice(index,1);
			var thisLct:Point = grid.gridLctDt.thisLct;
			delete _viewGridsDic[thisLct.x][thisLct.y];
		}
	}
}
