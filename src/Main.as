package
{
	import flash.display.Sprite;
	
	import tests.EventTest;
	import tests.MCPlaySpeed.MCPlaySpeedTest;
	import tests.MouseOverOutTest;
	import tests.RemoveTest;
	import tests.ScrollRectTest;
	import tests.Texttest;
	import tests.ToString_IsTest;
	
	[SWF (width="1024", height="768", frameRate="30")]
	public class Main extends Sprite
	{
		public function Main()
		{
			/*addChild(new RemoveTest());
			addChild(new EventTest());
			var texttest:Texttest = new Texttest();
			texttest.x = 50;
			texttest.y = 220;
			addChild(texttest);
			
			var scrollrecttest:ScrollRectTest = new ScrollRectTest();
			scrollrecttest.x = 250;
			addChild(scrollrecttest);
			
			var moot:MouseOverOutTest = new MouseOverOutTest();
			addChild(moot);
			moot.x = 100;
			moot.y = 300;
			
			var tostringis:ToString_IsTest = new ToString_IsTest();
			addChild(tostringis);
			tostringis.x = 200;
			tostringis.y = 200;*/
			
			var mcpst:MCPlaySpeedTest = new MCPlaySpeedTest();
			mcpst.x = 0;
			addChild(mcpst);
		}
	}
}