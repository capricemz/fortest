package tests.testBmpMatrix
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	public class TestBmpMatrix extends Sprite
	{
		private var _bitmapData:BitmapData;
		private var _bitmap:Bitmap;
		private var _dirction:Number = 0;
		private var _dirctionLast:Number;

		public function TestBmpMatrix()
		{
			super();
			var w:int = 15;
			var h:int = 20;
			var l:int = Math.sqrt(w*w+h*h);
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0xffffaa);
			shape.graphics.drawEllipse(0,0,w,h);
			shape.graphics.endFill();
			shape.graphics.beginFill(0xffff00);
			shape.graphics.drawCircle(w/2,w/2,w/2);
			shape.graphics.endFill();
			_bitmapData = new BitmapData(l,l,true,0);
			_bitmapData.draw(shape,new Matrix(1,0,0,1,(l - w)*.5,(l - h)*.5));
			//
			var bitmapData:BitmapData = new BitmapData(100,100,true,0);
			_bitmap = new Bitmap(bitmapData,"auto",true);
			addChild(_bitmap);
			//
			_bitmap.bitmapData.copyPixels(_bitmapData,_bitmapData.rect,new Point(50,50));
		}
		
		public function doTest():void
		{
			_dirctionLast = _dirction;
			_dirction += Math.PI*.125;
			trace("TestBmpMatrix.doTest() dirction:"+_dirction*180/Math.PI);
			var clone:BitmapData = _bitmapData.clone();
			var matrix:Matrix = new Matrix(1,0,0,1);
			matrix.rotate(_dirction);
			var dx:Number = Math.SQRT2*_bitmapData.width*.5*(Math.cos(Math.PI*.25) - Math.cos(_dirction+Math.PI*.25));
			var dy:Number = Math.SQRT2*_bitmapData.height*.5*(Math.sin(Math.PI*.25) - Math.sin(_dirction+Math.PI*.25));
			matrix.translate(dx,dy);
			clone.fillRect(_bitmapData.rect,0);
			clone.draw(_bitmapData,matrix,null,null,null,true);
			//
			_bitmap.bitmapData.copyPixels(clone,clone.rect,new Point(50,50));
			clone.dispose();
		}
	}
}