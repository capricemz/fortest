package smallgames.autoFight.data.configs
{
	import smallgames.autoFight.common.observer.IObserver;
	import smallgames.autoFight.data.configs.subs.ConfigAction;

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
		
		[Embed("cfgs/action.cfg", mimeType="application/octet-stream")]
		private const ClassAction:Class;
		
		public function update(...args):*
		{
			var vector:Vector.<DataConfigItem> = new Vector.<DataConfigItem>();
			vector.push(new DataConfigItem(ConstConfig.TYPE_ACTOIN,"index",ClassAction,ConfigAction));
			return vector;
		}
	}
}