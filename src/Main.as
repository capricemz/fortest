package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import tests.EventTest;
	import tests.FlowGroupElement_addChildExample;
	import tests.Frame1000Test;
	import tests.MouseOverOutTest;
	import tests.RemoveTest;
	import tests.ScrollRectTest;
	import tests.TestCSSText;
	import tests.TestCW201;
	import tests.TestMouseChildren;
	import tests.TestCSSText;
	import tests.ToString_IsTest;
	import tests.MCPlaySpeed.MCPlaySpeedTest;
	
	[SWF (width="1024", height="768", frameRate="1000")]
	public class Main extends Sprite
	{
		public function Main()
		{
			/*var removeTest:RemoveTest = new RemoveTest();
			addChild(removeTest);*/
			
			/*var eventTest:EventTest = new EventTest()
			addChild(eventTest);*/
			
			/*var testCSSText:TestCSSText = new TestCSSText();
			testCSSText.x = 50;
			testCSSText.y = 220;
			addChild(testCSSText);*/
			
			/*var scrollrecttest:ScrollRectTest = new ScrollRectTest();
			scrollrecttest.x = 250;
			addChild(scrollrecttest);*/
			
			/*var moot:MouseOverOutTest = new MouseOverOutTest();
			addChild(moot);
			moot.x = 100;
			moot.y = 300;*/
			
			/*var tostringis:ToString_IsTest = new ToString_IsTest();
			addChild(tostringis);
			tostringis.x = 200;
			tostringis.y = 200;*/
			
			/*var mcpst:MCPlaySpeedTest = new MCPlaySpeedTest();
			addChild(mcpst);*/
			
			/*var f1000t:Frame1000Test = new Frame1000Test();
			addChild(f1000t);*/
			
			/*var tCW201:TestCW201 = new TestCW201();
			tCW201.doChange("种族天赋：遗忘。。");*/
			
			/*var t:FlowGroupElement_addChildExample = new FlowGroupElement_addChildExample();
			addChild(t);*/
			
			var testMouseChildren:TestMouseChildren = new TestMouseChildren();
			addChild(testMouseChildren);
			testMouseChildren.x = 100;
			testMouseChildren.y = 100;
		}
	}
}