package smallgames.autoFight.core.entity
{
	import flash.utils.Dictionary;
	
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
		
		private var _entity:Entity;
		private var _entitys:Dictionary;
		
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
		
		public function updateByFrame(timeDiff:int):void
		{
			var entity:IEntity;
			var entityNext:IEntity = _entity;
			while(entityNext)
			{
				entity = entityNext;
				entityNext = entityNext.next;
				entity.updateByTime(timeDiff);
			}
		}
	}
}