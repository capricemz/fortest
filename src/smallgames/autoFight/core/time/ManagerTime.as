package smallgames.autoFight.core.time
{
	import smallgames.autoFight.common.ManagerBase;

	/**
	 * 时间管理类
	 * @author Administrator
	 */	
	public class ManagerTime extends ManagerBase
	{
		private static var _instance:ManagerTime;
		public static function get instance():ManagerTime
		{
			return _instance || new ManagerTime(privateFunc);
		}
		private static function privateFunc():void{}
		
		public function ManagerTime(func:Function)
		{
			if(func != privateFunc)
			{
				throw new Error("该类使用单例模式");
			}
			_instance = this;
			initialize();
		}
		
		override protected function initialize():void
		{
			
		}
	}
}