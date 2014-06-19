package tests.testglass
{
	import flash.display.Sprite;
	
	/**
	 * 玻璃球效果测试类
	 * @author Administrator
	 */	
	public class TestGlassBall extends Sprite
	{
		public function TestGlassBall()
		{
			super();
		}
		
		public function addBall():void
		{
			var ball:Ball = new Ball(50,0x00ff00);
			ball.x = Math.random()*(1024-50);
			ball.y = Math.random()*(768-50);
			addChild(ball);
		}
	}
}