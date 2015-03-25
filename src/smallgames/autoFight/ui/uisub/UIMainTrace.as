package smallgames.autoFight.ui.uisub
{
	import smallgames.autoFight.ui.uibase.UIMainBase;
	
	/**
	 * 信息输出框
	 * @author Administrator
	 */	
	public class UIMainTrace extends UIMainBase
	{
		public function UIMainTrace()
		{
			super();
			var skin:ResUIMainTrace = new ResUIMainTrace();
			addChild(skin);
		}
	}
}