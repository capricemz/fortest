package smallgames.autoFight.ui
{
	import smallgames.autoFight.common.ManagerBase;
	import smallgames.autoFight.ui.uibase.IUIBase;
	import smallgames.autoFight.ui.uibase.UIBase;
	import smallgames.autoFight.ui.uisub.UIMainTrace;

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
		
		override protected function initialize():void
		{
			
		}
		
		public function openUIBase(type:int):IUIBase
		{
			
		}
		
		public function getUIBase(type:int):IUIBase
		{
			
		}
		
		public function closeUIBase(type:int):void
		{
			
		}
	}
}