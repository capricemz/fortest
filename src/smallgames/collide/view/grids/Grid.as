package smallgames.collide.view.grids
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * 格子基类
	 * @author Administrator
	 */	
	public class Grid extends Sprite
	{
		protected var _skin:MovieClip;
		
		public function Grid()
		{
			super();
			initSkin();
		}
		
		protected function initSkin():void
		{
			
		}
		
		public function destroy():void
		{
			if(_skin)
			{
				if(_skin.parent)
				{
					_skin.parent.removeChild(_skin);
				}
				_skin = null;
			}
		}
	}
}