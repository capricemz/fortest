package tests.rsr
{
	import tests.rsr.myloader.UrlBitmapDataLoader;
	import tests.rsr.myloader.UrlSwfLoader;
	import tests.rsr.myloader.interf.IUrlBitmapDataLoaderReceiver;
	import tests.rsr.myloader.interf.IUrlSwfLoaderReceiver;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;

	/**
	 * 运行时共享资源加载项类
	 * @author Administrator
	 */	
	internal class RsrLoaderItem implements IUrlBitmapDataLoaderReceiver,IUrlSwfLoaderReceiver
	{
		public static const TYPE_PIC:int = 0;
		public static const TYPE_SWF:int = 1;
		
		private var _urlBitmapDataLoader:UrlBitmapDataLoader;
		private var _urlSwfLoader:UrlSwfLoader;
		private var _mc:MovieClip;
		private var _callBack:Function;
		
		public function RsrLoaderItem()
		{
		}
		
		public function init(type:int, url:String, mc:MovieClip):void
		{
			if(type == TYPE_PIC)
			{
				_urlBitmapDataLoader = new UrlBitmapDataLoader(this);
				_urlBitmapDataLoader.loadBitmap(url);
			}
			else if(type == TYPE_SWF)
			{
				_urlSwfLoader = new UrlSwfLoader(this);
				_urlSwfLoader.loadSwf(url);
			}
			_mc = mc;
		}
		
		public function urlBitmapDataError(url:String, info:Object):void
		{
			trace("加载图片出错，"+url);
			destroy();
		}
		
		public function urlBitmapDataProgress(url:String, progress:Number, info:Object):void
		{
		}
		
		public function urlBitmapDataReceive(url:String, bitmapData:BitmapData, info:Object):void
		{
			var bitmap:Bitmap = new Bitmap(bitmapData,"auto",true);
			bitmap.width = _mc.width;
			bitmap.height = _mc.height;
			_mc.addChild(bitmap);
			_mc.removeChildAt(0);
			_mc.mouseEnabled = false;
			doCallBack();
			destroy();
		}
		
		public function swfError(url:String, info:Object):void
		{
			trace("加载SWF出错，"+url);
			destroy();
		}
		
		public function swfProgress(url:String, progress:Number, info:Object):void
		{
		}
		
		public function swfReceive(url:String, swf:Sprite, info:Object):void
		{
			var movieClip:MovieClip = swf.getChildAt(0) as MovieClip;
			movieClip.width = _mc.width;
			movieClip.height = _mc.height;
			movieClip.x = _mc.x;
			movieClip.y = _mc.y;
			var index:int = _mc.parent.getChildIndex(_mc);
			_mc.parent.addChildAt(movieClip,index);
			_mc.parent.removeChild(_mc);
			movieClip.parent[_mc.name] = movieClip;
			_mc = movieClip;
			doCallBack();
			destroy();
		}
		
		private function doCallBack():void
		{
			if(_callBack != null)
			{
				_callBack(_mc);
				_callBack = null;
			}
		}
		
		public function destroy():void
		{
			if(_urlBitmapDataLoader)
			{
				_urlBitmapDataLoader.destroy();
				_urlBitmapDataLoader = null;
			}
			if(_urlSwfLoader)
			{
				_urlSwfLoader.destroy();
				_urlSwfLoader = null;
			}
			_mc = null;
		}

		public function set callBack(value:Function):void
		{
			_callBack = value;
		}
	}
}