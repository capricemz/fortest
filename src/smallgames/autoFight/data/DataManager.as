package smallgames.autoFight.data
{
	/**
	 * 游戏数据管理类
	 * @author Administrator
	 */	
	public class DataManager
	{
		private static var _instance:DataManager;
		public static function get instance():DataManager
		{
			return _instance || new DataManager(new PrivateClass());
		}
		
		public function DataManager(pc:PrivateClass)
		{
			if(!pc)
			{
				throw new Error("该类使用单例模式");
			}
			_instance = this;
			
		}
	}
}
class PrivateClass{}