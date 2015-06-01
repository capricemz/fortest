package smallgames.autoFight.core.entity.base.entity
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import smallgames.autoFight.core.entity.base.entity.data.IDataEntity;

	public class Entity implements IEntity
	{
		private var _next:IEntity;
		public function get next():IEntity
		{
			return _next;
		}
		public function set next(value:IEntity):void
		{
			_next = value;
		}
		
		private var _data:IDataEntity;
		public function get data():IDataEntity
		{
			return _data;
		}
		//
		protected var _bitmapData:BitmapData;
		protected var _bitmapDataTemp:BitmapData;
		//
		protected function get isNeedDrow():Boolean
		{
			return data.isFirstDrow || data.isLoactionChange || data.isDirctionChange;
		}
		
		public function Entity(value:IDataEntity)
		{
			/*throw new Error("该类不能初始化，请使用子类");*/
			_data = value;
			createBitmapData();
		}
		
		protected function createBitmapData():void
		{
			
		}
		/**将缓存区域的像素拷贝回位图*/
		public final function copyTempPixels(layer:BitmapData):void
		{
			if(_bitmapDataTemp && !data.isLoactionChange && !data.isDirctionChange)
			{
				return;
			}
			var length:Number = data.configEntity.length;
			if(_bitmapDataTemp)
			{
				layer.copyPixels(_bitmapDataTemp,_bitmapDataTemp.rect,data.locationLastTopLeft,null,null,true);
			}
			if(!_bitmapDataTemp)
			{
				_bitmapDataTemp = new BitmapData(_bitmapData.width,_bitmapData.height,true,0);
			}
			//
			var destPoint:Point = data.locationTopLeft;
			var sourceRect:Rectangle = _bitmapDataTemp.rect.clone();
			sourceRect.offsetPoint(destPoint);
			_bitmapDataTemp.copyPixels(layer,sourceRect,new Point());
		}
		
		public final function updateByTime(timeDiff:int,layer:BitmapData):void
		{
			updateData(timeDiff);
			updateBitmapData(layer);
		}
		
		protected function updateData(timeDiff:int):void
		{
			
		}
		
		private function updateBitmapData(layer:BitmapData):void
		{
			if(!isNeedDrow)
			{
				return;
			}
			var sourceBitmapData:BitmapData = _bitmapData.clone();
			var locationFloorDiffer:Point = data.locationFloorDiffer;
			if(data.dirction != 0 || locationFloorDiffer.length != 0)
			{
				var matrix:Matrix = new Matrix(1,0,0,1);
				matrix.rotate(data.dirction);
				var dx:Number = Math.SQRT2*_bitmapData.width*.5*(Math.cos(Math.PI*.25) - Math.cos(data.dirction + Math.PI*.25));
				var dy:Number = Math.SQRT2*_bitmapData.height*.5*(Math.sin(Math.PI*.25) - Math.sin(data.dirction + Math.PI*.25));
				matrix.translate(dx + locationFloorDiffer.x,dy + locationFloorDiffer.y);
				sourceBitmapData.fillRect(_bitmapData.rect,0);
				sourceBitmapData.draw(_bitmapData,matrix,null,null,null,true);
			}
			//
			layer.copyPixels(sourceBitmapData,sourceBitmapData.rect,data.locationLastTopLeft,null,null,true);
			sourceBitmapData.dispose();
		}
		
		public function destroy():void
		{
			_bitmapData.dispose();
			_bitmapDataTemp.dispose();
			_next = null;
		}
	}
}