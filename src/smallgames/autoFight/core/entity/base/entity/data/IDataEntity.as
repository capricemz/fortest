package smallgames.autoFight.core.entity.base.entity.data
{
	import flash.geom.Point;
	
	import smallgames.autoFight.data.configs.subs.ConfigEntity;

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
		function get configEntity():ConfigEntity;
		//
		function get dirction():Number;
		function get dirctionLast():Number;
		function get isDirctionChange():Boolean;
		//
		function get location():Point;
		function get locationTopLeft():Point;
		function get locationFloorDiffer():Point;
		function get locationLast():Point;
		function get locationLastTopLeft():Point;
		function get isLoactionChange():Boolean;
		//
		function get alpha():Number;
		/**
		 * 设置透明度
		 * @param value 0至1之间的值
		 */		
		function set alpha(value:Number):void;
		function get isAplphaChange():Boolean;
		//
		function get isFirstDrow():Boolean
		//
		/**按指定量偏移方向*/
		function dirctionOffset(value:Number):void;
		/**方向是否相等*/
		function isDirctionEquals(value:Number):Boolean;
		/**按指定量偏移位置*/
		function locationOffset(dx:Number, dy:Number):void;
		/**位置是否相等*/
		function isLocationEquals(value:Point):Boolean;
	}
}