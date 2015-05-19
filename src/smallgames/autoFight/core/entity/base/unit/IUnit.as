package smallgames.autoFight.core.entity.base.unit
{
	import smallgames.autoFight.core.entity.base.entity.IEntity;
	import smallgames.autoFight.core.entity.base.unit.data.IDataUnit;

	public interface IUnit extends IEntity
	{
		function get dataUnit():IDataUnit;
		function get action():String;
		function get target():IUnit;
		function set target(value:IUnit):void;
	}
}