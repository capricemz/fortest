package smallgames.autoFight.core.entity.base.unit
{
	import smallgames.autoFight.core.entity.base.entity.Entity;
	import smallgames.autoFight.core.entity.base.unit.action.ActionBase;
	import smallgames.autoFight.core.entity.base.unit.ai.AIBase;
	import smallgames.autoFight.core.entity.base.unit.ai.IAIUser;
	import smallgames.autoFight.core.entity.base.unit.data.IDataUnit;
	import smallgames.autoFight.data.configs.ManagerConfig;
	import smallgames.autoFight.data.configs.subs.ConfigAction;

	public class Unit extends Entity implements IUnit,IAIUser
	{
		private var _ai:AIBase;
		private var _actoin:ActionBase;
		
		private var _actionId:int;
		public function get action():String
		{
			var configAction:ConfigAction = ManagerConfig.instance.configAction(_actionId);
			if(!configAction)
			{
				throw new Error("ConfigAction配置错误");
			}
			return configAction.action;
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
		
		public function get dataUnit():IDataUnit
		{
			return data as IDataUnit;
		}
		
		public function Unit()
		{
			super();
			_ai = new AIBase(this);
			_actoin = new ActionBase(this);
		}
		
		override public function updateByTime(timeDiff:int):void
		{
			super.updateByTime(timeDiff);
			/*trace("Unit.updateByTime(timeDiff) 单位："+this);*/
			_ai.think(timeDiff);
			_actoin.execute(_actionId);
		}
		
		public function actionSet(actionId:int):void
		{
			_actionId = actionId;
		}
	}
}