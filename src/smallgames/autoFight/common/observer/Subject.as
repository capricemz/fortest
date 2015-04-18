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
			if(_observers[observer.id])
			{
				throw new Error("对应的id已被注册");
			}
			if(_observers[observer.id] == observer)
			{
				throw new Error("重复注册对象");
			}
			_observers[observer.id] = observer;
		}
		/**注销观察对象*/
		public function detach(observer:IObserver):void
		{
			if(!_observers[observer.id])
			{
				throw new Error("注销的对象未注册");
			}
			if(_observers[observer.id] != observer)
			{
				throw new Error("对应id的注册对象不是注销的对象");
			}
			delete _observers[observer.id];
		}
		/**根据id调用对应的注册对象*/
		public function notify(id:int,...args):*
		{
			if(!_observers[id])
			{
				throw new Error("对应id的对象未注册");
			}
			var observer:IObserver = _observers[id] as IObserver;
			return observer.update.apply(null,args);
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