package tests.testconstructor
{
	import flash.display.GradientType;
	import flash.display.Sprite;
	
	public class ClassUseConstructor extends Sprite
	{
		public function ClassUseConstructor(sp:Sprite,sp1:Sprite,sp2:Sprite,sp3:Sprite,sp4:Sprite)
		{
			super();
			/*addChild(sp);
			addChild(sp1);
			addChild(sp2);
			addChild(sp3);
			addChild(sp4);*/
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