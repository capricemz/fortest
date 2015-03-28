package smallgames.autoFight.common.observer
{
	import flash.utils.Dictionary;

	public class Subject
	{
		private var _observers:Dictionary;
		
		public function Subject()
		{
			_observers = new Dictionary();
		}
		/**注册观察对象*/
		public function attach(observer:IObserver):void
		{
			if(_observers[observer.id] != observer)
			{
				_observers[observer.id] = observer;
			}
			else
			{
				throw new Error("重复注册对象");
			}
		}
		/**注销观察对象*/
		public function detach(observer:IObserver):void
		{
			if(_observers[observer.id] == observer)
			{
				delete _observers[observer.id];
			}
			else
			{
				trace("Observe.detach(observer) 注销的对象未注册");
			}
		}
		/**根据id调用对应的注册对象*/
		public function notify(id:int,...args):*
		{
			if(_observers[id])
			{
				var observer:IObserver = _observers[id] as IObserver;
				return observer.update.apply(null,args);
			}
			else
			{
				trace("Observe.detach(observer) 调用的对象未注册");
			}
		}
		/**调用所有观察对象的update方法*/
		public function notifyAll(...args):void
		{
			var observer:IObserver;
			for each(observer in _observers)
			{
				observer.update.apply(null,args);
			}
		}
	}
}