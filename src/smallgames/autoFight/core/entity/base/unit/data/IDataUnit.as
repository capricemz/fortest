package smallgames.autoFight.core.entity.base.unit.data
{
	import smallgames.autoFight.core.entity.base.entity.data.IDataEntity;
	import smallgames.autoFight.core.entity.base.unit.IUnit;
	import smallgames.autoFight.data.configs.subs.ConfigAction;
	import smallgames.autoFight.data.configs.subs.ConfigUnit;

	public interface IDataUnit extends IDataEntity
	{
		function get unitId():int;
		function set unitId(value:int):void;
		function get configUnit():ConfigUnit;
		function get actionId():int;
		function set actionId(value:int):void;
		function get configAction():ConfigAction;
		function get hp():int;
		function set hp(value:int):void;
		function get target():IUnit;
		function set target(value:IUnit):void;
		function get atk():int;
		function set atk(value:int):void;
	}
}