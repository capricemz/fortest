package smallgames.autoFight.core.entity
{
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
		/**
		 * 添加实体
		 * @param data 要添加实体的数据
		 */		
		public function addEntity(data:IDataEntity):void
		{
			var entity:IEntity = notify(ConstEntity.HANDLE_CREATE,data) as IEntity;
			var list:IEntity;
			if(entity is IScene)
			{
				list = _listScene;
			}
			else if(entity is IUnit)
			{
				list = _listUnit;
			}
			addToList(list,entity);
		}
		/**
		 * 添加进列表
		 * @param list 列表
		 * @param entity 需添加的实体
		 */		
		private function addToList(list:IEntity,entity:IEntity):void
		{
			if(!list)
			{
				list = entity;
			}
			else
			{
				var listLast:IEntity = UtilEnitySearch.entityListLast(list);
				listLast.next = entity;
			}
		}
		/**
		 * 跟新所有列表
		 * @param timeDiff
		 */		
		public function updateByFrame(timeDiff:int):void
		{
			updateList(_listScene,timeDiff);
			updateList(_listUnit,timeDiff);
		}
		/**
		 * 跟新列表
		 * @param list 对应的列表
		 * @param timeDiff
		 */		
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
		/**
		 * 摧毁实体
		 * @param entity 要摧毁的实体
		 */		
		public function destroyEntity(entity:IEntity):void
		{
			var listBefore:IEntity;
			if(entity is IScene)
			{
				listBefore = UtilEnitySearch.entityListBefore(_listScene,entity);
			}
			else if(entity is IUnit)
			{
				listBefore = UtilEnitySearch.entityListBefore(_listUnit,entity);
			}
			if(!listBefore)
			{
				throw new Error("销毁的对象不在列表中");
			}
			listBefore.next = entity.next;
		}
		
		public function textPlace():String
		{
			var text:String = "";
			var entity:IEntity = listScene;
			while(entity)
			{
				text += entity.name;
				entity = entity.next;
			}
			return text;
		}
		
		public function textUnit():String
		{
			var text:String = "";
			var entity:IEntity = listUnit;
			while(entity)
			{
				if(text != "")
				{
					text += ",";
				}
				text += entity.name;
				entity = entity.next;
			}
			return text;
		}
	}
}
import smallgames.autoFight.core.entity.entityBase.IEntity;

class UtilEnitySearch
{
	public static function entityListLast(list:IEntity):IEntity
	{
		var entityNext:IEntity = list;
		while (entityNext && entityNext.next)
		{
			entityNext = entityNext.next;
		}
		return entityNext;
	}
	
	public static function entityListBefore(list:IEntity,entity:IEntity):IEntity
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
	
	public function UtilEnitySearch()
	{
		
	}
}