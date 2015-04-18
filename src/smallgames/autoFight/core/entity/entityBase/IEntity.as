package smallgames.autoFight.core.entity.entityBase
{
	import smallgames.autoFight.core.entity.data.IDataEntity;

	public interface IEntity
	{
		function get next():IEntity;
		function set next(value:IEntity):void;
		function get data():IDataEntity;
		function set data(value:IDataEntity):void;
		function get name():String;
		function updateByTime(timeDiff:int):void;
	}
}