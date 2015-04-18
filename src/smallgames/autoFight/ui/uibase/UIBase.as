package smallgames.autoFight.ui.uibase
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	import smallgames.autoFight.common.observer.IObserver;
	
	/**
	 * 用户界面基础类
	 * @author Administrator
	 */	
	public class UIBase implements IUIBase,IObserver
	{
		protected var _id:int;
		public function get id():int
		{
			return _id;
		}
		
		public function set id(value:int):void
		{
			_id = value;
		}
		
		public function get skin():DisplayObject
		{
			return null;
		}
		
		public function UIBase()
		{
			
		}
		
		public function show(layer:DisplayObjectContainer):void
		{
			if(skin && !skin.parent)
			{
				setPosition(layer);
				layer.addChild(skin);
			}
		}
		
		public function setPosition(layer:DisplayObjectContainer):void
		{
			skin.x = (layer.stage.stageWidth - skin.width)*.5;
			skin.y = (layer.stage.stageHeight - skin.height)*.5;
		}
		
		public function hide():void
		{
			if(skin && skin.parent)
			{
				skin.parent.removeChild(skin);
			}
		}
		
		public function update(...args):*
		{
			
		}
	}
}