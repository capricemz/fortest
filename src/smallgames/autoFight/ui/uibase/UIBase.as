package smallgames.autoFight.ui.uibase
{
	import flash.display.Sprite;
	
	import smallgames.autoFight.common.observer.IObserver;
	
	/**
	 * 用户界面基础类
	 * @author Administrator
	 */	
	public class UIBase extends Sprite implements IUIBase,IObserver
	{
		public function UIBase()
		{
			super();
		}
		
		public function update(...args):void
		{
			
		}
	}
}