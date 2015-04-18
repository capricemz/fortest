package smallgames.autoFight.core.entity
{
	import flash.utils.Dictionary;
	
	import smallgames.autoFight.common.ManagerBase;
	import smallgames.autoFight.core.entity.data.IDataEntity;
	import smallgames.autoFight.core.entity.entityBase.IEntity;
	import smallgames.autoFight.core.entity.entityBase.IScene;
	import smallgames.autoFight.core.entity.entityBase.IUnit;
	
	/**
	 * 实体管理类
	 * @author Administrator
	 */	
	public class ManagerEntity extends ManagerBase
	{
		private static var _instance:ManagerEntity;
		public static function get instance():ManagerEntity
		{
			return _instance || new ManagerEntity(privateFunc);
		}
		private static function privateFunc():void{}
		
		private var _listScene:IEntity;
		public function get listScene():IEntity
		{
			return _listScene;
		}
		
		private var _listUnit:IEntity;
		public function get listUnit():IEntity
		{
			return _listUnit;
		}
		
		public function ManagerEntity(func:Function)
		{
			if(func != privateFunc)
			{
				throw new Error("该类使用单例模式");
			}
			_instance = this;
			initialize();
		}
		
		private function initialize():void
		{
			
		}
		
		public function addEntity(data:IDataEntity):void
		{
			var entity:IEntity = notify(ConstEntity.HANDLE_CREATE,data) as IEntity;
			if(entity is IScene)
			{
				addScene(entity as IScene);
			}
			else if(entity is IUnit)
			{
				addUnit(entity as IUnit);
			}
		}
		
		private function addScene(scene:IScene):void
		{
			if(!_listScene)
			{
				_listScene = scene as IEntity;
			}
			else
			{
				var listLast:IEntity = entityListLast(_listScene);
				listLast.next = scene;
			}
		}
		
		private function addUnit(unit:IUnit):void
		{
			if(!_listUnit)
			{
				_listUnit = unit as IEntity;
			}
			else
			{
				var listLast:IEntity = entityListLast(_listUnit);
				listLast.next = unit;
			}
		}
		
		private function entityListLast(list:IEntity):IEntity
		{
			var entityNext:IEntity = list;
			while (entityNext && entityNext.next)
			{
				entityNext = entityNext.next;
			}
			return entityNext;
		}
		
		public function updateByFrame(timeDiff:int):void
		{
			updateList(_listScene,timeDiff);
			updateList(_listUnit,timeDiff);
		}
		
		private function updateList(list:IEntity,timeDiff:int):void
		{
			var entity:IEntity;
			var entityNext:IEntity = list;
			while(entityNext)
			{
				entity = entityNext;
				entityNext = entityNext.next;
				entity.updateByTime(timeDiff);
			}
		}
		
		public function destroyEntity(entity:IEntity):void
		{
			var listBefore:IEntity;
			if(entity is IScene)
			{
				listBefore = entityListBefore(_listScene,entity);
			}
			else if(entity is IUnit)
			{
				listBefore = entityListBefore(_listUnit,entity);
			}
			if(!listBefore)
			{
				throw new Error("销毁的对象不在列表中");
			}
			listBefore.next = entity.next;
		}
		
		private function entityListBefore(list:IEntity,entity:IEntity):IEntity
		{
			var entityNext:IEntity = list;
			while(entityNext)
			{
				entityNext = entityNext.next;
				if(entityNext == entity)
				{
					return entityNext;
				}
			}
			return null;
		}
	}
}