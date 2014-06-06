package
{
	import com.util.StatsFps;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import tests.InternalClassBuildingVectorTest;
	import tests.objectassign.ObjectAssignTest;
	
	[SWF (width="1024", height="768", frameRate="30")]
	public class Main extends Sprite
	{
		public function Main()
		{
			stage.align = StageAlign.LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			/*stage.tabEnabled = false;
			stage.tabChildren = false;
			stage.focusRect = false;
			stage.mouseEnabled = false;
			stage.mouseChildren = false;*/
			
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
			
			/*var testMouseChildren:TestMouseChildren = new TestMouseChildren();
			addChild(testMouseChildren);
			testMouseChildren.x = 100;
			testMouseChildren.y = 100;*/
			
			/*var testCopyPixels:TestCopyPixels = new TestCopyPixels();
			addChild(testCopyPixels);*/
			
			/*var the2048:The2048 = new The2048();
			the2048.x = 90;
			addChild(the2048);
			var testCopyPixels:TestCopyPixels = new TestCopyPixels();
			addChild(testCopyPixels);*/
			
			/*var pathSearchDoc:PathSearchDoc = new PathSearchDoc();
			pathSearchDoc.x = 50;
			addChild(pathSearchDoc);*/
			
			/*var objectAssignTest:ObjectAssignTest = new ObjectAssignTest();
			objectAssignTest.initData();
			objectAssignTest.x = 50;
			addChild(objectAssignTest);*/
			
			var internalClassBuildingVectorTest:InternalClassBuildingVectorTest = new InternalClassBuildingVectorTest();
			addChild(internalClassBuildingVectorTest);
			
			var statsFps:StatsFps = new StatsFps();
			addChild(statsFps);
		}
	}
}
