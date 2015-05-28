package smallgames.autoFight.core.entity.base.unit.ai
{
	import smallgames.autoFight.common.random.UtilRandom;
	import smallgames.autoFight.core.entity.ConstEntity;
	import smallgames.autoFight.core.entity.base.unit.IUnit;
	import smallgames.autoFight.core.entity.base.unit.data.IDataUnit;

	public class AIBase
	{
		private var _unit:IUnit;
		private var _timeNow:int;
		private var _timeNext:int;
		
		public function AIBase(user:IUnit)
		{
			_unit = user;
		}
		
		public function think(timeDiff:int):void
		{
			var dataUnit:IDataUnit = _unit.dataUnit;
			_timeNow += timeDiff;
			if(dataUnit.isNeedThink)
			{
				dataUnit.dirctionTarget = UtilRandom.randomBetween(-Math.PI,Math.PI);
			}
			else if(_timeNow > _timeNext)
			{
				var interval:int = dataUnit.configUnit.interval;
				_timeNext = _timeNow + UtilRandom.randomWave(interval);
				var value:int = int(Math.random()*3);
				value = 1;
				dataUnit.idAction = value;
				dataUnit.idActionNext = ConstEntity.UNIT_ACTION_00;
				switch (value)
				{
					case ConstEntity.UNIT_ACTION_00:
						break;
					case ConstEntity.UNIT_ACTION_01:
						dataUnit.dirctionTarget = UtilRandom.randomBetween(-Math.PI,Math.PI);
						break;
					case ConstEntity.UNIT_ACTION_02:
						break;
					default:
						break;
				}
			}
		}
	}
}