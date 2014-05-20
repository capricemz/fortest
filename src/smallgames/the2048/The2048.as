package smallgames.the2048
{
	import flash.display.Sprite;
	
	import smallgames.the2048.ctrler.Operate;
	import smallgames.the2048.view.BackDrop;
	
	/**
	 * 2048主程序类
	 * @author
	 */	
	public class The2048 extends Sprite
	{
		public function The2048()
		{
			super();
			var backDrop:BackDrop = new BackDrop();
			addChild(backDrop);
			var operate:Operate = new Operate(this);
		}
	}
}