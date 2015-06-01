package smallgames.autoFight.core.entity.base.unit
{
	import smallgames.autoFight.core.entity.base.entity.Entity;
	import smallgames.autoFight.core.entity.base.entity.data.IDataEntity;
	import smallgames.autoFight.core.entity.base.unit.action.ActionBase;
	import smallgames.autoFight.core.entity.base.unit.ai.AIBase;
	import smallgames.autoFight.core.entity.base.unit.data.IDataUnit;

	public class Unit extends Entity implements IUnit
	{
		public function get dataUnit():IDataUnit
		{
			return data as IDataUnit;
		}
		
		override protected function get isNeedDrow():Boolean
		{
			return dataUnit.isAlive && super.isNeedDrow;
		}
		
		protected function get aiBase():AIBase
		{
			return null;
		}
		
		protected function get actionBase():ActionBase
		{
			return null;
		}
		
		public function Unit(value:IDataEntity)
		{
			super(value);
		}
		
		override protected function updateData(timeDiff:int):void
		{
			/*trace("Unit.updateByTime(timeDiff) 单位："+this);*/
			aiBase ? aiBase.think(timeDiff) : null;
			actionBase ? actionBase.execute(timeDiff) : null;
		}
	}
}