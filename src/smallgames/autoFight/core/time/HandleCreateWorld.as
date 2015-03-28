package smallgames.autoFight.core.time
{
	import smallgames.autoFight.common.IHandle;
	import smallgames.autoFight.core.entity.ConstEntity;
	import smallgames.autoFight.core.entity.ManagerEntity;
	import smallgames.autoFight.core.entity.data.DataEntity;
	import smallgames.autoFight.core.entity.data.IDataEntity;

	/**
	 * 构造世界处理类
	 * @author Administrator
	 */	
	public class HandleCreateWorld implements IHandle
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
		
		private var datas:Vector.<IDataEntity>;
		
		public function HandleCreateWorld()
		{
			datas = new Vector.<IDataEntity>();
			var dataEntity:DataEntity = new DataEntity();
			dataEntity.id = 0;
			dataEntity.type = ConstEntity.ENTITY_SCENE_FOREST;
			datas.push(dataEntity);
			dataEntity = new DataEntity();
			dataEntity.id = 0;
			dataEntity.type = ConstEntity.ENTITY_UNIT_SLIME;
			datas.push(dataEntity);
			dataEntity = new DataEntity();
			dataEntity.id = 0;
			dataEntity.type = ConstEntity.ENTITY_UNIT_SLIME;
			datas.push(dataEntity);
		}
		
		public function execute(...args):Boolean
		{
			var timeDiff:int = args[0] as int;
			if(datas && datas.length)
			{
				var data:IDataEntity = datas.pop();
				ManagerEntity.instance.addEntity(data);
				return false;
			}
			return true;
		}
		
		public function get isOverRemove():Boolean
		{
			return true;
		}
	}
}