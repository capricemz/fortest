package smallgames.autoFight.core.entity.entitys.interfaces
{
	public interface IEntity
	{
		function get next():IEntity;
		function updateByTime(time):void;
	}
}