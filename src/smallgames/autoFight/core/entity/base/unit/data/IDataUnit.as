package smallgames.autoFight.core.entity.base.unit.data
{
	import smallgames.autoFight.core.entity.base.entity.data.IDataEntity;

	public interface IDataUnit extends IDataEntity
	{
		function get hp():int;
		function set hp(value:int):void;
		function get atk():int;
		function set atk(value:int):void;
	}
}