package smallgames.autoFight
{
	import smallgames.autoFight.core.entity.ConstEntity;
	import smallgames.autoFight.core.entity.HandleEntityCreate;
	import smallgames.autoFight.core.time.ConstTime;
	import smallgames.autoFight.core.time.HandleWorldCreate;
	import smallgames.autoFight.data.configs.ConstConfig;
	import smallgames.autoFight.data.configs.HandleConfigEmbed;
	import smallgames.autoFight.data.configs.HandleConfigGet;
	import smallgames.autoFight.ui.ConstUI;
	import smallgames.autoFight.ui.HandleUICreate;

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
			var handleConfigEmbed:HandleConfigEmbed = new HandleConfigEmbed();
			handleConfigEmbed.id = ConstConfig.HANDLE_EMBED;
			var handleConfigGet:HandleConfigGet = new HandleConfigGet();
			handleConfigGet.id = ConstConfig.HANDLE_GET;
			//
			var handleEntityCreate:HandleEntityCreate = new HandleEntityCreate();
			handleEntityCreate.id = ConstEntity.HANDLE_CREATE;
			//
			var handleWorldCreate:HandleWorldCreate = new HandleWorldCreate();
			handleWorldCreate.id = ConstTime.HANDLE_CREATE;
			//
			var handleUICreate:HandleUICreate = new HandleUICreate();
			handleUICreate.id = ConstUI.HANDLE_CREATE;
		}
	}
}