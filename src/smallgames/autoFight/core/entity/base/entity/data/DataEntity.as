package smallgames.autoFight.core.entity.base.entity.data
{
	import flash.geom.Point;

	/**
	 * 实体数据类
	 * @author Administrator
	 */	
	public class DataEntity implements IDataEntity
	{
		private var _id:int;
		/**唯一标识id*/
		public function get id():int
		{
			return _id;
		}
		/**@private*/
		public function set id(value:int):void
		{
			_id = value;
		}
		//
		private var _type:int;
		/**实体类型<br>使用ConstEntity中的常量*/
		public function get type():int
		{
			return _type;
		}
		/**@private*/
		public function set type(value:int):void
		{
			_type = value;
		}
		//
		private var _location:Point;
		public function get location():Point
		{
			return _location;
		}
		/**按指定量偏移位置*/
		public function locationOffset(dx:Number, dy:Number):void
		{
			_locationLast.copyFrom(_location);
			_location.offset(dx,dy);
		}
		private var _locationLast:Point
		public function get locationLast():Point
		{
			return _locationLast;
		}
		private var _isFirstDrow:Boolean = true;
		/**是否需要绘制*/
		public function get isNeedDrow():Boolean
		{
			var boolean:Boolean = _isFirstDrow || !location.equals(locationLast);
			_isFirstDrow = false;
			return boolean;
		}
		
		public function DataEntity()
		{
			_location = new Point();
			_locationLast = new Point();
		}
	}
}