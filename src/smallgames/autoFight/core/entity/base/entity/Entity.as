package smallgames.autoFight.core.entity.base.entity
{
	import flash.display.BitmapData;
	
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
		
		public function get name():String
		{
			return "";
		}
		
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
			
		}
	}
}