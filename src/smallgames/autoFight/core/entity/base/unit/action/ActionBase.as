package smallgames.autoFight.core.entity.base.unit.action
{
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import smallgames.autoFight.common.random.UtilRandom;
	import smallgames.autoFight.core.entity.ConstEntity;
	import smallgames.autoFight.core.entity.ManagerEntity;
	import smallgames.autoFight.core.entity.base.unit.IUnit;
	import smallgames.autoFight.core.entity.base.unit.data.IDataUnit;
	import smallgames.autoFight.core.time.ManagerTime;
	import smallgames.autoFight.data.configs.subs.ConfigUnit;

	/**
	 * 基础动作类
	 * @author Administrator
	 */	
	public class ActionBase
	{
		private var _unit:IUnit;
		private var _executes:Dictionary;
		private var _timeNow:int;
		private var _timeOver:int = int.MAX_VALUE;
		
		public function ActionBase(unit:IUnit)
		{
			_unit = unit;
			_executes = new Dictionary();
			_executes[ConstEntity.UNIT_ACTION_00] = rest;
			_executes[ConstEntity.UNIT_ACTION_01] = turn;
			_executes[ConstEntity.UNIT_ACTION_02] = move;
			_executes[ConstEntity.UNIT_ACTION_03] = observe;
			_executes[ConstEntity.UNIT_ACTION_04] = attack;
			_executes[ConstEntity.UNIT_ACTION_05] = dodge;
			_executes[ConstEntity.UNIT_ACTION_06] = parry;
			_executes[ConstEntity.UNIT_ACTION_07] = hurt;
			_executes[ConstEntity.UNIT_ACTION_08] = die;
		}
		/**
		 * 执行动作
		 * @param value 动作id
		 */		
		public function execute(timeDiff:int):void
		{
			_timeNow += timeDiff;
			var dataUnit:IDataUnit = _unit.dataUnit;
			if(_timeOver == int.MAX_VALUE && dataUnit.isIdActionChange && dataUnit.isActionOverByTime)
			{
				var duration:int = dataUnit.configAction.duration;
				_timeOver = _timeNow + UtilRandom.randomWave(duration);
			}
			if(_timeNow > _timeOver)
			{
				_timeOver = int.MAX_VALUE;
				if(dataUnit.idActionNext != ConstEntity.UNIT_ACTION_NULL)
				{
					dataUnit.idAction = dataUnit.idActionNext;
					dataUnit.idActionNext = ConstEntity.UNIT_ACTION_NULL;
				}
			}
			var funcAction:Function = _executes[dataUnit.idAction] as Function;
			if(funcAction == null)
			{
				throw new Error("对应的动作不存在");
			}
			funcAction();
		}
		/**休息*/
		private function rest():void
		{
			var dataUnit:IDataUnit = _unit.dataUnit;
			dataUnit.target = null;
			dataUnit.dirctionTarget = Number.POSITIVE_INFINITY;
		}
		/**转向*/
		private function turn():void
		{
			var dataUnit:IDataUnit = _unit.dataUnit;
			if(dataUnit.dirctionTarget == Number.POSITIVE_INFINITY)
			{
				dataUnit.dirctionTarget = -Math.PI + 2*Math.PI*Math.random();
			}
			var stageFrameRate:int = ManagerTime.instance.stageFrameRate;
			var palstance:Number = dataUnit.configUnit.palstance*Math.PI/360/stageFrameRate;
			var dirctionSub:Number = dataUnit.dirctionTarget - dataUnit.dirction;
			var dirctoinAbs:Number = Math.abs(dirctionSub);
			if (dirctoinAbs > palstance)
			{
				dataUnit.dirction += dirctionSub/dirctoinAbs*palstance;
			}
			else
			{
				dataUnit.dirctionTarget = Number.POSITIVE_INFINITY;
				dataUnit.idAction = dataUnit.target ? ConstEntity.UNIT_ACTION_02 : ConstEntity.UNIT_ACTION_00;
			}
		}
		/**移动*/
		private function move():void
		{
			var dataUnit:IDataUnit = _unit.dataUnit;
			var configUnit:ConfigUnit = dataUnit.configUnit;
			if(dataUnit.target)
			{
				var subtract:Point = dataUnit.location.subtract(dataUnit.target.dataUnit.location);
				if(subtract.length < configUnit.atkRange)
				{
					dataUnit.idAction = ConstEntity.UNIT_ACTION_04;
					return;
				}
			}
			var stageFrameRate:int = ManagerTime.instance.stageFrameRate;
			var speedPerFrame:Number = configUnit.speed/stageFrameRate;
			var sin:Number = Math.sin(dataUnit.dirction);
			var cos:Number = Math.cos(dataUnit.dirction);
			dataUnit.locationOffset(sin*speedPerFrame,cos*speedPerFrame);
		}
		/**观察*/
		private function observe():void
		{
			var dataUnit:IDataUnit = _unit.dataUnit;
			if(dataUnit.target)
			{
				return;
			}
			var target:IUnit;
			var targetTemp:IUnit;
			var targets:IUnit = ManagerEntity.instance.listUnit as IUnit;
			while(targets)
			{
				targetTemp = targets as IUnit;
				targets = targets.next as IUnit;
				if(targetTemp != _unit && Math.random() < .5)
				{
					target = targetTemp;
					break;
				}
			}
			if(target)
			{
				dataUnit.target = target;
				var subtract:Point = dataUnit.location.subtract(target.dataUnit.location);
				var dirctoin:Number = Math.atan2(subtract.y,subtract.x);
				dataUnit.dirctionTarget = dirctoin;
				dataUnit.idAction = ConstEntity.UNIT_ACTION_01;
			}
		}
		/**攻击*/
		private function attack():void
		{
			
		}
		/**闪躲*/
		private function dodge():void
		{
			
		}
		/**格挡*/
		private function parry():void
		{
			
		}
		/**受伤*/
		private function hurt():void
		{
			_unit.dataUnit.attrHp;
		}
		/**死亡*/
		private function die():void
		{
			if(_unit.dataUnit.attrHp < 0)
			{
				ManagerEntity.instance.destroyEntity(_unit);
			}
		}
	}
}