package smallgames
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	public class GameLoader extends Sprite
	{
		public function GameLoader()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded2Stage);
		}
		
		protected function onAdded2Stage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded2Stage);
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.quality = StageQuality.BEST;
			stage.frameRate = 60;//帧频
			stage.stageFocusRect = false;//tab键不会出现黄色的框框
			var handle:GameLoaderHandle = new GameLoaderHandle(this);
			handle.init();
		}
	}
}