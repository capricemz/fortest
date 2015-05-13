package smallgames.autoFight.data
{
	import smallgames.autoFight.common.ManagerBase;
	
	/**
	 * 游戏数据管理类
	 * @author Administrator
	 */	
	public class ManagerData extends ManagerBase
	{
		private static var _instance:ManagerData;
		public static function get instance():ManagerData
		{
			return _instance || new ManagerData(privateFunc);
		}
		private static function privateFunc():void{}
		
		public function ManagerData(func:Function)
		{
			if(func != privateFunc)
			{
				throw new Error("该类使用单例模式");
			}
			_instance = this;
			initialize();
		}
		
		private function initialize():void
		{
			
		}
	}
}