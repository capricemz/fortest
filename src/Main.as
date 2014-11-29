package
{
	import com.util.StatsFps;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import smallgames.autoFight.AutoFight;
	
	import tests.testUseWeakReference.TestUseWeakReference;
	
	[SWF (width="1024", height="768", frameRate="60")]
	public class Main extends Sprite
	{
		private var _fpsH:Number = 100;
		private var _fpsW:Number = 70;
		public function Main()
		{
			stage.align = StageAlign.LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			initTests();
			initSmallGames();
			
			var statsFps:StatsFps = new StatsFps();
			addChild(statsFps);
		}
		
		private function initTests():void
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
			
			/*var testMouseChildren:TestMouseChildren = new TestMouseChildren();
			addChild(testMouseChildren);
			testMouseChildren.x = 100;
			testMouseChildren.y = 100;*/
			
			/*var testCopyPixels:TestCopyPixels = new TestCopyPixels();
			addChild(testCopyPixels);*/
			
			
			/*var pathSearchDoc:PathSearchDoc = new PathSearchDoc();
			pathSearchDoc.x = 50;
			addChild(pathSearchDoc);*/
			
			/*var objectAssignTest:ObjectAssignTest = new ObjectAssignTest();
			objectAssignTest.initData();
			objectAssignTest.x = 50;
			addChild(objectAssignTest);*/
			
			/*var internalClassBuildingVectorTest:InternalClassBuildingVectorTest = new InternalClassBuildingVectorTest();
			addChild(internalClassBuildingVectorTest);*/
			
			/*var testConstructor:TestConstructor = new TestConstructor();
			addChild(testConstructor);*/
			
			/*var testGlassBall:TestGlassBall = new TestGlassBall();
			testGlassBall.x = _fpsW;
			addChild(testGlassBall);*/
			
			/*var testCleanGlass:TestCleanGlass = new TestCleanGlass();
			addChild(testCleanGlass);*/
			
			var testUseWeakReference:TestUseWeakReference = new TestUseWeakReference();
			testUseWeakReference.x = 50;
			testUseWeakReference.y = 50;
			addChild(testUseWeakReference);
			
			/*var testGreenSock:TestGreenSock = new TestGreenSock();
			testGreenSock.x = _fpsW;
			addChild(testGreenSock);*/
			
			var btn:Sprite = new Sprite();
			btn.buttonMode = true;
			var textField:TextField = new TextField();
			textField.text = "测试";
			textField.mouseEnabled = false;
			textField.height = 18;
			textField.width = 50;
			btn.addChild(textField);
			btn.y = _fpsH;
			btn.addEventListener(MouseEvent.CLICK,
				function (event:MouseEvent):void
				{
					/*testConstructor.doTest();*/
					/*testGlassBall.addBall();*/
					/*testGreenSock.doTween();*/
				}
			);
			addChild(btn);
		}
		
		private function initSmallGames():void
		{
			/*var the2048:The2048 = new The2048();
			the2048.x = _fpsW;
			addChild(the2048);*/
			
			var autoFight:AutoFight = new AutoFight();
			autoFight.x = _fpsW;
			addChild(autoFight);
		}
	}
}
