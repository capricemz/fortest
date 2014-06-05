package tests.objectassign
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * 传对象赋值测试
	 * @author Administrator
	 */	
	public class ObjectAssignTest extends Sprite
	{
		private var mc:MovieClip;

		private var mcTest:McTest;
		
		public function ObjectAssignTest()
		{
			super();
		}
		
		public function initData():void
		{
			mcTest = new McTest();
			addChild(mcTest);
			mc = mcTest.getChildAt(1) as MovieClip;
			mcTest.addEventListener(MouseEvent.CLICK,onClick);
		}
		
		protected function onClick(event:MouseEvent):void
		{
			trace(mc);
			trace(mcTest.mc);
			var mcAdded:McAdded = new McAdded();
			var index:int = mc.parent.getChildIndex(mc);
			mcAdded.x = mc.x;
			mcAdded.y = mc.y;
			mcAdded.name = mc.name;
			mc.parent.addChildAt(mcAdded,index);
			mc.parent.removeChild(mc);
			mcAdded.parent[mc.name] = mcAdded;
			mc = mcAdded;
			trace(mc);
			trace(mcTest.mc);
		}
	}
}