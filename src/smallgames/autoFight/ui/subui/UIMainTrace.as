package smallgames.autoFight.ui.subui
{
	import smallgames.autoFight.ui.UIMainBase;
	
	/**
	 * 信息输出框
	 * @author Administrator
	 */	
	public class UIMainTrace extends UIMainBase
	{
		public function UIMainTrace()
		{
			super();
			var skin:McUITrace = new McUITrace();
			addChild(skin);
		}
	}
}