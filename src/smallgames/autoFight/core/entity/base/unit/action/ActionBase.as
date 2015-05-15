package smallgames.autoFight.core.entity.base.unit.action
{
	import flash.utils.Dictionary;
	
	import smallgames.autoFight.core.entity.ConstEntity;
	import smallgames.autoFight.core.entity.base.unit.IUnit;

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
			
		}
		
		private function die():void
		{
			
		}
	}
}