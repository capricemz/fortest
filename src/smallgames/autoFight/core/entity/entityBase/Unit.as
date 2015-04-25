package smallgames.autoFight.core.entity.entityBase
{

	public class Unit extends Entity implements IUnit
	{
		public function get action():String
		{
			return "";
		}
		
		public function Unit()
		{
			
		}
		
		override public function updateByTime(timeDiff:int):void
		{
			super.updateByTime(timeDiff);
			/*trace("Unit.updateByTime(timeDiff) 单位："+this);*/
		}
	}
}