package smallgames.autoFight.common.observer
{
	public interface IObserver
	{
		function get id():int;
		function set id(value:int):void;
		function update(...args):*;
	}
}