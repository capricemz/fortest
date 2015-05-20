package smallgames.autoFight.core.entity.base.unit
{
	import smallgames.autoFight.core.entity.base.entity.IEntity;
	import smallgames.autoFight.core.entity.base.unit.data.IDataUnit;

	public interface IUnit extends IEntity
	{
		function get dataUnit():IDataUnit;
	}
}