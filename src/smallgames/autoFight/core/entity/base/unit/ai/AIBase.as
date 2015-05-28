package smallgames.autoFight.core.entity.base.unit.ai
{
	import flash.geom.Point;
	
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
				thinkByTrigger();
			}
			else if(_timeNow > _timeNext)
			{
				var interval:int = dataUnit.configUnit.interval;
				_timeNext = _timeNow + UtilRandom.randomWave(interval);
				thinkByTime();
			}
		}
		
		public function thinkByTime():void
		{
			var dataUnit:IDataUnit = _unit.dataUnit;
			var value:int = int(Math.random()*4);
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
		
		public function thinkByTrigger():void
		{
			var dataUnit:IDataUnit = _unit.dataUnit;
			var target:IUnit = dataUnit.target;
			if(target)
			{
				var subtract:Point = dataUnit.location.subtract(target.data.location);
				var dirctoin:Number = Math.atan2(subtract.y,subtract.x);
				if(!dataUnit.isDirctionEquals(dirctoin))
				{
					dataUnit.dirctionTarget = dirctoin;
					dataUnit.idAction = ConstEntity.UNIT_ACTION_01;
				}
				else if(!dataUnit.isLocationEquals(target.data.location))
				{
					dataUnit.locationTarget = target.data.location;
					dataUnit.idAction = ConstEntity.UNIT_ACTION_01;
				}
				else
				{
					dataUnit.idAction = ConstEntity.UNIT_ACTION_04;
				}
			}
			else
			{
				thinkByTime();
			}
		}
	}
}