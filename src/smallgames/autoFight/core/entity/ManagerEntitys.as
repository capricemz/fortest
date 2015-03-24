package smallgames.autoFight.core.entity
{
	import flash.utils.Dictionary;
	
	import smallgames.autoFight.common.ManagerBase;
	import smallgames.autoFight.core.entity.entitys.interfaces.IEntity;
	import smallgames.autoFight.core.entity.entitys.interfaces.IScene;
	import smallgames.autoFight.core.entity.entitys.interfaces.IUnit;
	
	/**
	 * 实体管理类
	 * @author Administrator
	 */	
	public class ManagerEntitys extends ManagerBase
	{
		private static var _instance:ManagerEntitys;
		public static function get instance():ManagerEntitys
		{
			return _instance || new ManagerEntitys(privateFunc);
		}
		private static function privateFunc():void{}
		
		private var _entitys:Dictionary;
		private var _listScene:IEntity;
		private var _listUnit:IEntity;

		public function ManagerEntitys(func:Function)
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
			_entitys = new Dictionary();
		}
		
		public function createEntity(eneity:IEntity):void
		{
			if(eneity is IScene)
			{
				createScene(eneity as IScene);
			}
			else if(eneity is IUnit)
			{
				createUnit(eneity as IUnit);
			}
		}
		
		public function createScene(scene:IScene):void
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
		
		public function createUnit(unit:IUnit):void
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