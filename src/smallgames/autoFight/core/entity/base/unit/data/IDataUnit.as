package smallgames.autoFight.core.entity.base.unit.data
{
	import smallgames.autoFight.core.entity.base.entity.data.IDataEntity;
	import smallgames.autoFight.core.entity.base.unit.IUnit;
	import smallgames.autoFight.data.configs.subs.ConfigAction;
	import smallgames.autoFight.data.configs.subs.ConfigUnit;

	public interface IDataUnit extends IDataEntity
	{
		function get configUnit():ConfigUnit;
		function get idAction():int;
		function set idAction(value:int):void;
		function get configAction():ConfigAction;
		function get attrHp():int;
		function set attrHp(value:int):void;
		function get dirctoin():int;
		function set dirctoin(value:int):void;
		function get target():IUnit;
		function set target(value:IUnit):void;
		function get attrAtk():int;
		function set attrAtk(value:int):void;
	}
}