package smallgames.autoFight.core.entity.base
{
	import smallgames.autoFight.core.entity.StringEntity;
	import smallgames.autoFight.core.entity.ai.AIBase;
	import smallgames.autoFight.core.entity.ai.IAIUser;

	public class Unit extends Entity implements IUnit,IAIUser
	{
		protected var _action:String = "";
		private var _ai:AIBase;
		
		public function get action():String
		{
			return _action;
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
			_action = StringEntity.action(value);
		}
	}
}