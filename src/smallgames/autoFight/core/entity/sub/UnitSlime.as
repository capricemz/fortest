package smallgames.autoFight.core.entity.sub
{
	import smallgames.autoFight.core.entity.StringEntity;
	import smallgames.autoFight.core.entity.base.Unit;
	
	public class UnitSlime extends Unit implements IUnitSlime
	{
		override public function get name():String
		{
			return StringEntity.UNIT_SLIME+data.id;
		}
		
		private var _action:String = "";
		override public function get action():String
		{
			return _action;
		}
		
		public function UnitSlime()
		{
			super();
		}
		
		override public function updateByTime(timeDiff:int):void
		{
			super.updateByTime(timeDiff);
			/*trace("UnitSlime.updateByTime(timeDiff) 我是一只史莱姆，"+data.id);*/
		}
		
		override public function actionSet(value:int):void
		{
			_action = StringEntity.action(value);
		}
	}
}