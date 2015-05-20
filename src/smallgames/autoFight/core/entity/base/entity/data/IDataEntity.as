package smallgames.autoFight.core.entity.base.entity.data
{
	public interface IDataEntity
	{
		function get id():int;
		function set id(value:int):void;
		function get type():int;
		function set type(value:int):void;
		function get x():int;
		function set x(value:int):void;
		function get y():int;
		function set y(value:int):void;
	}
}