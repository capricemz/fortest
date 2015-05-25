package smallgames.autoFight.core.entity.base.unit.ai
{
	import smallgames.autoFight.common.random.UtilRandom;
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
			_timeNow += timeDiff;
			if(_timeNow > _timeNext)
			{
				var dataUnit:IDataUnit = _unit.dataUnit;
				var interval:int = dataUnit.configUnit.interval;
				_timeNext = _timeNow + UtilRandom.randomWave(interval);
				
				var value:int = int(Math.random()*3)/*int(Math.random()*ConstEntity.UNIT_ACTION_TOTAL)*/;
				_unit.dataUnit.idAction = value;
			}
		}
	}
}