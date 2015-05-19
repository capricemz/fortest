package smallgames.autoFight.core.entity
{
	public class ConstEntity
	{
		public static const HANDLE_CREATE:int = 0;
		
		public static const ENTITY_SCENE_FOREST:int = 10000;
		
		public static const ENTITY_UNIT_SLIME:int = 20000;
		
		/**站立*/
		public static const UNIT_ACTION_00:int = 0;
		/**移动*/
		public static const UNIT_ACTION_01:int = 1;
		/**观察*/
		public static const UNIT_ACTION_02:int = 2;
		/**攻击*/
		public static const UNIT_ACTION_03:int = 3;
		/**闪躲*/
		public static const UNIT_ACTION_04:int = 4;
		/**格挡*/
		public static const UNIT_ACTION_05:int = 5;
		/**受伤*/
		public static const UNIT_ACTION_06:int = 6;
		/**死亡*/
		public static const UNIT_ACTION_07:int = 7;
		
		public static const UNIT_ACTION_TOTAL:int = 8;
		
		public function ConstEntity()
		{
		}
	}
}