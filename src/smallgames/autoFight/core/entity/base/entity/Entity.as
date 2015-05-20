package smallgames.autoFight.core.entity.base.entity
{
	import flash.display.BitmapData;
	import flash.display.Shape;
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
		
		private var _bitmapData:BitmapData;
		
		public function Entity()
		{
			/*throw new Error("该类不能初始化，请使用子类");*/
		}
		
		public final function updateByTime(timeDiff:int,layer:BitmapData):void
		{
			updateData(timeDiff);
			updateLoaction(layer);
		}
		
		protected function updateData(timeDiff:int):void
		{
			
		}
		
		protected function updateLoaction(layer:BitmapData):void
		{
			layer.lock();
			var sourceBitmapData:BitmapData = sourceBitmapData();
			layer.copyPixels(sourceBitmapData,sourceBitmapData.rect,data.location);
			layer.unlock(new Rectangle(data.location.x,data.location.y,sourceBitmapData.width,sourceBitmapData.height));
		}
		
		protected function sourceBitmapData():BitmapData
		{
			if(!_bitmapData)
			{
				var shape:Shape = new Shape();
				shape.graphics.beginFill(0x00ff00);
				shape.graphics.drawCircle(0,0,10);
				shape.graphics.endFill();
				_bitmapData = new BitmapData(20,20,true,0);
				_bitmapData.draw(shape);
			}
			return _bitmapData;
		}
	}
}