package smallgames.autoFight.core.entity.base
{
	import smallgames.autoFight.core.entity.ManagerEntity;
	import smallgames.autoFight.core.entity.StringEntity;
	import smallgames.autoFight.core.entity.sub.unit.ai.AIBase;
	import smallgames.autoFight.core.entity.sub.unit.ai.IAIUser;
	import smallgames.autoFight.core.entity.data.IDataUnit;

	public class Unit extends Entity implements IUnit,IAIUser
	{
		private var _ai:AIBase;
		
		public function get hp():String
		{
			return (data as IDataUnit).hp + "";
		}
		
		protected var _action:String = "";
		public function get action():String
		{
			return _action;
		}
		
		protected var _target:IUnit;
		public function get target():IUnit
		{
			return _target;
		}
		
		protected var _beAtk:int;
		public function set beAtk(value:int):void
		{
			_beAtk = value;
			_ai.beAtk = value;
		}
		
		private function get dataUnit():IDataUnit
		{
			return data as IDataUnit;
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
			//
			if(_beAtk)
			{
				beHurt();
			}
		}
		
		public function beHurt():void
		{
			var data:IDataUnit = dataUnit;
			data.hp -= _beAtk;
			if(data.hp < 0)
			{
				ManagerEntity.instance.destroyEntity(this);
			}
			_beAtk = 0;
		}
		
		public function actionSet(action:int,target:IUnit):void
		{
			_action = StringEntity.action(action);
			_target = target;
		}
	}
}