package smallgames.the2048
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
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
			stage.align = StageAlign.LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.tabEnabled = false;
			stage.tabChildren = false;
			stage.focusRect = false;
			stage.mouseEnabled = false;
			stage.mouseChildren = false;
			var backDrop:BackDrop = new BackDrop();
			addChild(backDrop);
			var operate:Operate = new Operate(stage);
		}
	}
}