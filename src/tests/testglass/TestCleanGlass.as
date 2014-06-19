package tests.testglass
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.BlurFilter;
	import flash.net.URLRequest;
	
	public class TestCleanGlass extends Sprite
	{
		private var _pic:Loader;
		private var bit:Bitmap;
		private var zhezhao:Sprite;
		private var bo:Boolean = false;
		
		public function TestCleanGlass()
		{
			super();
			init();
		}
		private function init():void
		{
			_pic = new Loader();
			_pic.contentLoaderInfo.addEventListener(Event.COMPLETE,loadok);
			_pic.load(new URLRequest('tests/copypixels/bg.jpg'));
		}
		private function loadok(evt:Event):void
		{
			addChild(_pic);
			bit = new Bitmap(evt.target.loader.content.bitmapData);
			////模糊滤镜
			var lvjing:BlurFilter = new BlurFilter(10,10,1);
			//lvjing.blurX = ;
			// lvjing.blurY = ;
			_pic.filters = [lvjing];
			////
			addChild(bit);
			////
			zhezhao = new Sprite();
			bit.mask = zhezhao;
			addChild(zhezhao);
			////
			stage.addEventListener(MouseEvent.MOUSE_DOWN,down);
			stage.addEventListener(MouseEvent.MOUSE_MOVE,mmove);
			stage.addEventListener(MouseEvent.MOUSE_UP,up);
		}
		private function down(evt:MouseEvent):void
		{
			bo = true
		}
		private function up(evt:MouseEvent):void
		{
			bo = false
		}
		private function mmove(evt:MouseEvent):void
		{
			if(bo)
			{
				var a:Shape = new Shape();
				a.graphics.beginFill(0x00ff00);
				a.graphics.drawCircle(mouseX,mouseY,20);
				a.graphics.endFill();
				zhezhao.addChild(a);
			}
		}
	}
}