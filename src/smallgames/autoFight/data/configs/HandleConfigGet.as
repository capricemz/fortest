package smallgames.autoFight.data.configs
{
	import flash.utils.Dictionary;
	
	import smallgames.autoFight.common.observer.IObserver;
	
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
			switch(args[0])
			{
				case ConstConfig.TYPE_UNIT:
					return _dictionary[ConstConfig.TYPE_UNIT][id];
				case ConstConfig.TYPE_ACTOIN:
					return _dictionary[ConstConfig.TYPE_ACTOIN][id];
				default:
					return null;
			}
		}
	}
}