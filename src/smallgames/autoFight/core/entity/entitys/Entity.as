package smallgames.autoFight.core.entity.entitys
{
	import smallgames.autoFight.core.entity.entitys.interfaces.IEntity;

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