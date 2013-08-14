package tests
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;

	/**
	 * 鼠标移入移出事件测试类<br>
	 * 当其鼠标被遮罩遮住时是会触发鼠标移出事件的，但需要在遮罩的父类或以上监听事件
	 * @author Administrator
	 */	
	public class MouseOverOutTest extends Sprite
	{

		private var sp1:Sprite;
		
		public function MouseOverOutTest()
		{
			var par:Sprite = new Sprite();
			addChild(par);
			par.name = "《容器》";
			par.graphics.beginFill(0x666666);
			par.graphics.drawRect(0,0,500,100);
			par.graphics.endFill();
			
			var sp:Sprite = new Sprite();
			par.addChild(sp);
			sp.name = "《目标》";
			sp.graphics.beginFill(0x000000);
			sp.graphics.drawRect(0,0,200,100);
			sp.graphics.endFill();
			
			sp1 = new Sprite();
			par.addChild(sp1);
			sp1.name = "《遮罩》";
			sp1.graphics.beginFill(0x333333);
			sp1.graphics.drawRect(200,0,300,100);
			sp1.graphics.endFill();
			
			this.name = "《本类》";
			var timeId:uint,currentCount:int;
			timeId = setInterval(function ():void
			{
				sp1.x -= 2;
				++currentCount;
				if(currentCount >= 250)
					clearInterval(timeId);
			},150);
			addEventListener(MouseEvent.ROLL_OVER,onOver,true);
			addEventListener(MouseEvent.ROLL_OUT,onOut,true);
		}
		
		protected function onOver(event:MouseEvent):void
		{
			trace("鼠标移入，"+(event.target as Sprite).name+"派发");
		}
		
		protected function onOut(event:MouseEvent):void
		{
			trace("鼠标移出，"+(event.target as Sprite).name+"派发");
		}
	}
}