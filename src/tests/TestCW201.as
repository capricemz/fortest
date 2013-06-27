package tests
{
	import flash.display.Sprite;
	import flash.utils.ByteArray;
	
	/**
	 * 中文转化为01数字测试类
	 * @author mz
	 */	
	public class TestCW201 extends Sprite
	{
		public function TestCW201()
		{
			super();
		}
		public function doChange(str:String):void
		{
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeUTF(str);
			byteArray.position = 0;
			var str:String = "",strs:String = "",byte:int;
			while(byteArray.bytesAvailable)
			{
				byte = byteArray.readUnsignedByte();
				str = byte.toString(2);
				while (str.length<8)
				{
					str = "0"+str;
				}
				strs += str;
			}
			trace(strs);
		}
		public function unDoChange(str:String):void
		{
			var byteArray:ByteArray = new ByteArray();
			byteArray.position = 0;
		}
	}
}