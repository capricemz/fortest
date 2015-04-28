package smallgames.autoFight.core.entity.base
{
	import smallgames.autoFight.core.entity.ai.AIBase;
	import smallgames.autoFight.core.entity.ai.IAIUser;

	public class Unit extends Entity implements IUnit,IAIUser
	{
		private var _ai:AIBase;
		
		public function get action():String
		{
			return "";
		}
		
		public function Unit()
		{
			super();
			_ai = new AIBase(this);
		}
		
		override public function updateByTime(timeDiff:int):void
		{
			super.updateByTime(timeDiff);
			/*trace("Unit.updateByTime(timeDiff) 单位："+this);*/
			_ai.think(timeDiff);
		}
		
		public function actionSet(value:int):void
		{
			
		}
	}
}