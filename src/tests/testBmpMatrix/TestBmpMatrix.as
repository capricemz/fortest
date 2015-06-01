package tests.testBmpMatrix
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class TestBmpMatrix extends Sprite
	{
		private var _bitmapDataLayer:BitmapData;
		private var _bitmapDataShow:BitmapData;
		
		private var _entitys:Vector.<Entity>;
		
		public function TestBmpMatrix()
		{
			super();
			//
			createBitmap();
			//
			createEntitys();
		}
		
		private function createBitmap():void
		{
			_bitmapDataLayer = new BitmapData(100,100,true,0);
			_bitmapDataLayer.perlinNoise(100,100,1,0,true,true);
			var bitmap:Bitmap = new Bitmap(_bitmapDataLayer,"auto",true);
			addChild(bitmap);
			//
			_bitmapDataShow = new BitmapData(100,100,true,0);
			bitmap = new Bitmap(_bitmapDataShow,"auto",true);
			bitmap.x = 100;
			addChild(bitmap);
		}
		
		private function createEntitys():void
		{
			_entitys = new Vector.<Entity>();
			var i:int,l:int = 3;
			for (i=0;i<l;i++) 
			{
				var entity:Entity = new Entity(new Point(25*i,0));
				_entitys.push(entity);
			}
		}
				
		public function doTest():void
		{
			var entity:Entity
			_bitmapDataShow.fillRect(_bitmapDataShow.rect,0);
			for each (entity in _entitys)
			{
				entity.showWhatCopy(_bitmapDataShow);
			}
			for each (entity in _entitys)
			{
				entity.copyTempPixels(_bitmapDataLayer);
			}
			for each (entity in _entitys)
			{
				entity.execute();
				entity.updateBitmapData(_bitmapDataLayer);
			}
		}
	}
}
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Shape;
import flash.display.Sprite;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;

class Entity extends Sprite
{
	private var _bitmapData:BitmapData;
	private var _bitmapDataTemp:BitmapData;
	
	private var _dirction:Number = 0;
	private var _dirctionLast:Number;
	
	private var _location:Point;
	private var _locationLast:Point;

	private var _w:int;
	private var _h:int;
	
	public function Entity(location:Point)
	{
		createBitmapData();
		//
		_locationLast = new Point();
		_location = location;
		//
		_dirction = -Math.PI*.125;
	}
	
	private function createBitmapData():void
	{
		_w = 15;
		_h = 20;
		var l:int = Math.sqrt(_w*_w+_h*_h);
		var shape:Shape = new Shape();
		shape.graphics.beginFill(0xffffaa);
		shape.graphics.drawEllipse(0,0,_w,_h);
		shape.graphics.endFill();
		shape.graphics.beginFill(0xffff00);
		shape.graphics.drawCircle(_w/2,_w/2,_w/2);
		shape.graphics.endFill();
		_bitmapData = new BitmapData(l,l,true,0);
		_bitmapData.draw(shape,new Matrix(1,0,0,1,(l - _w)*.5,(l - _h)*.5));
	}
	
	public function showWhatCopy(layer:BitmapData):void
	{
		if(!_bitmapDataTemp)
		{
			return;
		}
		var rect:Rectangle = _bitmapDataTemp.rect.clone();
		rect.offsetPoint(_location);
		layer.fillRect(rect,0);
		layer.copyPixels(_bitmapDataTemp,_bitmapDataTemp.rect,_location,null,null,true);
	}
	
	public function copyTempPixels(layer:BitmapData):void
	{
		bitmapDataTempCopyBack(layer);
		bitmapDataTempCopy(layer);
	}
	
	private function bitmapDataTempCopyBack(layer:BitmapData):void
	{
		if(!_bitmapDataTemp)
		{
			return;
		}
		var _locationLastClone:Point = _locationLast.clone();
		_locationLastClone.setTo(Math.floor(_locationLast.x),Math.floor(_locationLast.y));
		layer.copyPixels(_bitmapDataTemp,_bitmapDataTemp.rect,_locationLastClone,null,null,true);
	}
	
	private function bitmapDataTempCopy(layer:BitmapData):void
	{
		if(!_bitmapDataTemp)
		{
			_bitmapDataTemp = new BitmapData(_bitmapData.width,_bitmapData.height,true,0);
		}
		var sourceRect:Rectangle = _bitmapDataTemp.rect.clone();
		sourceRect.offset(Math.floor(_location.x),Math.floor(_location.y));
		_bitmapDataTemp.copyPixels(layer,sourceRect,new Point());
	}
	
	public function execute():void
	{
		_dirctionLast = _dirction;
		_dirction += Math.PI*.125;
		//
		if(_location.x == 0 && _location.y < 75)
		{
			locationOffset(0,.5)
		}
		else if(_location.x < 75 && _location.y == 75)
		{
			locationOffset(.5,0);
		}
		else if(_location.x == 75 && _location.y > 0)
		{
			locationOffset(0,-.5);
		}
		else if(_location.x > 0 && _location.y == 0)
		{
			locationOffset(-.5,0);
		}
	}
	/**按指定量偏移位置*/
	private function locationOffset(dx:Number, dy:Number):void
	{
		_locationLast.copyFrom(_location);
		_location.offset(dx,dy);
	}
	
	public function updateBitmapData(layer:BitmapData):void
	{
		var clone:BitmapData = _bitmapData.clone();
		var matrix:Matrix = new Matrix(1,0,0,1);
		matrix.rotate(_dirction);
		var dx:Number = Math.SQRT2*_bitmapData.width*.5*(Math.cos(Math.PI*.25) - Math.cos(_dirction+Math.PI*.25));
		var dy:Number = Math.SQRT2*_bitmapData.height*.5*(Math.sin(Math.PI*.25) - Math.sin(_dirction+Math.PI*.25));
		dx += _location.x - Math.floor(_location.x);
		dy += _location.y - Math.floor(_location.y);
		matrix.translate(dx,dy);
		clone.fillRect(_bitmapData.rect,0);
		clone.draw(_bitmapData,matrix,null,null,null,true);
		var _locationClone:Point = _location.clone();
		_locationClone.setTo(Math.floor(_location.x),Math.floor(_location.y));
		layer.copyPixels(clone,clone.rect,_locationClone,null,null,true);
		clone.dispose();
	}
}