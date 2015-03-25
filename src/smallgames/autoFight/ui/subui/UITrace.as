package smallgames.autoFight.ui.subui
{
	import smallgames.autoFight.ui.UIBase;
	
	/**
	 * 信息输出框
	 * @author Administrator
	 */	
	public class UITrace extends UIBase
	{
		public function UITrace()
		{
			super();
			var skin:McUITrace = new McUITrace();
			addChild(skin);
		}
	}
}