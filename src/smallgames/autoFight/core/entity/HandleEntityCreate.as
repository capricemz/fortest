package smallgames.autoFight.core.entity
{
	import smallgames.autoFight.common.observer.IObserver;
	import smallgames.autoFight.core.entity.base.entity.IEntity;
	import smallgames.autoFight.core.entity.base.entity.data.IDataEntity;
	import smallgames.autoFight.core.entity.sub.scene.SceneForest;
	import smallgames.autoFight.core.entity.sub.unit.UnitRat;
	import smallgames.autoFight.core.entity.sub.unit.UnitSlime;
	
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
			ManagerEntity.instance.attach(this);
		}
		
		public function HandleEntityCreate()
		{
			
		}
		
		public function update(...args):*
		{
			var data:IDataEntity = args[0] as IDataEntity;
			var entity:IEntity = createEntity(data);
			return entity;
		}
		
		private function createEntity(data:IDataEntity):IEntity
		{
			var entity:IEntity;
			switch(data.type)
			{
				case ConstEntity.ENTITY_SCENE_FOREST:
					entity = new SceneForest(data);
					break;
				case ConstEntity.ENTITY_UNIT_SLIME:
					entity = new UnitSlime(data);
					break;
				case ConstEntity.ENTITY_UNIT_RAT:
					entity = new UnitRat(data);
					break;
				default:
					break;
			}
			return entity;
		}
	}
}