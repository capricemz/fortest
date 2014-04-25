package smallgames.the2048.view
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import smallgames.the2048.model.Consts;
	
	/**
	 * 2048格子类
	 * @author
	 */	
	public class Grid extends Sprite
	{
		private var _bmp:Bitmap;
		private var _textField:TextField;
		
		public function Grid()
		{
			super();
			_bmp = new Bitmap();
			addChild(_bmp);
			_textField = new TextField();
			_textField.multiline = false;
			_textField.mouseEnabled = false;
			_textField.width = 27;
			_textField.height = 50;
			_textField.x = 16.5;
			var textFormat:TextFormat = _textField.defaultTextFormat;
			textFormat.font = "Bauhaus 93";
			textFormat.size = 40;
			addChild(_textField);
		}
		
		public function setData(index:int):void
		{
			var bmpdts:Vector.<BitmapData> = Consts.bmpdts;
			_bmp.bitmapData = bmpdts[index];
			_textField.text = Consts.nums[index]+"";
		}
	}
}