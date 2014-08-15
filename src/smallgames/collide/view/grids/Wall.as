package smallgames.collide.view.grids
{
	import smallgames.collide.view.ResGridWall;

	/**
	 * 墙格子类
	 * @author Administrator
	 */	
	public class Wall extends Grid
	{
		public function Wall()
		{
			super();
		}
		
		override protected function initSkin():void
		{
			_skin = new ResGridWall();
			addChild(_skin);
		}
		
		override public function destroy():void
		{
			super.destroy();
		}
	}
}