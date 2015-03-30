package smallgames.autoFight.common
{
	import smallgames.autoFight.core.entity.ConstEntity;
	import smallgames.autoFight.core.entity.HandleEntityCreate;
	import smallgames.autoFight.core.time.HandleWorldCreate;

	public class MediatorHandle
	{
		private static var _instance:MediatorHandle;
		public static function get instance():MediatorHandle
		{
			return _instance || new MediatorHandle(privateFunc);
		}
		private static function privateFunc():void{}
		
		public function MediatorHandle(func:Function)
		{
			if(func != privateFunc)
			{
				throw new Error("该类使用单例模式");
			}
			_instance = this;
		}
		
		public function attachAll():void
		{
			var handleEntityCreate:HandleEntityCreate = new HandleEntityCreate();
			handleEntityCreate.id = ConstEntity.HANDLE_CREATE;
			var handleWorldCreate:HandleWorldCreate = new HandleWorldCreate();
			handleWorldCreate.id = ConstEntity.HANDLE_CREATE;
		}
	}
}