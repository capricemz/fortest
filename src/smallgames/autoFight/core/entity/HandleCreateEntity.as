package smallgames.autoFight.core.entity
{
	import smallgames.autoFight.common.IHandle;
	import smallgames.autoFight.core.entity.entityBase.IEntity;
	
	/**
	 * 构造实体处理类
	 * @author Administrator
	 */	
	public class HandleCreateEntity implements IHandle
	{
		public function HandleCreateEntity()
		{
		}
		
		public function execute(...args):Boolean
		{
			ManagerEntitys.instance.addEntity();
			return false;
		}
		
		private function createEntity():IEntity
		{
			switch()
		}
		
		public function get isOverRemove():Boolean
		{
			return false;
		}
	}
}