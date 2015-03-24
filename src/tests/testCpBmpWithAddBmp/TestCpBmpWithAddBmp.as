package tests.testCpBmpWithAddBmp
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	

	/**
	 * 测试固定大小位图拷贝显示内容对比直接加添位图对帧速的影响
	 * @author Administrator
	 */	
	public class TestCpBmpWithAddBmp extends Sprite
	{
		private var _type:int = 1;
		private var TOTAL:int = 100;
		
		private var _timeLast:int;
		private var _numAdd:int;
		private var _bmpData:McTestCpBmpWithAddBmp;
		
		private var _bmps:Vector.<Bitmap>;
		private var _bmpBg:Bitmap;
		
		public function TestCpBmpWithAddBmp()
		{
			_bmpData = new McTestCpBmpWithAddBmp();
			if(_type == 1)
			{
				_bmps = new Vector.<Bitmap>(TOTAL,true);
			}
			else if(_type == 2)
			{
				_bmpBg = new Bitmap(new BitmapData(stage.stageWidth,stage.stageHeight));
				addChild(_bmpBg);
			}
		}
		
		protected function onFrame(event:Event):void
		{
			if(_numAdd < TOTAL)
			{
				if(_type == 1)
				{
					var bitmap:Bitmap = new Bitmap(_bmpData.clone());
					bitmap.x = Math.random()*(stage.stageWidth - bitmap.width);
					bitmap.y = Math.random()*(stage.stageHeight - bitmap.height);
					addChild(bitmap);
					_bmps[_numAdd] = bitmap;
				}
				else if(_type == 2)
				{
					
				}
				_numAdd++;
			}
			else
			{
				var timeNow:int = getTimer();
				if(timeNow - _timeLast < 100)
				{
					return;
				}
				_timeLast = timeNow;
				if(_type == 1)
				{
					var bmp:Bitmap;
					for each(bmp in _bmps)
					{
						var theX:Number = (bmp.x - stage.stageWidth*.5);
						var theY:Number = (bmp.y - stage.stageHeight*.5);
						var R:Number = Math.sqrt(theX * theX + theY * theY);
						bmp.x = stage.stageWidth*.5 + Math.sin(timeNow)*R;
						bmp.y = stage.stageHeight*.5 + Math.cos(timeNow)*R;
					}
				}
				else if(_type == 2)
				{
					
				}
			}
		}
		
		public function doTest():void
		{
			addEventListener(Event.ENTER_FRAME,onFrame);
		}
	}
}