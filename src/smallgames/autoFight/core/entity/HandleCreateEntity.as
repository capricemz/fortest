package smallgames.autoFight.core.entity
{
	import smallgames.autoFight.common.IHandle;
	import smallgames.autoFight.core.entity.data.IDataEntity;
	import smallgames.autoFight.core.entity.entityBase.IEntity;
	import smallgames.autoFight.core.entity.entitysub.SceneForest;
	
	/**
	 * 构造实体处理类
	 * @author Administrator
	 */	
	public class HandleCreateEntity implements IHandle
	{
		private var _id:int;
		public function get id():int
		{
			return _id;
		}
		public function set id(value:int):void
		{
			_id = value;
		}
		
		public function HandleCreateEntity()
		{
		}
		
		public function execute(...args):Boolean
		{
			var data:IDataEntity = args[0] as IDataEntity;
			var entity:IEntity = args[1] as IEntity;
			entity = createEntity(data.type);
			return true;
		}
		
		private function createEntity(type:int):IEntity
		{
			var entity:IEntity;
			switch(type)
			{
				case ConstEntity.ENTITY_SCENE_FOREST:
					entity = new SceneForest();
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