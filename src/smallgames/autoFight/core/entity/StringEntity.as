package smallgames.autoFight.core.entity
{
	public class StringEntity
	{
		public static const ACTION_00:String = "发呆";
		public static const ACTION_01:String = "移动";
		public static const ACTION_02:String = "攻击";
		
		/**
		 * 获得对应的action
		 * @param value
		 * @return 
		 */		
		public static function action(value:int):String
		{
			switch(value)
			{
				case 0:
					return ACTION_00;
				case 1:
					return ACTION_01;
				case 2:
					return ACTION_02;
				default:
					return ACTION_00;
			}
		}
		
		public static const SCENE_FOREST:String = "森林";
		public static const UNIT_SLIME:String = "史莱姆";
		
		
		public function StringEntity()
		{
		}
	}
}