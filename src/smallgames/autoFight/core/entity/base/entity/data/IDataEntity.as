package smallgames.autoFight.core.entity.base.entity.data
{
	import flash.geom.Point;

	public interface IDataEntity
	{
		/**唯一标识id*/
		function get id():int;
		function set id(value:int):void;
		function get type():int;
		function set type(value:int):void;
		function get location():Point;
		function locationOffset(dx:Number, dy:Number):void;
		function get locationLast():Point;
		function get isNeedDrow():Boolean;
	}
}