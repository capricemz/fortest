package smallgames.autoFight.core.entity.entityBase
{
	public interface IEntity
	{
		function get next():IEntity;
		function set next(value:IEntity):void;
		function updateByTime(timeDiff:int):void;
	}
}