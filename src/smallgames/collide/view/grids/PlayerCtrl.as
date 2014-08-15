package smallgames.collide.view.grids
{
	import smallgames.collide.view.ResGridPc;

	/**
	 * 玩家控制格子类
	 * @author Administrator
	 */	
	public class PlayerCtrl extends Grid
	{
		public function PlayerCtrl()
		{
			super();
		}
		
		override protected function initSkin():void
		{
			_skin = new ResGridPc();
			addChild(_skin);
		}
		
		override public function destroy():void
		{
			super.destroy();
		}
	}
}