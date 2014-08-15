package smallgames.collide.view
{
	public class View
	{
		private static var _instance:View;
		public static function get instance():View
		{
			return _instance || new View(new PrivateClass());
		}
		
		public function View(pc:PrivateClass)
		{
			if(!pc)
			{
				throw new Error("该类使用单例模式");
			}
		}
		
		public function init():void
		{
			
		}
	}
}
class PrivateClass{}