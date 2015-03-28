package smallgames.autoFight.core.entity.entitysub
{
	import smallgames.autoFight.core.entity.entityBase.Unit;
	
	public class UnitSlime extends Unit implements IUnitSlime
	{
		public function UnitSlime()
		{
			super();
		}
		
		override public function updateByTime(timeDiff:int):void
		{
			super.updateByTime(timeDiff);
			trace("UnitSlime.updateByTime(timeDiff) 我是一只史莱姆，"+this);
		}
	}
}