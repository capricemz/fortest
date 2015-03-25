package smallgames.autoFight.ui
{
	import smallgames.autoFight.common.ManagerBase;
	import smallgames.autoFight.ui.subui.UIMainTrace;

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
		
		private function newUI(type:int):UIBase
		{
			var uiBase:UIBase;
			switch(type)
			{
				case ConstUI.UI_MAIN_TRACE:
					uiBase = new UIMainTrace();
					break;
				default:
					break;
			}
			return uiBase;
		}
	}
}