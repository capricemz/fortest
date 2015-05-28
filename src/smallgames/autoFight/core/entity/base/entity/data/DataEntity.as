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
		private var _dirctoin:Number;
		public function get dirction():Number
		{
			return _dirctoin;
		}
		private var _dirctionLast:Number;
		public function get dirctionLast():Number
		{
			return _dirctionLast;
		}
		public function get isDirctionChange():Boolean
		{
			return Math.abs(_dirctionLast - _dirctoin) > .1;
		}
		//
		private var _location:Point;
		public function get location():Point
		{
			return _location;
		}
		private var _locationLast:Point;
		public function get locationLast():Point
		{
			return _locationLast;
		}
		public function get isLoactionChange():Boolean
		{
			return !location.equals(locationLast);
		}
		//
		private var _isFirstDrow:Boolean = true;
		public function get isFirstDrow():Boolean
		{
			var _isFirstDrow2:Boolean = _isFirstDrow;
			_isFirstDrow = false;
			return _isFirstDrow2;
		}
		
		public function DataEntity()
		{
			_location = new Point();
			_dirctoin = 0;
		}
		/**按指定量偏移位置*/
		public function locationOffset(dx:Number, dy:Number):void
		{
			if(!_locationLast)
			{
				_locationLast = new Point(dx,dy);
			}
			else
			{
				_locationLast.copyFrom(_location);
			}
			_location.offset(dx,dy);
		}
		/**按指定量偏移方向*/
		public function dirctionOffset(value:Number):void
		{
			if(isNaN(_dirctionLast))
			{
				_dirctionLast = value;
			}
			else
			{
				_dirctionLast = _dirctoin;
			}
			_dirctoin += value;
		}
	}
}