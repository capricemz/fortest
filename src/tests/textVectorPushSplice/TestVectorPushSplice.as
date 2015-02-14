package tests.textVectorPushSplice
{
	import flash.display.Sprite;
	
	/**
	 * 测试Vector在遍历中调用PushSplice的结果
	 * @author Administrator
	 */	
	public class TestVectorPushSplice extends Sprite
	{
		public function TestVectorPushSplice()
		{
			super();
			var observer:ConcreteObserver = new ConcreteObserver();
		}
		
		public function doTest():void
		{
			ConcreteSubject.instance.notify(0);
		}
	}
}