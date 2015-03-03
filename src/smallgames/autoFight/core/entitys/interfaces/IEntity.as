package smallgames.autoFight.core.entitys.interfaces
{
	public interface IEntity
	{
		function get next():IEntity;
		function updateByTime(time):void;
	}
}