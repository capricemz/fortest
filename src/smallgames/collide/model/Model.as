package smallgames.collide.model
{
	public class Model
	{
		private static var _intance:Model;
		public static function get instance():Model
		{
			return _intance || new Model(new PrivateClass());
		}
		
		public function Model(pc:PrivateClass)
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