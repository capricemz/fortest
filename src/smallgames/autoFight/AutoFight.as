package smallgames.autoFight
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	/**
	 * 自动战斗游戏
	 * @author Administrator
	 */	
	public class AutoFight extends Sprite
	{
		private var _timeLast:int;
		
		public function AutoFight()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
		}
		
		protected function onAddToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.quality = StageQuality.BEST;
			stage.frameRate = 60;//帧频
			stage.stageFocusRect = false;//tab键不会出现黄色的框框
			initialize();
		}
		
		private function initialize():void
		{
			stage.addEventListener(Event.ENTER_FRAME,onEnterFrame);
			_timeLast = getTimer();
		}
		
		protected function onEnterFrame(event:Event):void
		{
			var timeNow:int = getTimer();
			var timeDiff:int = timeNow - _timeLast;
			_timeLast = timeNow;
			//
			
		}
	}
}