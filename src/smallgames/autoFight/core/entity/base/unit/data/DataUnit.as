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
			_idAction = value;
		}
		
		public function get configAction():ConfigAction
		{
			var config:ConfigAction = ManagerConfig.instance.notify(ConstConfig.HANDLE_GET,ConstConfig.TYPE_ACTOIN,_idAction) as ConfigAction;
			return config;
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
		//
		private var _attrAtk:int;
		public function get attrAtk():int
		{
			return _attrAtk;
		}
		public function set attrAtk(value:int):void
		{
			_attrAtk = value;
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