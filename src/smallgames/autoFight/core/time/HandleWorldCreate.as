package smallgames.autoFight.core.time
{
	import flash.geom.Point;
	
	import smallgames.autoFight.common.observer.IObserver;
	import smallgames.autoFight.common.random.UtilRandom;
	import smallgames.autoFight.core.entity.ConstEntity;
	import smallgames.autoFight.core.entity.ManagerEntity;
	import smallgames.autoFight.core.entity.base.entity.data.DataEntity;
	import smallgames.autoFight.core.entity.base.entity.data.IDataEntity;
	import smallgames.autoFight.core.entity.base.unit.data.DataUnit;
	import smallgames.autoFight.core.entity.base.unit.data.IDataUnit;

	/**
	 * 构造世界处理类
	 * @author Administrator
	 */	
	public class HandleWorldCreate implements IObserver
	{
		private var _id:int;
		public function get id():int
		{
			return _id;
		}
		public function set id(value:int):void
		{
			_id = value;
			ManagerTime.instance.attach(this);
		}
		
		private var datas:Vector.<IDataEntity>;
		
		public function HandleWorldCreate()
		{
			datas = new Vector.<IDataEntity>();
			var dataEntity:IDataEntity = new DataEntity();
			dataEntity.id = 1;
			dataEntity.type = ConstEntity.ENTITY_SCENE_FOREST;
			dataEntity.location = new Point();
			datas.push(dataEntity);
			var dataUnit:IDataUnit = new DataUnit();
			dataUnit.id = 1;
			dataUnit.type = ConstEntity.ENTITY_UNIT_SLIME;
			dataUnit.atk = UtilRandom.randomWave(10);
			dataUnit.hp = UtilRandom.randomWave(30);
			dataUnit.location = new Point();
			datas.push(dataUnit);
			dataUnit = new DataUnit();
			dataUnit.id = 2;
			dataUnit.type = ConstEntity.ENTITY_UNIT_SLIME;
			dataUnit.atk = UtilRandom.randomWave(10);
			dataUnit.hp = UtilRandom.randomWave(30);
			dataUnit.location = new Point();
			datas.push(dataUnit);
			dataUnit = new DataUnit();
			dataUnit.id = 3;
			dataUnit.type = ConstEntity.ENTITY_UNIT_SLIME;
			dataUnit.atk = UtilRandom.randomWave(10);
			dataUnit.hp = UtilRandom.randomWave(30);
			dataUnit.location = new Point();
			datas.push(dataUnit);
		}
		
		public function update(...args):*
		{
			var timeDiff:int = args[0] as int;
			if(datas && datas.length)
			{
				var data:IDataEntity = datas.shift();
				ManagerEntity.instance.addEntity(data);
				return false;
			}
			return true;
		}
	}
}