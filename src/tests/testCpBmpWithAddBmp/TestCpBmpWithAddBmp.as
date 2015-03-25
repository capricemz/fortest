package tests.testCpBmpWithAddBmp
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.utils.getTimer;
	

	/**
	 * 测试固定大小位图拷贝显示内容对比直接加添位图对帧速的影响
	 * @author Administrator
	 */	
	public class TestCpBmpWithAddBmp extends Sprite
	{
		private var _type:int = 2;
		private var TOTAL:int = 500;
		
		private var _timeLast:int;
		private var _numAdd:int;
		private var _bmpData:McTestCpBmpWithAddBmp;
		
		private var _viewItems:Vector.<ViewItem>;
		private var _bmpBg:Bitmap;
		private var _viewItems1:Vector.<ViewItem1>;
		
		public function TestCpBmpWithAddBmp()
		{
			_bmpData = new McTestCpBmpWithAddBmp();
		}
		
		protected function onFrame(event:Event):void
		{
			if(_numAdd < TOTAL)
			{
				if(_type == 1)
				{
					if(!_viewItems)
					{
						_viewItems = new Vector.<ViewItem>(TOTAL,true);
					}
					var bitmap:Bitmap = new Bitmap(_bmpData.clone());
					bitmap.x = Math.random()*(stage.stageWidth - bitmap.width);
					bitmap.y = Math.random()*(stage.stageHeight - bitmap.height);
					var viewItem:ViewItem = new ViewItem();
					viewItem.bmp = bitmap;
					var xD:Number = (bitmap.x + bitmap.width*.5 - stage.stageWidth*.5);
					var yD:Number = (bitmap.y + bitmap.height*.5 - stage.stageHeight*.5);
					var R:Number = Math.sqrt(xD * xD + yD * yD);
					viewItem.R = R;
					viewItem.angleRadians = Math.atan2(xD,yD);
					addChild(bitmap);
					_viewItems[_numAdd] = viewItem;
				}
				else if(_type == 2)
				{
					if(!_bmpBg)
					{
						_bmpBg = new Bitmap(new BitmapData(stage.stageWidth,stage.stageHeight));
						addChild(_bmpBg);
					}
					if(!_viewItems1)
					{
						_viewItems1 = new Vector.<ViewItem1>(TOTAL,true);
					}
					var viewItem1:ViewItem1 = new ViewItem1();
					viewItem1.x = Math.random()*(stage.stageWidth - _bmpData.width);
					viewItem1.y = Math.random()*(stage.stageHeight - _bmpData.height);
					xD = (viewItem1.x + _bmpData.width*.5 - stage.stageWidth*.5);
					yD = (viewItem1.y + _bmpData.height*.5 - stage.stageHeight*.5);
					R = Math.sqrt(xD * xD + yD * yD);
					viewItem1.R = R;
					viewItem1.angleRadians = Math.atan2(xD,yD);
					_bmpBg.bitmapData.copyPixels(_bmpData,_bmpData.rect,new Point(viewItem1.x,viewItem1.y));
					_viewItems1[_numAdd] = viewItem1;
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
					for each(viewItem in _viewItems)
					{
						viewItem.angleRadians += Math.PI*.1;
						viewItem.bmp.x = stage.stageWidth*.5 + Math.sin(viewItem.angleRadians)*viewItem.R;
						viewItem.bmp.y = stage.stageHeight*.5 + Math.cos(viewItem.angleRadians)*viewItem.R;
					}
				}
				else if(_type == 2)
				{
					_bmpBg.bitmapData.lock();
					_bmpBg.bitmapData.fillRect(_bmpBg.bitmapData.rect,0);
					for each(viewItem1 in _viewItems1)
					{
						viewItem1.angleRadians += Math.PI*.1;
						viewItem1.x = stage.stageWidth*.5 + Math.sin(viewItem1.angleRadians)*viewItem1.R;
						viewItem1.y = stage.stageHeight*.5 + Math.cos(viewItem1.angleRadians)*viewItem1.R;
						_bmpBg.bitmapData.copyPixels(_bmpData,_bmpData.rect,new Point(viewItem1.x,viewItem1.y));
					}
					_bmpBg.bitmapData.unlock();
				}
			}
		}
		
		public function doTest():void
		{
			addEventListener(Event.ENTER_FRAME,onFrame);
		}
	}
}
import flash.display.Bitmap;

class ViewItem
{
	public var bmp:Bitmap;
	public var R:Number;
	public var angleRadians:Number;
	
	public function ViewItem()
	{
		
	}
}
class ViewItem1
{
	public var x:int;
	public var y:int;
	public var R:Number;
	public var angleRadians:Number;
	
	public function ViewItem1()
	{
		
	}
}