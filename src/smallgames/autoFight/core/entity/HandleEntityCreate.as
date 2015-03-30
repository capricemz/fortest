package smallgames.autoFight.core.entity
{
	import smallgames.autoFight.common.observer.IObserver;
	import smallgames.autoFight.core.entity.data.IDataEntity;
	import smallgames.autoFight.core.entity.entityBase.IEntity;
	import smallgames.autoFight.core.entity.entitysub.SceneForest;
	import smallgames.autoFight.core.entity.entitysub.UnitSlime;
	
	/**
	 * 构造实体处理类
	 * @author Administrator
	 */	
	public class HandleEntityCreate implements IObserver
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
		
		public function HandleEntityCreate()
		{
			ManagerEntity.instance.attach(this);
		}
		
		public function update(...args):*
		{
			var data:IDataEntity = args[0] as IDataEntity;
			var entity:IEntity = createEntity(data.type);
			entity.data = data;
			return entity;
		}
		
		private function createEntity(type:int):IEntity
		{
			var entity:IEntity;
			switch(type)
			{
				case ConstEntity.ENTITY_SCENE_FOREST:
					entity = new SceneForest();
					break;
				case ConstEntity.ENTITY_UNIT_SLIME:
					entity = new UnitSlime();
				default:
					break;
			}
			return entity;
		}
	}
}