package smallgames.autoFight.core.entity.base.entity.data
{
	import flash.geom.Point;

	public interface IDataEntity
	{
		function get id():int;
		function set id(value:int):void;
		function get type():int;
		function set type(value:int):void;
		function get location():Point;
		function set location(value:Point):void;
	}
}