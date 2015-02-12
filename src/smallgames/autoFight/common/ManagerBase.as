package smallgames.autoFight.common
{
	public class ManagerBase
	{
		private static var _instance:ManagerBase;
		public static function get instance():ManagerBase
		{
			return _instance || new ManagerBase(privateFunc);
		}
		private static function privateFunc():void{}
		
		public function ManagerBase(func:Function)
		{
			if(func != privateFunc)
			{
				throw new Error("该类使用单例模式");
			}
			_instance = this;
			initialize();
		}
		
		protected function initialize():void
		{
			throw new Error("必须重写initialize()方法");
		}
	}
}