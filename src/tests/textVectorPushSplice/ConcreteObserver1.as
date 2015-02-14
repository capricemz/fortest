package tests.textVectorPushSplice
{
	import tests.textVectorPushSplice.observer.IObserver;
	
	public class ConcreteObserver1 implements IObserver
	{
		public function ConcreteObserver1()
		{
			ConcreteSubject.instance.attach(this);
		}
		
		public function update(pact:int):void
		{
			
		}
	}
}