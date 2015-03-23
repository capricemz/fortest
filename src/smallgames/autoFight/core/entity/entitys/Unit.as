package smallgames.autoFight.core.entity.entitys
{
	import smallgames.autoFight.core.entity.entitys.interfaces.IUnit;

	public class Unit extends Entity implements IUnit
	{
		public function Unit()
		{
			
		}
		
		override public function updateByTime(timeDiff:int):void
		{
			super.updateByTime(timeDiff);
			trace("Unit.updateByTime(timeDiff) 单位："+this);
		}
	}
}