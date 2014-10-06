package smallgames
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Stage;
	import flash.events.Event;

	/**
	 * 加载游戏相关功能处理类
	 * @author Administrator
	 */	
	internal class GameLoaderHandle
	{
		private var _gameLoader:GameLoader;
		private var _background:Bitmap;
		
		public function GameLoaderHandle(gameLoader:GameLoader)
		{
			_gameLoader = gameLoader;
			initBackground();
		}
		
		private function initBackground():void
		{
			var stage:Stage = _gameLoader.stage;
			_background = new Bitmap();
			_background.bitmapData = new BitmapData(stage.stageWidth, stage.stageHeight, false, 0xff000000);
			_gameLoader.addChild(_background);
		}
		
		internal function init():void
		{
			var stage:Stage = _gameLoader.stage;
			var parameters:Object = stage.loaderInfo.parameters;
			stage.addEventListener(Event.RESIZE, onResize);
			loadGame();
		}
		
		protected function onResize(event:Event):void
		{
			var stage:Stage = _gameLoader.stage;
			var stageWidth:int = stage.stageWidth;
			var stageHeight:int = stage.stageHeight;
			_background.width = stageWidth;
			_background.height = stageHeight;
			
		}
		
		private function loadGame():void
		{
			
		}
	}
}