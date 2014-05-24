package smallgames.the2048.view
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import smallgames.the2048.model.Consts;
	import smallgames.the2048.model.GridLctDt;
	
	/**
	 * 2048格子类
	 * @author
	 */	
	public class Grid extends Sprite
	{
		private var _bmp:Bitmap;
		private var _textField:TextField;
		private var _gridLctDt:GridLctDt;
		
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
			_textField.x = 14;
			var textFormat:TextFormat = _textField.defaultTextFormat;
			textFormat.font = "Bauhaus 93";
			textFormat.bold = true;
			textFormat.size = 40;
			_textField.defaultTextFormat = textFormat;
			_textField.setTextFormat(textFormat);
			addChild(_textField);
		}
		
		public function setData(index:int):void
		{
			var bmpdts:Vector.<BitmapData> = Consts.bmpdts;
			_bmp.bitmapData = bmpdts[index];
			_textField.text = Consts.nums[index]+"";
		}
		
		public function reset():void
		{
			_bmp.bitmapData = null;
			_textField.text = "";
		}

		public function get gridLctDt():GridLctDt
		{
			return _gridLctDt;
		}

		public function set gridLctDt(value:GridLctDt):void
		{
			_gridLctDt = value;
			x = _gridLctDt.thisLct.x;
			y = _gridLctDt.thisLct.y;
			_gridLctDt.isEmpty = false;
		}
	}
}