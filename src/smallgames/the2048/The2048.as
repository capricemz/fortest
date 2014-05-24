package smallgames.the2048
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import smallgames.the2048.ctrler.Operate;
	import smallgames.the2048.model.Consts;
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
			addEventListener(Event.ADDED_TO_STAGE,onAdded2Stage);
		}
		
		protected function onAdded2Stage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,onAdded2Stage);
			var backDrop:BackDrop = new BackDrop();
			addChild(backDrop);
			var operate:Operate = new Operate(this);
		}
	}
}
