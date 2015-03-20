package smallgames.autoFight.core.time
{
	import smallgames.autoFight.common.IHandle;
	import smallgames.autoFight.core.entity.ManagerEntitys;

	/**
	 * 构造世界处理类
	 * @author Administrator
	 */	
	public class HandleCreateWorld implements IHandle
	{
		public function HandleCreateWorld()
		{
		}
		
		public function execute(...args):void
		{
			var timeDiff:int = args[0] as int;
			ManagerEntitys.instance.createEntity(1);
		}
	}
}