package smallgames.autoFight.core.entity.base.unit.data
{
	import smallgames.autoFight.common.random.UtilRandom;
	import smallgames.autoFight.core.entity.ConstEntity;
	import smallgames.autoFight.core.entity.base.entity.data.DataEntity;
	import smallgames.autoFight.core.entity.base.unit.IUnit;
	import smallgames.autoFight.data.configs.ConstConfig;
	import smallgames.autoFight.data.configs.ManagerConfig;
	import smallgames.autoFight.data.configs.subs.ConfigAction;
	import smallgames.autoFight.data.configs.subs.ConfigUnit;

	/**
	 * 单位数据类
	 * @author Administrator
	 */	
	public class DataUnit extends DataEntity implements IDataUnit
	{
		public function get configUnit():ConfigUnit
		{
			var config:ConfigUnit = ManagerConfig.instance.notify(ConstConfig.HANDLE_GET,ConstConfig.TYPE_UNIT,type) as ConfigUnit;
			return config;
		}
		//
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
		//
		private var _attrHp:int;
		public function get attrHp():int
		{
			return _attrHp;
		}
		public function set attrHp(value:int):void
		{
			_attrHp = value;
		}
		
		public function get isAlive():Boolean
		{
			return _attrHp > 0;
		}
		//
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
		//
		private var _attrAtkMax:int;
		public function get attrAtkMax():int
		{
			if(!_attrAtkMax)
			{
				_attrAtkMax = UtilRandom.randomWave(configUnit.atk);
			}
			return _attrAtkMax;
		}
		//
		private var _dirctoin:Number = 0;
		public function get dirction():Number
		{
			return _dirctoin;
		}
		public function set dirction(value:Number):void
		{
			_dirctoin = value;
		}
		private var _dirctionLast:Number;
		private var _dirctionTarget:Number = Number.POSITIVE_INFINITY;
		public function get dirctionTarget():Number
		{
			return _dirctionTarget;
		}
		public function set dirctionTarget(value:Number):void
		{
			_dirctionTarget = value;
		}
		
		override public function get isNeedDrow():Boolean
		{
			return super.isNeedDrow || isNeedRotate;
		}
		/**是否需要旋转*/
		public function get isNeedRotate():Boolean
		{
			return _dirctionTarget != Number.POSITIVE_INFINITY && Math.abs(_dirctionTarget - _dirctoin) > .1;
		}
		//
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
		
		public function DataUnit()
		{
			super();
		}
		
	}
}