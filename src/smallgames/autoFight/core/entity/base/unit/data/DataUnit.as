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
		private var _idActionLast:int = -1;
		public function get isIdActionChange():Boolean
		{
			return _idAction != _idActionLast || _idActionLast == -1;
		}
		public function get configAction():ConfigAction
		{
			var config:ConfigAction = ManagerConfig.instance.notify(ConstConfig.HANDLE_GET,ConstConfig.TYPE_ACTOIN,_idAction) as ConfigAction;
			return config;
		}
		private var _idActionNext:int;
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
		private var _dirctionTarget:Number
		public function get dirctionTarget():Number
		{
			return _dirctionTarget;
		}
		public function set dirctionTarget(value:Number):void
		{
			_dirctionTarget = value;
		}
		//
		private var _target:IUnit = null;
		public function get target():IUnit
		{
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