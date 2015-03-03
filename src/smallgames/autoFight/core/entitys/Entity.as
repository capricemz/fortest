package smallgames.autoFight.core.entitys
{
	import smallgames.autoFight.core.entitys.interfaces.IEntity;

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
		
		public function Entity()
		{
			
		}
		
		public function updateByTime(time):void
		{
			
		}
	}
}