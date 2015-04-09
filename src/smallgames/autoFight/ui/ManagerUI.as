package smallgames.autoFight.ui
{
	import smallgames.autoFight.common.ManagerBase;
	import smallgames.autoFight.ui.uibase.IUIBase;

	public class ManagerUI extends ManagerBase
	{
		private static var _instance:ManagerUI;
		public static function get instance():ManagerUI
		{
			return _instance || new ManagerUI(privateFunc);
		}
		private static function privateFunc():void{}
		
		public function ManagerUI(func:Function)
		{
			if(func != privateFunc)
			{
				throw new Error("该类使用单例模式");
			}
			_instance = this;
			initialize();
		}
		
		protected function initialize():void
		{
			
		}
		
		public function openUIBase(type:int):IUIBase
		{
			var uiBase:IUIBase = notify(ConstUI.HANDLE_CREATE,type) as IUIBase;
			return uiBase;
		}
		
		public function getUIBase(type:int):IUIBase
		{
			return null;
		}
		
		public function closeUIBase(type:int):void
		{
			
		}
	}
}