package smallgames.autoFight.ui
{
	import smallgames.autoFight.common.IHandle;
	import smallgames.autoFight.common.ManagerBase;
	import smallgames.autoFight.ui.uibase.UIBase;
	import smallgames.autoFight.ui.uisub.UIMainTrace;
	
	/**
	 * 构造UI处理类
	 * @author Administrator
	 */	
	public class HandleCreateUI implements IHandle
	{
		public function HandleCreateUI()
		{
			
		}
		
		public function execute(...args):Boolean
		{
			var type:int = args[0] as int;
			var uiBase:UIBase = newUI(type);
			ManagerUI.instance.
			return false;
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