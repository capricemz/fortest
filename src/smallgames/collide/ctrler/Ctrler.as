package smallgames.collide.ctrler
{
	public class Ctrler
	{
		private static var _instance:Ctrler;
		public static function get instance():Ctrler
		{
			return _instance || new 
		}
		
		public function Ctrler(pc:PrivateClass)
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