package tests.textVectorPushSplice
{
	import tests.textVectorPushSplice.observer.Subject;
	
	public class ConcreteSubject extends Subject
	{
		private static var _instance:ConcreteSubject;

		public static function get instance():ConcreteSubject
		{
			return _instance ||= new ConcreteSubject(hideFunc) ;
		}
		private static function hideFunc():void{}
		
		public function ConcreteSubject(hf:Function)
		{
			if(hf != hideFunc)
			{
				throw new Error("该类使用单例模式");
			}
		}
	}
}