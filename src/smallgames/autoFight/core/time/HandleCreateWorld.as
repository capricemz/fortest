package smallgames.autoFight.core.time
{
	import smallgames.autoFight.common.IHandle;
	import smallgames.autoFight.core.entity.ManagerEntitys;
	import smallgames.autoFight.core.entity.entityBase.Scene;
	import smallgames.autoFight.core.entity.entityBase.Unit;
	import smallgames.autoFight.core.entity.entityBase.IEntity;

	/**
	 * 构造世界处理类
	 * @author Administrator
	 */	
	public class HandleCreateWorld implements IHandle
	{
		private var datas:Vector.<IEntity>;
		
		public function HandleCreateWorld()
		{
			datas = new Vector.<IEntity>();
			datas.push(new Scene());
			datas.push(new Unit());
			datas.push(new Unit());
			datas.push(new Unit());
		}
		
		public function execute(...args):Boolean
		{
			var timeDiff:int = args[0] as int;
			if(datas && datas.length)
			{
				var data:IEntity = datas.pop();
				var manager:ManagerEntitys = ManagerEntitys.instance;
				manager.addEntity(data);
				return false;
			}
			return true;
		}
		
		public function get isOverRemove():Boolean
		{
			return true;
		}
	}
}