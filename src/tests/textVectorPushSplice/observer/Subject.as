package tests.textVectorPushSplice.observer
{
	public class Subject
	{
		private var _observers:Vector.<IObserver>;
		
		public function Subject()
		{
			_observers = new Vector.<IObserver>();
		}
		
		public function attach(observer:IObserver):void
		{
			var indexOf:int = _observers.indexOf(observer);
			if(indexOf == -1)
			{
				_observers.push(observer);
			}
		}
		
		public function detach(observer:IObserver):void
		{
			var indexOf:int = _observers.indexOf(observer);
			if(indexOf != -1)
			{
				_observers.splice(indexOf,1);
			}
		}
		
		public function notify(pact:int):void
		{
			var observer:IObserver;
			for each (observer in _observers) 
			{
				observer.update(pact);
			}
		}
	}
}