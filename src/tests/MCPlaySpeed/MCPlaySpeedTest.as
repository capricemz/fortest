package tests.MCPlaySpeed
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class MCPlaySpeedTest extends Sprite
	{
		private var loader:Loader,urlr:URLRequest,url:String;
		
		public function MCPlaySpeedTest()
		{
			super();
			url = "tests/MCPlaySpeed/testmc.swf";
			urlr = new URLRequest(url);
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onComplete);
			loader.load(urlr);
		}
		
		protected function onComplete(event:Event):void
		{
			(loader as MovieClip);
			addChild(loader);
		}
	}
}