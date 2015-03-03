package smallgames.autoFight.core.entity
{
	import smallgames.autoFight.common.ManagerBase;
	
	/**
	 * 实体管理类
	 * @author Administrator
	 */	
	public class ManagerEntitys extends ManagerBase
	{
		private static var _instance:ManagerEntitys;
		public static function get instance():ManagerEntitys
		{
			return _instance || new ManagerEntitys(privateFunc);
		}
		private static function privateFunc():void{}
		
		public function ManagerEntitys(func:Function)
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
		
		public function updateByFrame():void
		{
			
		}
	}
}