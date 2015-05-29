package smallgames.autoFight.core.time
{
	import smallgames.autoFight.common.observer.IObserver;
	import smallgames.autoFight.common.random.UtilRandom;
	import smallgames.autoFight.core.entity.ConstEntity;
	import smallgames.autoFight.core.entity.ManagerEntity;
	import smallgames.autoFight.core.entity.base.entity.data.IDataEntity;
	import smallgames.autoFight.core.entity.base.scene.data.DataScene;
	import smallgames.autoFight.core.entity.base.scene.data.IDataScene;
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
		
		private var _isDatasInited:Boolean;
		private var _datas:Vector.<IDataEntity>;
		
		public function HandleWorldCreate()
		{
			
		}
		
		public function update(...args):*
		{
			var timeDiff:int = args[0] as int;
			if(!_isDatasInited)
			{
				_isDatasInited = true;
				initData();
				return;
			}
			if(_datas && _datas.length)
			{
				var data:IDataEntity = _datas.shift();
				ManagerEntity.instance.addEntity(data);
			}
		}
		
		private function initData():void
		{
			_datas = new Vector.<IDataEntity>();
			var dataScene:IDataScene = new DataScene();
			dataScene.id = 1;
			dataScene.type = ConstEntity.ENTITY_SCENE_FOREST;
			dataScene.locationOffset(0,0);
			_datas.push(dataScene);
			var dataUnit:IDataUnit = new DataUnit();
			dataUnit.id = 1;
			dataUnit.type = ConstEntity.ENTITY_UNIT_SLIME;
			dataUnit.locationOffset(UtilRandom.randomWave(200),UtilRandom.randomWave(150));
			_datas.push(dataUnit);
			dataUnit = new DataUnit();
			dataUnit.id = 2;
			dataUnit.type = ConstEntity.ENTITY_UNIT_SLIME;
			dataUnit.locationOffset(UtilRandom.randomWave(200),UtilRandom.randomWave(150));
			_datas.push(dataUnit);
			/*dataUnit = new DataUnit();
			dataUnit.id = 3;
			dataUnit.type = ConstEntity.ENTITY_UNIT_SLIME;
			dataUnit.locationOffset(UtilRandom.randomWave(200),UtilRandom.randomWave(150));
			_datas.push(dataUnit);*/
		}
	}
}