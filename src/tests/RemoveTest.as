package tests
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;

	/**
	 * 移除测试类
	 * @author mz
	 */	
	public class RemoveTest extends Sprite
	{
		private var btn:TextField;
		
		public function RemoveTest()
		{
			btn = new TextField();
			btn.autoSize = TextFieldAutoSize.LEFT;
			btn.height = 20;
			btn.text = "按钮";
			btn.selectable = false;
			btn.backgroundColor = 0xCCCCCC;
			btn.addEventListener(MouseEvent.CLICK,onClick);
			btn.addEventListener(MouseEvent.ROLL_OVER,onOver);
			btn.addEventListener(MouseEvent.ROLL_OUT,onOut);
			this.addChild(btn);
		}
		
		protected function onOut(event:MouseEvent):void
		{
			btn.background = false;
			Mouse.cursor = MouseCursor.AUTO;
		}
		
		protected function onOver(event:MouseEvent):void
		{
			btn.background = true;
			Mouse.cursor = MouseCursor.BUTTON;
		}
		
		protected function onClick(event:MouseEvent):void
		{
			var urlrequest:URLRequest = new URLRequest("http://www.baidu.com");
//			navigateToURL();
		}
	}
}