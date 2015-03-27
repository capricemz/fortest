package smallgames.autoFight.core.entity.entityBase
{
	import smallgames.autoFight.core.entity.data.DataEntity;

	public interface IEntity
	{
		function get next():IEntity;
		function set next(value:IEntity):void;
		function get data():DataEntity;
		function set data(value:DataEntity):void;
		function updateByTime(timeDiff:int):void;
	}
}