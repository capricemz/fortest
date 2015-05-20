package smallgames.autoFight.core.entity.base.unit.data
{
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
		private var _unitId:int;
		public function get unitId():int
		{
			return _unitId;
		}
		public function set unitId(value:int):void
		{
			_unitId = value;
		}
		
		public function get configUnit():ConfigUnit
		{
			var config:ConfigUnit = ManagerConfig.instance.notify(ConstConfig.HANDLE_GET,ConstConfig.TYPE_UNIT,_unitId) as ConfigUnit;
			return config;
		}
		//
		private var _actionId:int = ConstEntity.UNIT_ACTION_00;
		public function get actionId():int
		{
			return _actionId;
		}
		public function set actionId(value:int):void
		{
			_actionId = value;
		}
		
		public function get configAction():ConfigAction
		{
			var config:ConfigAction = ManagerConfig.instance.notify(ConstConfig.HANDLE_GET,ConstConfig.TYPE_ACTOIN,_actionId) as ConfigAction;
			return config;
		}
		//
		private var _hp:int;
		public function get hp():int
		{
			return _hp;
		}
		public function set hp(value:int):void
		{
			_hp = value;
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
		//
		private var _atk:int;
		public function get atk():int
		{
			return _atk;
		}
		public function set atk(value:int):void
		{
			_atk = value;
		}
		
		public function DataUnit()
		{
			super();
		}
	}
}