package smallgames.the2048.ctrler
{
	import smallgames.the2048.model.Consts;
	import smallgames.the2048.model.GridLctDt;
	import smallgames.the2048.view.Grid;

	/**
	 * 2048操作类
	 * @author
	 */	
	public class Operate
	{
		public function Operate()
		{
		}
		/**添加格子*/
		public function addGrid(grid:Grid):void
		{
			var emptyGridLctDt:GridLctDt = emptyGridLctDt();
			if(emptyGridLctDt)
			{
				grid.setData(Math.random()*2);
				grid.x = emptyGridLctDt.thisLct.x;
				grid.y = emptyGridLctDt.thisLct.y;
			}
			else//已没有空的格子，游戏结束
			{
				
			}
		}
		/**刷新格子*/
		public function updGrid(grid:Grid):void
		{
			
		}
		/**移动格子*/
		public function movGrid(grid:Grid):void
		{
			
		}
		/**移除格子*/
		public function rmvGrid(grid:Grid):void
		{
			
		}
		/**取一个空格子位置数据对象*/
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
	}
}