package tests
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	/**
	 * ScrollRect滚动测试类<br>
	 * 效果类似遮罩需重绘整张位图
	 * @author Administrator
	 */	
	public class ScrollRectTest extends Sprite
	{
		public function ScrollRectTest()
		{
			super();
			var circle:Sprite = new Sprite();
			circle.graphics.beginFill(0xFFCC00);
			circle.graphics.drawCircle(200, 200, 200);
			circle.scrollRect = new Rectangle(0, 0, 200, 200);
			addChild(circle);
			
			circle.addEventListener(MouseEvent.CLICK, clicked);
		}
		protected function clicked(event:MouseEvent):void 
		{
			var rect:Rectangle = event.target.scrollRect;
			rect.y -= 5;
			(event.target as Sprite).scrollRect = rect;
		}
	}
}