package tests.testUseWeakReference
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/**
	 * 事件添加时设置UseWeakReference为true是否会回收事件添加者
	 * @author Administrator
	 */	
	public class TestUseWeakReference extends Sprite
	{
		private var _testBtn:Sprite;

		public function TestUseWeakReference()
		{
			var _continer:TestBtn = new TestBtn(100,100,0x999999);
			addChild(_continer);
			_testBtn = new TestBtn(50,20,0x666666);
			_testBtn.x = 25;
			_testBtn.y = 40;
			_continer.addChild(_testBtn);
			_testBtn.addEventListener(MouseEvent.CLICK,onClick);
		}
		
		protected function onClick(event:MouseEvent):void
		{
			removeChildAt(0);
			/*_testBtn.removeEventListener(MouseEvent.CLICK,onClick);*/
			_testBtn.parent.removeChild(_testBtn);
			_testBtn = null;
		}
	}
}