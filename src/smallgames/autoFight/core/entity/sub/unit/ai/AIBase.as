package smallgames.autoFight.core.entity.sub.unit.ai
{
	import smallgames.autoFight.common.random.UtilRandom;
	import smallgames.autoFight.core.entity.ConstEntity;
	import smallgames.autoFight.core.entity.ManagerEntity;
	import smallgames.autoFight.core.entity.base.IUnit;
	import smallgames.autoFight.core.entity.data.IDataUnit;

	public class AIBase
	{
		/**思考时间间隔*/		
		private const SPACING_INTERVAL:int = 3000;
		
		private var _timeNow:int;
		private var _timeNext:int = -SPACING_INTERVAL;
		private var _user:IAIUser;
		
		private var _beAtk:int;
		public function set beAtk(value:int):void
		{
			_beAtk = value;
		}
		
		public function AIBase(user:IAIUser)
		{
			_user = user;
		}
		
		public function think(timeDiff:int):void
		{
			_timeNow += timeDiff;
			if(_timeNow > _timeNext)
			{
				_timeNext = _timeNow + UtilRandom.randomWave(SPACING_INTERVAL);
				var value:int = int(Math.random()*ConstEntity.UNIT_ACTION_TOTAL);
				if(value == ConstEntity.UNIT_ACTION_03)
				{
					var target:IUnit;
					var targets:IUnit = ManagerEntity.instance.listUnit as IUnit;
					while(targets)
					{
						var targetTemp:IUnit = targets as IUnit;
						targets = targets.next as IUnit;
						if(targetTemp != _user && Math.random() < .5)
						{
							target = targetTemp;
							break;
						}
					}
					if(target)
					{
						_user.actionSet(value,target);
						var atk:int = ((_user as IUnit).data as IDataUnit).atk;
						(target as IAIUser).beAtk = atk;
					}
				}
				else
				{
					_user.actionSet(value,null);
				}
			}
		}
	}
}