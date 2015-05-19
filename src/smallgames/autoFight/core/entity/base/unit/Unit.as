package smallgames.autoFight.core.entity.base.unit
{
	import smallgames.autoFight.core.entity.ConstEntity;
	import smallgames.autoFight.core.entity.base.entity.Entity;
	import smallgames.autoFight.core.entity.base.unit.action.ActionBase;
	import smallgames.autoFight.core.entity.base.unit.ai.AIBase;
	import smallgames.autoFight.core.entity.base.unit.data.IDataUnit;

	public class Unit extends Entity implements IUnit
	{
		private var _aiBase:AIBase;
		private var _actoinBase:ActionBase;
		
		private var _actionId:int = ConstEntity.UNIT_ACTION_00;
		public function get actionId():int
		{
			return _actionId;
		}
		public function set actionId(value:int):void
		{
			_actionId = value;
		}
		
		protected var _target:IUnit = null;
		public function get target():IUnit
		{
			return _target;
		}
		public function set target(value:IUnit):void
		{
			_target = value;
		}
		
		public function get dataUnit():IDataUnit
		{
			return data as IDataUnit;
		}
		
		public function Unit()
		{
			super();
			_aiBase = new AIBase(this);
			_actoinBase = new ActionBase(this);
		}
		
		override public function updateByTime(timeDiff:int):void
		{
			super.updateByTime(timeDiff);
			/*trace("Unit.updateByTime(timeDiff) 单位："+this);*/
			_aiBase.think(timeDiff);
			_actoinBase.execute(_actionId);
		}
	}
}