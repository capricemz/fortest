package smallgames.autoFight.core.entity.base.entity
{
	import flash.display.BitmapData;
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
		public function set data(value:IDataEntity):void
		{
			_data = value;
		}
		
		protected var _bitmapData:BitmapData;
		protected function get bitmapData():BitmapData
		{
			return null;
		}
		protected var bitmapDataTemp:BitmapData;
		
		public function Entity()
		{
			/*throw new Error("该类不能初始化，请使用子类");*/
			bitmapDataTemp = new BitmapData(bitmapData.width,bitmapData.height,true,0);
		}
		
		public final function updateByTime(timeDiff:int,layer:BitmapData):void
		{
			updateData(timeDiff);
			updateBitmapData(layer);
		}
		
		protected function updateData(timeDiff:int):void
		{
			
		}
		
		protected function updateBitmapData(layer:BitmapData):void
		{
			if(!data.isNeedDrow)
			{
				return;
			}
			layer.copyPixels(bitmapDataTemp,bitmapDataTemp.rect,data.locationLast);
			//
			var rectangleClone:Rectangle = bitmapDataTemp.rect.clone();
			rectangleClone.offsetPoint(data.location);
			bitmapDataTemp.copyPixels(layer,rectangleClone,new Point());
			//
			layer.copyPixels(bitmapData,bitmapData.rect,data.location);
		}
	}
}