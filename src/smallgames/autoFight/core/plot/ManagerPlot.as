package smallgames.autoFight.core.plot
{
	import smallgames.autoFight.common.ManagerBase;
	
	public class ManagerPlot extends ManagerBase
	{
		private static var _instance:ManagerPlot;
		public static function get instance():ManagerPlot
		{
			return _instance || new ManagerPlot(privateFunc);
		}
		private static function privateFunc():void{}
		
		public function ManagerPlot(func:Function)
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