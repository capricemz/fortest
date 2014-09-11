package tests.rsr.myloader.loaderManager
{
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	
	public interface IByteArrayToBitmapDataManagerReceiver
	{
		function bitmapDataReceive(byteArray:ByteArray, bitmapData:BitmapData):void;
		function bitmapDataError(byteArray:ByteArray):void;
	}
}