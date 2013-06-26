package tests
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	/**
	 * 1000帧运行测试类
	 * @author Administrator
	 */	
	public class Frame1000Test extends Sprite
	{
		private var lastTime:Number;
		public function Frame1000Test()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,onAdded2Stage);
		}
		
		protected function onAdded2Stage(event:Event):void
		{
			lastTime = getTimer();
			stage.frameRate = 1000;
			addEventListener(Event.ENTER_FRAME,onFrame);
		}
		
		protected function onFrame(event:Event):void
		{
			var nowTime:Number = getTimer();
			trace(""+stage.frameRate);
			trace("间隔时间："+(nowTime - lastTime));
			lastTime = nowTime;
		}
	}
}