package smallgames.autoFight.core.entity
{
	import smallgames.autoFight.common.ManagerBase;
	import smallgames.autoFight.core.entity.entitys.Entity;
	import smallgames.autoFight.core.entity.entitys.interfaces.IEntity;
	
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
		
		private var _listScene:Entity;
		private var _listUnit:Entity;
		
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
			
		}
		
		private function entityListLast(list:IEntity):IEntity
		{
			var entityNext:IEntity = list;
			while(entityNext)
			{
				entityNext = entityNext.next;
			}
			return entityNext;
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
	}
}