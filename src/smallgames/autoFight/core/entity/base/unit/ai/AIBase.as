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
			if (_timeNow > _timeNext)
			{
				interval = dataUnit.configUnit.interval;
				_timeNext = _timeNow + UtilRandom.randomWave(interval);
				thinkByTime();
			}
			else if (dataUnit.isNeedThink)
			{
				var interval:int = dataUnit.configUnit.interval;
				_timeNext = _timeNow + UtilRandom.randomWave(interval);
				thinkByTrigger();
			}
		}
		
		public function thinkByTime():void
		{
			var dataUnit:IDataUnit = _unit.dataUnit;
			if(dataUnit.target)
			{
				return;
			}
			var values:Vector.<int> = new <int>[ConstEntity.UNIT_ACTION_00,ConstEntity.UNIT_ACTION_01,ConstEntity.UNIT_ACTION_02,ConstEntity.UNIT_ACTION_03];
			var probabilityDistribution:Vector.<Number> = new <Number>[.1,.2,.2,.5];
			var idActionRandomPitchUpon:Number = UtilRandom.randomPitchUpon(values,probabilityDistribution);
			dataUnit.idAction = idActionRandomPitchUpon;
			dataUnit.idAction = 2;
			switch (idActionRandomPitchUpon)
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
			if (target)
			{
				var dirctoin:Number = dataUnit.dirctoinTargetByTarget;
				if (!dataUnit.isDirctionEquals(dirctoin))
				{
					dataUnit.dirctionTarget = dirctoin;
					dataUnit.idAction = ConstEntity.UNIT_ACTION_01;
				}
				else if (!dataUnit.isAtkRangeReached)
				{
					dataUnit.locationTarget = target.data.location;
					dataUnit.idAction = ConstEntity.UNIT_ACTION_02;
				}
				else
				{
					dataUnit.idAction = ConstEntity.UNIT_ACTION_04;
				}
			}
			else
			{
				/*thinkByTime();*/
			}
		}
	}
}