package tests.test_bmpdt_unlock
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	
	/**
	 * 位图区域解锁重绘区域测试类
	 * @author Administrator
	 */	
	public class TestBmpDtUnlock extends Sprite
	{
		private var _layer:Bitmap;
		private var lrDrct:int,udDrct:int,isChange:Boolean,winLct:Point;
		private var bmpDtBg:BitmapData;
		private var timer:Timer;
		private var loader:Loader,urlr:URLRequest,url:String;

		private var _timeLast:int;
		
		public function TestBmpDtUnlock()
		{
			super();
			timer = new Timer(33);
			timer.addEventListener(TimerEvent.TIMER,onTimer);
			winLct = new Point();
			addEventListener(Event.ADDED_TO_STAGE,onAdded2Stage);
			url = "tests/test_bmpdt_unlock/bg.jpg";
			urlr = new URLRequest(url);
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onComplete);
			loader.load(urlr);
		}
		
		protected function onTimer(event:TimerEvent):void
		{
			var timeNow:int = getTimer();
			var timeDiff:int = timeNow - _timeLast;
			_timeLast = timeNow;
			refresh(timeDiff);
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
			var bitmapData:BitmapData = new BitmapData(stage.stageWidth,stage.stageHeight,true,0xff000000);
			_layer = new Bitmap(bitmapData);
			addChild(_layer);
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
			isChange = true;
		}
		
		/*protected function onEender(event:Event):void
		{
			refresh();
		}*/
		
		private function refresh(timeDiff:int):void
		{
			if(isChange)
			{
				isChange = false;
				var mDiff:Number = timeDiff*stage.frameRate*(1/1000)/4;
				var mX:Number = 4,mY:Number = 4;
				winLct.x += lrDrct*mX*mDiff;
				winLct.y += udDrct*mY*mDiff;
				trace("TestBmpDtUnlock.refresh(timeDiff) winLct.x:"+winLct.x+",winLct.y:"+winLct.y);
				_layer.bitmapData.copyPixels(bmpDtBg,bmpDtBg.rect,winLct,null,null,true);
				/*_layer.bitmapData.fillRect(_layer.bitmapData.rect,0xff000000);
				var matrix:Matrix = new Matrix(1,0,0,1,winLct.x,winLct.y);
				_layer.bitmapData.draw(bmpDtBg,matrix);*/
			}
		}
	}
}