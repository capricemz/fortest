package tests.textVectorPushSplice
{
	import tests.textVectorPushSplice.observer.IObserver;
	
	public class ConcreteObserver implements IObserver
	{
		public function ConcreteObserver()
		{
			ConcreteSubject.instance.attach(this);
		}
		
		public function update(pact:int):void
		{
			var manager:ConcreteSubject = ConcreteSubject.instance;
			manager.detach(this);
			manager.attach(this);
			var observer:ConcreteObserver1 = new ConcreteObserver1();
		}
	}
}