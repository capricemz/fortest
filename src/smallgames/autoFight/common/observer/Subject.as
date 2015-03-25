package smallgames.autoFight.common.observer
{
	public class Subject
	{
		private var _observers:Vector.<IObserver>;
		
		public function Subject()
		{
			_observers = new Vector.<IObserver>();
		}
		/**注册观察对象*/
		public function attach(observer:IObserver):void
		{
			var index:int = _observers.indexOf(observer);
			if (index == -1)
			{
				_observers.push(observer);
			}
			else
			{
				trace("Observe.attach(observer) 重复注册对象");
			}
		}
		/**注销观察对象*/
		public function detach(observer:IObserver):void
		{
			var index:int = _observers.indexOf(observer);
			if (index != -1)
			{
				_observers.splice(index, 1);
			}
			else
			{
				trace("Observe.detach(observer) 注销的对象未注册");
			}
		}
		/**调用所有观察对象的update方法*/
		public function notify(...args):void
		{
			_observers.forEach(function(item:IObserver, index:int, vector:Vector.<IObserver>):void
			{
				item.update.apply(null,args);
			});
		}
	}
}