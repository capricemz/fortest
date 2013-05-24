package tests
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.utils.getTimer;
	
	/**
	 * ToString和is的性能对比测试类<br>
	 * is比toString节省性能
	 * @author Administrator
	 */	
	public class ToString_IsTest extends Sprite
	{
		private var the_one:Sprite;
		
		public function ToString_IsTest()
		{
			super();
			graphics.beginFill(0x888888);
			graphics.drawRect(0,0,200,200);
			graphics.endFill();
			the_one = new Sprite();
			addChild(the_one);
			the_one.graphics.beginFill(0x000000);
			the_one.graphics.drawRect(50,50,100,100);
			the_one.graphics.endFill();
			addEventListener(MouseEvent.CLICK,onClick,true);
		}
		
		protected function onClick(event:MouseEvent):void
		{
			var start_time:Number,end_time:Number,i:int,l:int = 10000;
			start_time = getTimer();
			trace("ToString测试，开始时间:"+start_time);
			for (i=0;i<l;i++)
			{
				var b:Boolean = event.target.toString() == "[object Sprite]";
			}
			end_time = getTimer();
			trace("ToString测试，结束时间:"+end_time);
			trace("ToString测试，总时间:"+(end_time-start_time));
			
			start_time = getTimer();
			trace("is测试，开始时间:"+start_time);
			for (i=0;i<l;i++)
			{
				var b1:Boolean = event.target is Sprite;
			}
			end_time = getTimer();
			trace("is测试，结束时间:"+end_time);
			trace("is测试，总时间:"+(end_time-start_time));
			
			start_time = getTimer();
			trace("==测试，开始时间:"+start_time);
			for (i=0;i<l;i++)
			{
				var b2:Boolean = event.target == the_one;
			}
			end_time = getTimer();
			trace("==测试，结束时间:"+end_time);
			trace("==测试，总时间:"+(end_time-start_time));
		}
		
	}
}