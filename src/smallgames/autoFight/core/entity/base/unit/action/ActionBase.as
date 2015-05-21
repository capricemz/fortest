package smallgames.autoFight.core.entity.base.unit.action
{
	import flash.utils.Dictionary;
	
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
		
		public function ActionBase(unit:IUnit)
		{
			_unit = unit;
			_executes = new Dictionary();
			_executes[ConstEntity.UNIT_ACTION_00] = stand;
			_executes[ConstEntity.UNIT_ACTION_01] = move;
			_executes[ConstEntity.UNIT_ACTION_02] = observe;
			_executes[ConstEntity.UNIT_ACTION_03] = attack;
			_executes[ConstEntity.UNIT_ACTION_04] = dodge;
			_executes[ConstEntity.UNIT_ACTION_05] = parry;
			_executes[ConstEntity.UNIT_ACTION_06] = hurt;
			_executes[ConstEntity.UNIT_ACTION_07] = die;
		}
		/**
		 * 执行动作
		 * @param value 动作id
		 */		
		public function execute(value:int):void
		{
			var func:Function = _executes[value] as Function;
			if(func == null)
			{
				throw new Error("对应的动作不存在");
			}
			func();
		}
		
		private function stand():void
		{
			
		}
		
		private function move():void
		{
			var dataUnit:IDataUnit = _unit.dataUnit;
			var speed:int = dataUnit.configUnit.speed;
			var stageFrameRate:int = ManagerTime.instance.stageFrameRate;
			var speedPerFrame:Number = speed/stageFrameRate;
			var sin:Number = Math.sin(dataUnit.dirctoin);
			var cos:Number = Math.cos(dataUnit.dirctoin);
			_unit.dataUnit.locationOffset(sin*speedPerFrame,cos*speedPerFrame);
		}
		
		private function observe():void
		{
			
		}
		
		private function attack():void
		{
			
		}
		
		private function dodge():void
		{
			
		}
		
		private function parry():void
		{
			
		}
		
		private function hurt():void
		{
			_unit.dataUnit.attrHp;
		}
		
		private function die():void
		{
			if(_unit.dataUnit.attrHp < 0)
			{
				ManagerEntity.instance.destroyEntity(_unit);
			}
		}
	}
}