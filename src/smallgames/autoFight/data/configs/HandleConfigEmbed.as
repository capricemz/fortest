package smallgames.autoFight.data.configs
{
	import smallgames.autoFight.common.observer.IObserver;
	import smallgames.autoFight.data.configs.subs.ConfigAction;
	import smallgames.autoFight.data.configs.subs.ConfigScene;
	import smallgames.autoFight.data.configs.subs.ConfigUnit;

	public class HandleConfigEmbed implements IObserver
	{
		private var _id:int;
		public function get id():int
		{
			return _id;
		}
		
		public function set id(value:int):void
		{
			_id = value;
			ManagerConfig.instance.attach(this);
		}
		
		public function HandleConfigEmbed()
		{
		}
		
		[Embed("cfgs/scene.cfg", mimeType="application/octet-stream")]
		private const ClassScene:Class;
		[Embed("cfgs/unit.cfg", mimeType="application/octet-stream")]
		private const ClassUnit:Class;
		[Embed("cfgs/action.cfg", mimeType="application/octet-stream")]
		private const ClassAction:Class;
		
		public function update(...args):*
		{
			var vector:Vector.<DataConfigItem> = new Vector.<DataConfigItem>();
			vector.push(new DataConfigItem(ConstConfig.TYPE_SCENE,"id",ClassScene,ConfigScene));
			vector.push(new DataConfigItem(ConstConfig.TYPE_UNIT,"id",ClassUnit,ConfigUnit));
			vector.push(new DataConfigItem(ConstConfig.TYPE_ACTOIN,"id",ClassAction,ConfigAction));
			return vector;
		}
	}
}