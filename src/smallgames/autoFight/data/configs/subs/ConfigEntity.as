package smallgames.autoFight.data.configs.subs
{
	import smallgames.autoFight.data.configs.base.ConfigBase;
	
	public class ConfigEntity extends ConfigBase
	{
		/**id*/
		public var id:int;
		/**名称*/
		public var name:String;
		/**宽度*/
		public var width:int;
		/**高度*/
		public var height:int;
		private var _length:Number;
		/**内斜边长度*/
		public function get length():Number
		{
			if(isNaN(_length))
			{
				_length = Math.sqrt(width*width+height*height);
			}
			return _length;
		}
		
		public function ConfigEntity()
		{
			super();
		}
	}
}