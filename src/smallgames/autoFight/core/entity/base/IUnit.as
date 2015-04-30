package smallgames.autoFight.core.entity.base
{
	public interface IUnit extends IEntity
	{
		function get action():String;
		function get target():IUnit;
	}
}