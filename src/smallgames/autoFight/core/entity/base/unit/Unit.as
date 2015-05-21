package smallgames.autoFight.core.entity.base.unit
{
	import smallgames.autoFight.core.entity.base.entity.Entity;
	import smallgames.autoFight.core.entity.base.unit.action.ActionBase;
	import smallgames.autoFight.core.entity.base.unit.ai.AIBase;
	import smallgames.autoFight.core.entity.base.unit.data.IDataUnit;

	public class Unit extends Entity implements IUnit
	{
		private var _aiBase:AIBase;
		private var _actoinBase:ActionBase;
		
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
		
		override protected function updateData(timeDiff:int):void
		{
			/*trace("Unit.updateByTime(timeDiff) 单位："+this);*/
			_aiBase.think(timeDiff);
			_actoinBase.execute(dataUnit.idAction);
		}
	}
}