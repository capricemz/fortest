package tests.copypixels
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	/**
	 * 拷贝像数测试类
	 * @author Administrator
	 */	
	public class TestCopyPixels extends Sprite
	{
		private var bmpWNum:int = 3,bmpHNum:int = 3;
		private var bmps:Vector.<Bitmap>;
		private var lrDrct:int,udDrct:int,isChange:Boolean,winLct:Point;
		private var bmpDtBg:BitmapData;
		private var timer:Timer;
		private var loader:Loader,urlr:URLRequest,url:String;
		
		public function TestCopyPixels()
		{
			super();
			timer = new Timer(33);
			timer.addEventListener(TimerEvent.TIMER,onTimer);
			bmps = new Vector.<Bitmap>();
			winLct = new Point();
			addEventListener(Event.ADDED_TO_STAGE,onAdded2Stage);
			url = "tests/copypixels/bg.jpg";
			urlr = new URLRequest(url);
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onComplete);
			loader.load(urlr);
		}
		
		protected function onTimer(event:TimerEvent):void
		{
			refresh();
		}
		
		protected function onComplete(event:Event):void
		{
			bmpDtBg = new BitmapData(loader.width,loader.height);
			bmpDtBg.draw(loader);
			/*addEventListener(Event.RENDER,onEender);*/
			/*stage.invalidate();*/
			timer.start();
			isChange = true;
		}
		
		protected function onAdded2Stage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,onAdded2Stage);
			var i:int,l:int = bmpWNum*bmpHNum;
			var unitW:int = Math.ceil(stage.stageWidth/bmpWNum),unitH:int = Math.ceil(stage.stageHeight/bmpHNum);
			for(;i<l;i++)
			{
				var bitmapData:BitmapData = new BitmapData(unitW,unitH,true,0xff000000);
				var bitmap:Bitmap = new Bitmap(bitmapData);
				bitmap.x = (i%bmpWNum)*unitW;
				bitmap.y = int(i/bmpWNum)*unitH;
				addChild(bitmap);
				bmps.push(bitmap);
			}
			stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
		}
		
		protected function onKeyDown(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.LEFT:
					lrDrct = -1;
					break;
				case Keyboard.RIGHT:
					lrDrct = 1;
					break;
				case Keyboard.UP:
					udDrct = -1;
					break;
				case Keyboard.DOWN:
					udDrct = 1;
					break;
			}
			updateWinLct();
			/*stage.invalidate();*/
		}
		
		protected function onKeyUp(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.LEFT:
				case Keyboard.RIGHT:
					lrDrct = 0;
					break;
				case Keyboard.UP:
				case Keyboard.DOWN:
					udDrct = 0;
					break;
			}
		}
		
		private function updateWinLct():void
		{
			var mX:int = 3,mY:int = 3;
			isChange = true;
			winLct.x -= lrDrct*mX;
			winLct.y -= udDrct*mY;
		}
		
		/*protected function onEender(event:Event):void
		{
			refresh();
		}*/
		
		private function refresh():void
		{
			if(isChange)
			{
				isChange = false;
				trace("refresh");
				var unitW:int = Math.ceil(stage.stageWidth/bmpWNum),unitH:int = Math.ceil(stage.stageHeight/bmpHNum);
				var rectangle:Rectangle = new Rectangle(0,0,unitW,unitH);
				var point:Point = new Point();
				var bmp:Bitmap;
				for each(bmp in bmps)
				{
					rectangle.x = winLct.x + bmp.x;
					rectangle.y = winLct.y + bmp.y;
					bmp.bitmapData.copyPixels(bmpDtBg,rectangle,point,null,null,true);
				}
			}
		}
	}
}