package tests.testconstructor
{
	import flash.display.GradientType;
	import flash.display.Sprite;

	public class ClassUseFunction extends Sprite
	{
		public function ClassUseFunction()
		{
			super();
		}
		
		public function init():void
		{
			graphics.beginGradientFill(GradientType.LINEAR,[0xffffff,0x000000,0xffffff,0x000000],[.7,.4,.9,.3],[0,125,198,255]);
			graphics.drawRect(0,0,50,50);
			graphics.drawRect(0,0,50,50);
			graphics.drawRect(0,0,50,50);
			graphics.drawRect(0,0,50,50);
			graphics.drawRect(0,0,50,50);
			graphics.drawRect(0,0,50,50);
			graphics.drawRect(0,0,50,50);
			graphics.drawRect(0,0,50,50);
			graphics.drawRect(0,0,50,50);
			graphics.drawRect(0,0,50,50);
			graphics.endFill();
		}
	}
}