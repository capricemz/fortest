package tests.rsr.myloader
{
	import tests.rsr.myloader.interf.IBytesBitmapDataLoaderReceiver;
	import tests.rsr.myloader.loaderManager.ByteArrayToBitmapDataManager;
	import tests.rsr.myloader.loaderManager.IByteArrayToBitmapDataManagerReceiver;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.utils.ByteArray;

	public class BytesBitmapDataLoader implements IByteArrayToBitmapDataManagerReceiver
	{
		private var _receiver:IBytesBitmapDataLoaderReceiver;
		private var _bytes:ByteArray;
		private var _info:Object;
		private var _loaded : Boolean;
		public function BytesBitmapDataLoader(receiver:IBytesBitmapDataLoaderReceiver):void
		{
			_receiver = receiver;
			_loaded = false;
		}
		
		public function loadBitmap(bytes:ByteArray, info:Object = null):void
		{
			_info = info;
			_bytes = bytes;
			
			ByteArrayToBitmapDataManager.getInstance().loadBitmapData(bytes, this);
		}
		
		public function bitmapDataReceive(byteArray:ByteArray, bitmapData:BitmapData):void
		{
			if (_receiver)
			{
				_receiver.bytesBitmapDataReceive(byteArray, bitmapData, _info);
				_receiver = null;
			}
		}
		
		public function bitmapDataError(byteArray:ByteArray):void
		{
			if (_receiver)
			{
				_receiver.bytesBitmapDataError(byteArray, _info);
				_receiver = null;
			}
		}
		
		public function destroy():void
		{
		}
	}
}