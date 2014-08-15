package smallgames.collide
{
	import flash.display.Sprite;
	
	import smallgames.collide.ctrler.Ctrler;
	import smallgames.collide.model.Model;
	import smallgames.collide.view.View;
	
	/**
	 * 碰撞主程序类
	 * @author Administrator
	 */	
	public class Collide extends Sprite
	{
		public function Collide()
		{
			super();
			init();
		}
		
		private function init():void
		{
			Model.instance.init();
			View.instance.init();
			Ctrler.instance.init();
		}
	}
}