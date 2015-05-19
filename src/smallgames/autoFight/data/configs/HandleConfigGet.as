package smallgames.autoFight.data.configs
{
	import flash.utils.Dictionary;
	
	import smallgames.autoFight.common.observer.IObserver;
	import smallgames.autoFight.data.configs.subs.ConfigAction;
	
	public class HandleConfigGet implements IObserver
	{
		private var _id:int;

		private var _dictionary:Dictionary;
		public function get id():int
		{
			return _id;
		}
		
		public function set id(value:int):void
		{
			_id = value;
			ManagerConfig.instance.attach(this);
		}
		
		public function HandleConfigGet()
		{
		}
		
		public function update(...args):*
		{
			if(!_dictionary)
			{
				_dictionary = ManagerConfig.instance.dictionary;
			}
			if(args[0] == ConstConfig.TYPE_ACTOIN)
			{
				return configAction(args[1]);
			}
		}
		
		private function configAction(id:int):ConfigAction
		{
			var config:ConfigAction;
			for each(config in _dictionary[ConstConfig.TYPE_ACTOIN])
			{
				if(config.id == id)
				{
					return config;
				}
			}
			return null;
		}
	}
}