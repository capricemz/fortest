package smallgames.autoFight.core.entity.base.entity.data
{
	import flash.geom.Point;

	public interface IDataEntity
	{
		/**唯一标识id*/
		function get id():int;
		/**@private*/
		function set id(value:int):void;
		/**实体类型<br>使用ConstEntity中的常量*/
		function get type():int;
		/**@private*/
		function set type(value:int):void;
		function get location():Point;
		/**按指定量偏移位置*/
		function locationOffset(dx:Number, dy:Number):void;
		function get locationLast():Point;
		/**是否需要绘制*/
		function get isNeedDrow():Boolean;
	}
}