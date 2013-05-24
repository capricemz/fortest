package tests
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/**
	 * 事件捕获阶段功能测试类
	 * @author Administrator
	 */	
	public class EventTest extends Sprite
	{
		public function EventTest()
		{
			var sp:Sprite = new Sprite();
			sp.graphics.beginFill(0x000000);
			sp.graphics.drawCircle(100,100,100);
			sp.graphics.endFill();
			addChild(sp);
			var sp1:Sprite = new Sprite();
			sp1.graphics.beginFill(0x111111);
			sp1.graphics.drawCircle(100,100,50);
			sp1.graphics.endFill();
			sp.addChild(sp1);
			addEventListener(MouseEvent.CLICK,onClick(sp1),true);
		}
		protected function onClick(sp:Sprite):Function
		{
			var fun:Function = function (e:MouseEvent):void{
				if(e.target == sp)
					trace("sp");
			};
			return fun;
		}
	}
}