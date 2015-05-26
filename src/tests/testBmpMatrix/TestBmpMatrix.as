package tests.testBmpMatrix
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	
	public class TestBmpMatrix extends Sprite
	{
		private var _bitmapData:BitmapData;
		private var _bitmap:Bitmap;
		private var _dirction:Number = 0;
		
		public function TestBmpMatrix()
		{
			super();
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0xffffaa);
			shape.graphics.drawEllipse(0,0,10,15);
			shape.graphics.endFill();
			shape.graphics.beginFill(0xffff00);
			shape.graphics.drawCircle(5,5,5);
			shape.graphics.endFill();
			_bitmapData = new BitmapData(10,15,true,0);
			_bitmapData.draw(shape);
			_bitmap = new Bitmap(_bitmapData,"auto",true);
			addChild(_bitmap);
		}
		
		public function doTest():void
		{
			_dirction += Math.PI/8;
			var matrix:Matrix = new Matrix(1,0,0,1);
			matrix.rotate(_dirction);
			_bitmapData.draw(_bitmapData,matrix,null,null,true);
		}
	}
}