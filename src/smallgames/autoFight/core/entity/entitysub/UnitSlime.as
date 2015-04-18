package smallgames.autoFight.core.entity.entitysub
{
	import smallgames.autoFight.core.entity.entityBase.Unit;
	
	public class UnitSlime extends Unit implements IUnitSlime
	{
		override public function get name():String
		{
			return "史莱姆"+data.id;
		}
		
		public function UnitSlime()
		{
			super();
		}
		
		override public function updateByTime(timeDiff:int):void
		{
			super.updateByTime(timeDiff);
			trace("UnitSlime.updateByTime(timeDiff) 我是一只史莱姆，"+data.id);
		}
	}
}