package smallgames.autoFight.core.entity.base.unit
{
	import smallgames.autoFight.core.entity.base.entity.IEntity;

	public interface IUnit extends IEntity
	{
		function get action():String;
		function get target():IUnit;
		function set target(value:IUnit):void;
	}
}