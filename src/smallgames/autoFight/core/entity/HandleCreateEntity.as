package smallgames.autoFight.core.entity
{
	import smallgames.autoFight.common.IHandle;
	import smallgames.autoFight.core.entity.entityBase.IEntity;
	import smallgames.autoFight.core.entity.entitysub.Forest;
	
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
			var type:int = args[0] as int;
			var entity:IEntity = args[1] as IEntity;
			entity = createEntity(type);
			return true;
		}
		
		private function createEntity(type:int):IEntity
		{
			var entity:IEntity;
			switch(type)
			{
				case ConstEntity.ENTITY_SCENE_FOREST:
					entity = new Forest();
					break;
				default:
					break;
			}
			return entity;
		}
		
		public function get isOverRemove():Boolean
		{
			return false;
		}
	}
}