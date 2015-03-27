package smallgames.autoFight.core.entity.entityBase
{
	import smallgames.autoFight.core.entity.data.DataEntity;

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
		
		public function get data():DataEntity
		{
			return null;
		}
		
		public function set data(value:DataEntity):void
		{
			
		}
		
		public function Entity()
		{
			/*throw new Error("该类不能初始化，请使用子类");*/
		}
		
		public function updateByTime(timeDiff:int):void
		{
			
		}
	}
}