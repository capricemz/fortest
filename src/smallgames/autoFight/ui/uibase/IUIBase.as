package smallgames.autoFight.ui.uibase
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;

	public interface IUIBase
	{
		function get skin():DisplayObject
		function show(layer:DisplayObjectContainer):void;
		function hide():void;
	}
}