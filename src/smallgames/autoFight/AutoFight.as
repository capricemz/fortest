package smallgames.autoFight
{
	import flash.display.Sprite;
	
	import smallgames.autoFight.common.ManagerBase;
	import smallgames.autoFight.data.ManagerData;
	
	/**
	 * 自动战斗游戏
	 * @author Administrator
	 */	
	public class AutoFight extends Sprite
	{
		public function AutoFight()
		{
			super();
			initialize();
		}
		
		private function initialize():void
		{
			ManagerBase.instance
		}
	}
}