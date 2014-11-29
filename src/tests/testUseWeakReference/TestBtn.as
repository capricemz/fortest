package tests.testUseWeakReference
{
	import flash.display.Sprite;
	
	public class TestBtn extends Sprite
	{
		/**
		 * 
		 * @param w 宽
		 * @param h 高
		 * @param c 颜色
		 */		
		public function TestBtn(w:int,h:int,c:int)
		{
			super();
			graphics.beginFill(c);
			graphics.drawRect(0,0,w,h);
			graphics.endFill();
		}
	}
}