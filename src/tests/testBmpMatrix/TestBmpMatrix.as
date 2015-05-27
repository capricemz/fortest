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
		private var _bitmapDataCenter:Point;

		private var _l:Number;
		
		public function TestBmpMatrix()
		{
			super();
			var w:int = 15;
			var h:int = 20;
			_l = Math.sqrt(w*w+h*h);
			var shape:Shape = new Shape();
			/*hape.graphics.beginFill(0xffffaa);
			shape.graphics.drawEllipse(0,0,w,h);
			shape.graphics.endFill();
			shape.graphics.beginFill(0xffff00);
			shape.graphics.drawCircle(w/2,w/2,w/2);
			shape.graphics.endFill();*/
			shape.graphics.beginFill(0xffff00);
			shape.graphics.drawRect(0,0,w,h);
			shape.graphics.endFill();
			_bitmapData = new BitmapData(_l,_l,true,0);
			_bitmapData.draw(shape,new Matrix(1,0,0,1,(_l - w)*.5,(_l - h)*.5));
			_bitmapDataCenter = new Point(_l*.5,_l*.5);
			//
			var bitmapData:BitmapData = new BitmapData(100,100,true,0);
			_bitmap = new Bitmap(bitmapData,"auto",true);
			addChild(_bitmap);
			//
			_bitmap.bitmapData.copyPixels(_bitmapData,_bitmapData.rect,new Point(50,50));
			/*var matrix:Matrix = new Matrix(1,0,0,1);
			matrix.rotate(_dirction);
			matrix.translate(50,50);
			_bitmap.bitmapData.draw(_bitmapData,matrix);*/
			/*var sin:Number = Math.sin(_dirction);
			var cos:Number = Math.cos(_dirction);
			var point:Point = new Point(Math.SQRT2*_l*.5*cos,Math.SQRT2*_l*.5*sin);
			_dirction = Math.PI/4;
			sin = Math.sin(_dirction);
			cos = Math.cos(_dirction);
			var point2:Point = new Point(Math.SQRT2*_l*.5*cos,Math.SQRT2*_l*.5*sin);
			var subtract:Point = point.subtract(point2);
			trace("TestBmpMatrix.doTest() subtract.x:"+subtract.x+",point.y:"+subtract.y);
			matrix.identity();
			matrix.rotate(_dirction);
			matrix.translate(20,20);
			_bitmap.bitmapData.draw(_bitmapData,matrix);*/
		}
		
		public function doTest():void
		{
			/*var sin:Number = Math.sin(_dirction + Math.PI*.125);
			var cos:Number = Math.cos(_dirction + Math.PI*.125);
			var point:Point = new Point(Math.SQRT2*_l*.5*cos,Math.SQRT2*_l*.5*sin);
			trace("TestBmpMatrix.doTest() dirctionLast:"+(_dirction + Math.PI*.25));
			trace("TestBmpMatrix.doTest() cos:"+cos+",sin:"+sin);
			trace("TestBmpMatrix.doTest() point.x:"+point.x+",point.y:"+point.y);
			_dirction += Math.PI*.25;
			sin = Math.sin(_dirction + Math.PI*.125);
			cos = Math.cos(_dirction + Math.PI*.125);
			var point2:Point = new Point(Math.SQRT2*_l*.5*cos,Math.SQRT2*_l*.5*sin);
			trace("TestBmpMatrix.doTest() dirction:"+(_dirction + Math.PI*.25));
			trace("TestBmpMatrix.doTest() cos:"+cos+",sin:"+sin);
			trace("TestBmpMatrix.doTest() point2.x:"+point2.x+",point2.y:"+point2.y);
			var subtract:Point = point.subtract(point2);
			trace("TestBmpMatrix.doTest() subtract.x:"+subtract.x+",point.y:"+subtract.y);
			trace("TestBmpMatrix.doTest()``````````````````````````````````````````````");
			var matrix:Matrix = new Matrix(1,0,0,1);
			matrix.rotate(_dirction);
			matrix.translate(50+ subtract.x,50 + subtract.y);
			_bitmap.bitmapData.draw(_bitmapData,matrix);*/
			
			_dirction += Math.PI*.125;
			var sin:Number = Math.sin(_dirction + Math.PI*.125);
			var cos:Number = Math.cos(_dirction + Math.PI*.125);
			var point:Point = new Point(Math.SQRT2*_l*.5*cos,Math.SQRT2*_l*.5*sin);
			var subtract:Point = _bitmapDataCenter.subtract(point);
			_bitmapDataCenter.copyFrom(point);
			var clone:BitmapData = _bitmapData.clone();
			_bitmapData.fillRect(_bitmapData.rect,0);
			var matrix:Matrix = new Matrix(1,0,0,1);
			matrix.rotate(_dirction);
			matrix.translate(subtract.x,subtract.y);
			_bitmapData.draw(clone,matrix);
			
			_bitmap.bitmapData.copyPixels(_bitmapData,_bitmapData.rect,new Point(50,50));
		}
	}
}