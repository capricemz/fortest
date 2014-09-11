package tests.rsr.myloader
{
	import tests.rsr.myloader.interf.IBytesLoaderReceiver;
	import tests.rsr.myloader.loaderManager.ByteArrayLoaderManager;
	import tests.rsr.myloader.loaderManager.IByteArrayLoaderManagerReceiver;
	
	import flash.utils.ByteArray;

	public class BytesLoader implements IByteArrayLoaderManagerReceiver
	{
		private var _receiver:IBytesLoaderReceiver;
		private var _info:Object;
		private var _url:String;
		
		public function BytesLoader(receiver:IBytesLoaderReceiver):void
		{
			_receiver = receiver;
		}
		
		public function get Info():Object
		{
			return _info;
		}
		
		public function loadBytes(url:String, info:Object = null):void
		{
			_url = url;
			_info = info;
			ByteArrayLoaderManager.getInstance().loadBytes(url, this);
		}
		
		public function byteArrayReceive(url:String, byteArray:ByteArray):void
		{
			_receiver.bytesReceive(url, byteArray, _info);
			_receiver = null;
		}
		
		public function byteArrayProgress(url:String, progress:Number):void
		{
			_receiver.bytesProgress(url, progress, _info);
		}
		
		public function byteArrayError(url:String):void
		{
			_receiver.bytesError(url, _info);
			_receiver = null;
		}
		
		public function destroy():void
		{
			ByteArrayLoaderManager.getInstance().stopLoad(_url);
		}
	}
}