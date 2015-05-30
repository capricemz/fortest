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
				var destPointLast:Point = data.locationLast.clone();
				destPointLast.offset(-length*.5,-length*.5);
				trace("Entity.copyTempPixels(layer) this:"+this+",destPointLast.x:"+destPointLast.x+",destPointLast.y:"+destPointLast.y);
				layer.copyPixels(_bitmapDataTemp,_bitmapDataTemp.rect,destPointLast,null,null,true);
			}
			if(!_bitmapDataTemp)
			{
				_bitmapDataTemp = new BitmapData(_bitmapData.width,_bitmapData.height,true,0);
			}
			//
			var destPoint:Point = data.location.clone();
			destPoint.offset(-length*.5,-length*.5);
			trace("Entity.copyTempPixels(layer) this:"+this+",destPoint.x:"+destPoint.x+",destPoint.y:"+destPoint.y);
			_bitmapDataTemp.fillRect(_bitmapDataTemp.rect,0);
			var sourceRect:Rectangle = _bitmapDataTemp.rect.clone();
			sourceRect.offsetPoint(destPoint);
			_bitmapDataTemp.copyPixels(layer,sourceRect,new Point(),null,null,true);
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
			if(!data.isFirstDrow && !data.isLoactionChange && !data.isDirctionChange)
			{
				return;
			}
			var sourceBitmapData:BitmapData = _bitmapData.clone();
			if(data.dirction != 0)
			{
				var matrix:Matrix = new Matrix(1,0,0,1);
				matrix.rotate(data.dirction);
				var dx:Number = Math.SQRT2*_bitmapData.width*.5*(Math.cos(Math.PI*.25) - Math.cos(data.dirction + Math.PI*.25));
				var dy:Number = Math.SQRT2*_bitmapData.height*.5*(Math.sin(Math.PI*.25) - Math.sin(data.dirction + Math.PI*.25));
				matrix.translate(dx,dy);
				sourceBitmapData.fillRect(_bitmapData.rect,0);
				sourceBitmapData.draw(_bitmapData,matrix,null,null,null,true);
			}
			//
			var destPoint:Point = data.location.clone();
			var length:Number = data.configEntity.length;
			destPoint.offset(-length*.5,-length*.5);
			layer.copyPixels(sourceBitmapData,sourceBitmapData.rect,destPoint,null,null,true);
			sourceBitmapData.dispose();
		}
	}
}