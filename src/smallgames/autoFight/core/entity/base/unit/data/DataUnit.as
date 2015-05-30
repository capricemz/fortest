package smallgames.autoFight.core.entity.base.unit.data
{
	import flash.geom.Point;
	
	import smallgames.autoFight.common.random.UtilRandom;
	import smallgames.autoFight.core.entity.ConstEntity;
	import smallgames.autoFight.core.entity.base.entity.data.DataEntity;
	import smallgames.autoFight.core.entity.base.unit.IUnit;
	import smallgames.autoFight.data.configs.ConstConfig;
	import smallgames.autoFight.data.configs.ManagerConfig;
	import smallgames.autoFight.data.configs.subs.ConfigAction;
	import smallgames.autoFight.data.configs.subs.ConfigEntity;
	import smallgames.autoFight.data.configs.subs.ConfigUnit;

	/**
	 * 单位数据类
	 * @author Administrator
	 */	
	public class DataUnit extends DataEntity implements IDataUnit
	{
		override public function get configEntity():ConfigEntity
		{
			return configUnit;
		}
		public function get configUnit():ConfigUnit
		{
			var config:ConfigUnit = ManagerConfig.instance.notify(ConstConfig.HANDLE_GET,ConstConfig.TYPE_UNIT,type) as ConfigUnit;
			return config;
		}
		//动作相关
		private var _idAction:int = ConstEntity.UNIT_ACTION_00;
		public function get idAction():int
		{
			return _idAction;
		}
		public function set idAction(value:int):void
		{
			_idActionLast = _idAction;
			_idAction = value;
		}
		private var _idActionLast:int = ConstEntity.UNIT_ACTION_NULL;
		public function get isIdActionChange():Boolean
		{
			return _idAction != _idActionLast || _idActionLast == ConstEntity.UNIT_ACTION_NULL;
		}
		public function get isActionOverByTime():Boolean
		{
			return configAction.duration != 0;
		}
		public function get configAction():ConfigAction
		{
			var config:ConfigAction = ManagerConfig.instance.notify(ConstConfig.HANDLE_GET,ConstConfig.TYPE_ACTOIN,_idAction) as ConfigAction;
			return config;
		}
		private var _idActionNext:int = ConstEntity.UNIT_ACTION_NULL;
		public function get idActionNext():int
		{
			return _idActionNext;
		}
		public function set idActionNext(value:int):void
		{
			_idActionNext = value;
		}
		//目标相关
		private var _target:IUnit = null;
		public function get target():IUnit
		{
			if(_target && !_target.dataUnit.isAlive)
			{
				_target = null;
			}
			return _target;
		}
		public function set target(value:IUnit):void
		{
			_target = value;
		}
		//角度相关
		private var _dirctionTarget:Number;
		public function get dirctionTarget():Number
		{
			return _dirctionTarget;
		}
		public function set dirctionTarget(value:Number):void
		{
			_dirctionTarget = value;
		}
		public function get isDirctionTargetReached():Boolean
		{
			return isDirctionEquals(_dirctionTarget);
		}
		public function get dirctoinTargetByTarget():Number
		{
			if(!target)
			{
				return dirctoin;
			}
			var subtract:Point = target.dataUnit.location.subtract(location);
			var dirctoin:Number = Math.atan2(subtract.y,subtract.x);
			return dirctoin;
		}
		//位置相关
		private var _locationTarget:Point;
		public function get locationTarget():Point
		{
			return _locationTarget;
		}
		public function set locationTarget(value:Point):void
		{
			_locationTarget = value;
		}
		public function get isLocationTargetReached():Boolean
		{
			if(!_locationTarget)
			{
				return false;
			}
			return isLocationEquals(_locationTarget);
		}
		public function get isAtkRangeReached():Boolean
		{
			if(!_target)
			{
				return false;
			}
			var subtract:Point = _target.dataUnit.location.subtract(location);
			var atkRange:int = configUnit.atkRange;
			return subtract.length <= atkRange;
		}
		//AI相关
		private var _isNeedThink:Boolean;
		public function get isNeedThink():Boolean
		{
			var _isNeedThink2:Boolean = _isNeedThink;
			_isNeedThink = false;
			return _isNeedThink2;
		}
		public function set isNeedThink(value:Boolean):void
		{
			_isNeedThink = value;
		}
		//属性相关
		private var _attrHp:int;
		public function get attrHp():int
		{
			return _attrHp;
		}
		public function set attrHp(value:int):void
		{
			_attrHp = value;
		}
		private var _attrHpMax:int;
		public function get attrHpMax():int
		{
			if(!_attrHpMax)
			{
				_attrHpMax = UtilRandom.randomWave(configUnit.hp);
				_attrHp = _attrHpMax;
			}
			return _attrHpMax;
		}
		private var _attrAtkMax:int;
		public function get attrAtkMax():int
		{
			if(!_attrAtkMax)
			{
				_attrAtkMax = UtilRandom.randomWave(configUnit.atk);
			}
			return _attrAtkMax;
		}
		private var _attrAtkImport:int;
		public function get attrAtkImport():Number
		{
			return _attrAtkImport;
		}
		public function set attrAtkImport(value:Number):void
		{
			_attrAtkImport = Math.ceil(value);
		}
		public function get isAlive():Boolean
		{
			return _attrHp > 0;
		}
		
		public function DataUnit()
		{
			super();
		}
	}
}