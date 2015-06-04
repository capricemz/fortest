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
			if (dataUnit.isNeedThink)
			{
				var interval:int = dataUnit.configUnit.interval;
				_timeNext = _timeNow + UtilRandom.randomWave(interval);
				thinkByTrigger();
				return;
			}
			if (_timeNow > _timeNext)
			{
				interval = dataUnit.configUnit.interval;
				_timeNext = _timeNow + UtilRandom.randomWave(interval);
				thinkByTime();
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
			/*idActionRandomPitchUpon = 3;*///测试代码
			dataUnit.idAction = idActionRandomPitchUpon;
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
				if(!dataUnit.isAlive)
				{
					dataUnit.idAction = ConstEntity.UNIT_ACTION_08;
					return;
				}
				if(dataUnit.attrAtkImport)
				{
					dataUnit.idAction = ConstEntity.UNIT_ACTION_07;
					return;
				}
				var dirctoin:Number = dataUnit.dirctionTargetByTarget;
				if (!dataUnit.isDirctionEquals(dirctoin))
				{
					dataUnit.dirctionTarget = dirctoin;
					dataUnit.idAction = ConstEntity.UNIT_ACTION_01;
					return;
				}
				if (!dataUnit.isAtkRangeReached)
				{
					dataUnit.locationTarget = target.data.location;
					dataUnit.idAction = ConstEntity.UNIT_ACTION_02;
					return;
				}
				dataUnit.idAction = ConstEntity.UNIT_ACTION_04;
			}
			else
			{
				thinkByTime();
			}
		}
	}
}