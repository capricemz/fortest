package smallgames.autoFight.core.entity.base.unit
{
	import smallgames.autoFight.core.entity.ManagerEntity;
	import smallgames.autoFight.core.entity.base.unit.ai.AIBase;
	import smallgames.autoFight.core.entity.base.unit.ai.IAIUser;
	import smallgames.autoFight.data.configs.ManagerConfig;
	import smallgames.autoFight.data.configs.subs.ConfigAction;
	import smallgames.autoFight.core.entity.base.entity.Entity;
	import smallgames.autoFight.core.entity.base.unit.data.IDataUnit;

	public class Unit extends Entity implements IUnit,IAIUser
	{
		private var _ai:AIBase;
		
		public function get hp():String
		{
			return (data as IDataUnit).hp + "";
		}
		
		private var _actionId:int;
		private var _configAction:ConfigAction;
		public function get action():String
		{
			return _configAction.action;
		}
		
		protected var _target:IUnit;
		public function get target():IUnit
		{
			return _target;
		}
		public function set target(value:IUnit):void
		{
			_target = value;
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
		
		public function actionSet(actionId:int):void
		{
			_actionId = actionId;
			_configAction = ManagerConfig.instance.configAction(_actionId);
			if(!_configAction)
			{
				throw new Error("ConfigAction配置错误");
			}
		}
	}
}