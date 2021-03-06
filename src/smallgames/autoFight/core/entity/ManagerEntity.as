package smallgames.autoFight.core.entity
{
	import flash.display.BitmapData;
	
	import smallgames.autoFight.common.ManagerBase;
	import smallgames.autoFight.core.entity.base.entity.IEntity;
	import smallgames.autoFight.core.entity.base.entity.data.IDataEntity;
	import smallgames.autoFight.core.entity.base.scene.IScene;
	import smallgames.autoFight.core.entity.base.unit.IUnit;
	import smallgames.autoFight.core.entity.base.unit.data.IDataUnit;
	
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
		
		private var _layer:BitmapData;
		/**场景列表*/
		private var _listScene:IEntity;
		public function get listScene():IEntity
		{
			return _listScene;
		}
		/**单位列表*/
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
		}
		
		public function initialize(value:BitmapData):void
		{
			_layer = value;
		}
		/**
		 * 添加实体
		 * @param data 要添加实体的数据
		 */		
		public function addEntity(data:IDataEntity):void
		{
			var entity:IEntity = notify(ConstEntity.HANDLE_CREATE,data) as IEntity;
			if(entity is IScene)
			{
				_listScene = addToList(_listScene,entity);
			}
			else if(entity is IUnit)
			{
				_listUnit = addToList(_listUnit,entity);
			}
		}
		/**
		 * 添加进列表
		 * @param list 列表
		 * @param entity 需添加的实体
		 */		
		private function addToList(list:IEntity,entity:IEntity):IEntity
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
			return list;
		}
		/**
		 * 跟新所有列表
		 * @param timeDiff
		 */		
		public function updateByTime(timeDiff:int):void
		{
			updateListCopy(_listScene);
			updateListByTime(_listScene,timeDiff);
			updateListCopy(_listUnit);
			updateListByTime(_listUnit,timeDiff);
		}
		/**
		 * 将缓存区域的像素拷贝回位图
		 * @param list 对应的列表
		 */		
		private function updateListCopy(list:IEntity):void
		{
			var entity:IEntity;
			var entityNext:IEntity = list;
			while(entityNext)
			{
				entity = entityNext;
				entityNext = entityNext.next;
				entity.copyTempPixels(_layer);
			}
		}
		/**
		 * 跟新列表
		 * @param list 对应的列表
		 * @param timeDiff
		 */		
		private function updateListByTime(list:IEntity,timeDiff:int):void
		{
			var entity:IEntity;
			var entityNext:IEntity = list;
			while(entityNext)
			{
				entity = entityNext;
				entityNext = entityNext.next;
				entity.updateByTime(timeDiff,_layer);
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
				if(!listBefore)
				{
					_listScene = entity.next;
					return;
				}
			}
			else if(entity is IUnit)
			{
				listBefore = UtilEnitySearch.entityListBefore(_listUnit,entity);
				if(!listBefore)
				{
					_listUnit = entity.next;
					return;
				}
			}
			listBefore.next = entity.next;
			entity.destroy();
		}
		
		public function textPlace():String
		{
			var text:String = "";
			var scene:IScene = listScene as IScene;
			while(scene)
			{
				text += scene.dataScene.configScene.name;
				scene = scene.next as IScene;
			}
			return text;
		}
		
		public function textUnit():String
		{
			var text:String = "";
			var unit:IUnit = listUnit as IUnit;
			while(unit)
			{
				if(text != "")
				{
					text += "\n";
				}
				var dataUnit:IDataUnit = unit.dataUnit;
				text += dataUnit.configUnit.name + "(" + dataUnit.attrHp + "/" + dataUnit.attrHpMax + ")";
				unit = unit.next as IUnit;
			}
			return text;
		}
		
		public function textPlot():String
		{
			var text:String = "";
			var unit:IUnit = listUnit as IUnit;
			while(unit)
			{
				if(text != "")
				{
					text += "\n";
				}
				var dataUnit:IDataUnit = unit.dataUnit;
				text += dataUnit.configUnit.name + dataUnit.configAction.name;
				unit = unit.next as IUnit;
			}
			return text;
		}
	}
}
import smallgames.autoFight.core.entity.base.entity.IEntity;

class UtilEnitySearch
{
	public static function entityListLast(list:IEntity):IEntity
	{
		var entity:IEntity = list;
		while (entity && entity.next)
		{
			entity = entity.next;
		}
		return entity;
	}
	
	public static function entityListBefore(list:IEntity,value:IEntity):IEntity
	{
		var entityBefore:IEntity = null;
		var entity:IEntity = list;
		while(entity)
		{
			if(entity == value)
			{
				return entityBefore;
			}
			entityBefore = entity;
			entity = entity.next;
		}
		throw new Error("销毁的对象不在列表中");
	}
	
	public function UtilEnitySearch()
	{
		
	}
}