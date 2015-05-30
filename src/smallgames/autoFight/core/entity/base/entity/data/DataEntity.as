package smallgames.autoFight.core.entity.base.entity.data
{
	import flash.geom.Point;
	
	import smallgames.autoFight.data.configs.subs.ConfigEntity;

	/**
	 * 实体数据类
	 * @author Administrator
	 */	
	public class DataEntity implements IDataEntity
	{
		private static const CHECK_ANGLE:Number = .3;
		private static const CHECK_DISTANCE:Number = .01;
		
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
		public function get configEntity():ConfigEntity
		{
			return null;
		}
		//角度相关
		private var _dirction:Number;
		public function get dirction():Number
		{
			return _dirction;
		}
		private var _dirctionLast:Number;
		public function get dirctionLast():Number
		{
			return _dirctionLast;
		}
		public function get isDirctionChange():Boolean
		{
			var number:Number = (_dirctionLast - _dirction)*180/Math.PI;
			return number < -CHECK_ANGLE || number > CHECK_ANGLE;
		}
		//位置相关
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
			var subtract:Point = locationLast.subtract(location);
			return (subtract.x < -CHECK_DISTANCE || subtract.x > CHECK_DISTANCE) || (subtract.y < -CHECK_DISTANCE || subtract.y > CHECK_DISTANCE);
		}
		//绘制相关
		private var _isFirstDrow:Boolean = true;
		public function get isFirstDrow():Boolean
		{
			var _isFirstDrow2:Boolean = _isFirstDrow;
			_isFirstDrow = false;
			return _isFirstDrow2;
		}
		
		public function DataEntity()
		{
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
				_dirctionLast = _dirction;
			}
			if(isNaN(_dirction))
			{
				_dirction = 0;
			}
			_dirction += value;
		}
		/**方向是否相等*/
		public function isDirctionEquals(value:Number):Boolean
		{
			var number:Number = (_dirction - value)*180/Math.PI;
			return number > -CHECK_ANGLE && number < CHECK_ANGLE;
		}
		/**按指定量偏移位置*/
		public function locationOffset(dx:Number, dy:Number):void
		{
			if(!_locationLast)
			{
				_locationLast = new Point(configEntity.length*.5+dx,configEntity.length*.5+dy);
			}
			else
			{
				_locationLast.copyFrom(_location);
			}
			if(!_location)
			{
				_location = new Point(configEntity.length*.5,configEntity.length*.5);
			}
			_location.offset(dx,dy);
		}
		/**位置是否相等*/
		public function isLocationEquals(value:Point):Boolean
		{
			var subtract:Point = _location.subtract(value);
			return (subtract.x > -CHECK_DISTANCE && subtract.x < CHECK_DISTANCE) && (subtract.y > -CHECK_DISTANCE && subtract.y < CHECK_DISTANCE);
		}
	}
}