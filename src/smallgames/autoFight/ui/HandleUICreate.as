package smallgames.autoFight.ui
{
	import smallgames.autoFight.common.observer.IObserver;
	import smallgames.autoFight.ui.uibase.UIBase;
	import smallgames.autoFight.ui.uisub.UIMainTrace;
	
	/**
	 * 构造UI处理类
	 * @author Administrator
	 */	
	public class HandleUICreate implements IObserver
	{
		private var _id:int;
		public function get id():int
		{
			return _id;
		}
		public function set id(value:int):void
		{
			_id = value;
			ManagerUI.instance.attach(this);
		}
		
		public function HandleUICreate()
		{
			
		}
		
		public function update(...args):*
		{
			var type:int = args[0] as int;
			var uiBase:UIBase = createUI(type);
			uiBase.id = type;
			return uiBase;
		}
		
		private function createUI(type:int):UIBase
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