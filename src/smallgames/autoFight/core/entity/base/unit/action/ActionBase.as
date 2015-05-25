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

	/**
	 * 基础动作类
	 * @author Administrator
	 */	
	public class ActionBase
	{
		private var _unit:IUnit;
		private var _executes:Dictionary;
		private var _timeNow:int;
		private var _timeNext:int;
		
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
			var dataUnit:IDataUnit = _unit.dataUnit;
			var idAction:int = dataUnit.idAction;
			if(dataUnit.isIdActionChange)
			{
				var duration:int = dataUnit.configAction.duration;
				_timeNext = _timeNow + UtilRandom.randomWave(duration);
			}
			var funcAction:Function = _executes[idAction] as Function;
			if(funcAction == null)
			{
				throw new Error("对应的动作不存在");
			}
			funcAction();
			_timeNow += timeDiff;
			if(_timeNow > _timeNext)
			{
				_timeNext = 0;
				if(dataUnit.idActionNext != ConstEntity.UNIT_ACTION_NULL)
				{
					dataUnit.idAction = dataUnit.idActionNext;
					dataUnit.idActionNext = ConstEntity.UNIT_ACTION_NULL;
				}
			}
		}
		/**休息*/
		private function rest():void
		{
			var dataUnit:IDataUnit = _unit.dataUnit;
			dataUnit.target = null;
		}
		/**转向*/
		private function turn():void
		{
			if(dataUnit.dirctionTarget == Number.NaN)
			{
				dataUnit.dirctionTarget = -Math.PI + 2*Math.PI*Math.random();
			}
			var dataUnit:IDataUnit = _unit.dataUnit;
			if(dataUnit.dirctionTarget != dataUnit.dirction)
			{
				dataUnit.dirction = ;
			}
		}
		/**移动*/
		private function move():void
		{
			var dataUnit:IDataUnit = _unit.dataUnit;
			var speed:int = dataUnit.configUnit.speed;
			var stageFrameRate:int = ManagerTime.instance.stageFrameRate;
			var speedPerFrame:Number = speed/stageFrameRate;
			var sin:Number = Math.sin(dataUnit.dirction);
			var cos:Number = Math.cos(dataUnit.dirction);
			dataUnit.locationOffset(sin*speedPerFrame,cos*speedPerFrame);
		}
		/**观察*/
		private function observe():void
		{
			var dataUnit:IDataUnit = _unit.dataUnit;
			if(dataUnit.target && dataUnit.target.dataUnit.isAlive)
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
				_unit.dataUnit.dirction = dirctoin;
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