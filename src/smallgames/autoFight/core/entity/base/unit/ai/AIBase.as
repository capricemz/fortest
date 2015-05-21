package smallgames.autoFight.core.entity.base.unit.ai
{
	import smallgames.autoFight.common.random.UtilRandom;
	import smallgames.autoFight.core.entity.ConstEntity;
	import smallgames.autoFight.core.entity.ManagerEntity;
	import smallgames.autoFight.core.entity.base.unit.IUnit;

	public class AIBase
	{
		/**思考时间间隔*/		
		private const SPACING_INTERVAL:int = 3000;
		
		private var _timeNow:int;
		private var _timeNext:int = -SPACING_INTERVAL;
		
		private var _unit:IUnit;
		
		private var _beAtk:int;
		public function set beAtk(value:int):void
		{
			_beAtk = value;
		}
		
		public function AIBase(user:IUnit)
		{
			_unit = user;
		}
		
		public function think(timeDiff:int):void
		{
			_timeNow += timeDiff;
			if(_timeNow > _timeNext)
			{
				_timeNext = _timeNow + UtilRandom.randomWave(SPACING_INTERVAL);
				
				var value:int = int(Math.random()*ConstEntity.UNIT_ACTION_TOTAL);
				if(value == ConstEntity.UNIT_ACTION_02)
				{
					var target:IUnit;
					var targets:IUnit = ManagerEntity.instance.listUnit as IUnit;
					while(targets)
					{
						var targetTemp:IUnit = targets as IUnit;
						targets = targets.next as IUnit;
						if(targetTemp != _unit && Math.random() < .5)
						{
							target = targetTemp;
							break;
						}
					}
					if(target)
					{
						_unit.dataUnit.target = target;
					}
				}
				_unit.dataUnit.idAction = value;
			}
		}
	}
}