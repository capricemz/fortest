package smallgames.autoFight.core.entity.base.entity
{
	import flash.display.BitmapData;
	
	import smallgames.autoFight.core.entity.base.entity.data.IDataEntity;

	public interface IEntity
	{
		function get next():IEntity;
		function set next(value:IEntity):void;
		function get data():IDataEntity;
		/**将缓存区域的像素拷贝回位图*/
		function copyTempPixels(layer:BitmapData):void;
		function updateByTime(timeDiff:int,layer:BitmapData):void;
	}
}