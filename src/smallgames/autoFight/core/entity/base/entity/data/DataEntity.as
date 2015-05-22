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
		
		private var _type:int;
		public function get type():int
		{
			return _type;
		}
		public function set type(value:int):void
		{
			_type = value;
		}
		
		private var _location:Point;
		public function get location():Point
		{
			return _location;
		}
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
		private var _isFirstDrow:Boolean;
		public function get isNeedDrow():Boolean
		{
			var boolean:Boolean = !location.equals(locationLast) || !_isFirstDrow;
			_isFirstDrow = true;
			return boolean;
		}
		
		public function DataEntity()
		{
			_location = new Point();
			_locationLast = new Point();
		}
	}
}