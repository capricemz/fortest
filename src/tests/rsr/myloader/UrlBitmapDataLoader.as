package tests.rsr.myloader
{
	import tests.rsr.myloader.interf.IBytesBitmapDataLoaderReceiver;
	import tests.rsr.myloader.interf.IUrlBitmapDataLoaderReceiver;
	import tests.rsr.myloader.loaderManager.ByteArrayLoaderManager;
	import tests.rsr.myloader.loaderManager.IByteArrayLoaderManagerReceiver;
	
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	
	public class UrlBitmapDataLoader implements IByteArrayLoaderManagerReceiver, IBytesBitmapDataLoaderReceiver
	{
		private var _bytesBitmapDataLoader:BytesBitmapDataLoader;
		
		private var _receiver:IUrlBitmapDataLoaderReceiver;
		
		private var _url:String;
		private var _info:Object;
		
		public function UrlBitmapDataLoader(receiver:IUrlBitmapDataLoaderReceiver)
		{
			_receiver = receiver;
		}
		
		public function loadBitmap(url:String, info:Object = null):void
		{
			_url = url;
			_info = info;
			ByteArrayLoaderManager.getInstance().loadBytes(url, this);
		}
		
		public function byteArrayReceive(url:String, byteArray:ByteArray):void
		{
			_bytesBitmapDataLoader = new BytesBitmapDataLoader(this);
			_bytesBitmapDataLoader.loadBitmap(byteArray, null);
		}
		
		public function byteArrayProgress(url:String, progress:Number):void
		{
			_receiver.urlBitmapDataProgress(url, progress, _info);
		}
		
		public function byteArrayError(url:String):void
		{
			_receiver.urlBitmapDataError(url, _info);
		}
		
		public function bytesBitmapDataReceive(bytes:ByteArray, bitmapData:BitmapData, info:Object):void
		{
			_receiver.urlBitmapDataReceive(_url, bitmapData, _info);
//			_bytesBitmapDataLoader = null;
			_receiver = null;
		}
		
		public function bytesBitmapDataError(bytes:ByteArray, info:Object):void
		{
			_receiver.urlBitmapDataError(_url, _info);
			_bytesBitmapDataLoader = null;
			_receiver = null;
		}
		
		public function destroy():void
		{
			ByteArrayLoaderManager.getInstance().stopLoad(_url, this);
			if (_bytesBitmapDataLoader)
			{
				_bytesBitmapDataLoader.destroy();				
				_bytesBitmapDataLoader = null;
			}
		}
	}
}