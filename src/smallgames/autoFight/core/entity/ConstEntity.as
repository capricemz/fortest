package smallgames.autoFight.core.entity
{
	public class ConstEntity
	{
		public static const HANDLE_CREATE:int = 0;
		
		public static const ENTITY_SCENE_FOREST:int = 10000;
		
		public static const ENTITY_UNIT_SLIME:int = 20000;
		public static const ENTITY_UNIT_RAT:int = 20001;
		
		public static const UNIT_ACTION_NULL:int = -1;
		/**休息*/
		public static const UNIT_ACTION_00:int = 0;
		/**转向*/
		public static const UNIT_ACTION_01:int = 1;
		/**移动*/
		public static const UNIT_ACTION_02:int = 2;
		/**观察*/
		public static const UNIT_ACTION_03:int = 3;
		/**攻击*/
		public static const UNIT_ACTION_04:int = 4;
		/**闪躲*/
		public static const UNIT_ACTION_05:int = 5;
		/**格挡*/
		public static const UNIT_ACTION_06:int = 6;
		/**受伤*/
		public static const UNIT_ACTION_07:int = 7;
		/**死亡*/
		public static const UNIT_ACTION_08:int = 8;
		
		public static const UNIT_ACTION_TOTAL:int = 9;
		
		public function ConstEntity()
		{
		}
	}
}