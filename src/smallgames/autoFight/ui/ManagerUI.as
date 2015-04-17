package smallgames.autoFight.ui
{
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	
	import smallgames.autoFight.common.ManagerBase;
	import smallgames.autoFight.ui.uibase.IUIBase;

	public class ManagerUI extends ManagerBase
	{
		private static var _instance:ManagerUI;
		public static function get instance():ManagerUI
		{
			return _instance || new ManagerUI(privateFunc);
		}
		private static function privateFunc():void{}
		
		private var _layer:Sprite;
		private var _uiBases:Dictionary;
		
		public function ManagerUI(func:Function)
		{
			if(func != privateFunc)
			{
				throw new Error("该类使用单例模式");
			}
			_instance = this;
		}
		
		public function initialize(layer:Sprite):void
		{
			_layer = layer;
			_uiBases = new Dictionary();
		}
		
		public function showUIBase(type:int):IUIBase
		{
			var uiBase:IUIBase;
			uiBase = _uiBases[type] as IUIBase;
			if(!uiBase)
			{
				uiBase = createUIBase(type);
			}
			uiBase.show(_layer);
			return uiBase;
		}
		
		public function createUIBase(type:int):IUIBase
		{
			var uiBase:IUIBase = notify(ConstUI.HANDLE_CREATE,type) as IUIBase;
			_uiBases[type] = uiBase;
			return uiBase;
		}
		
		public function hideUIBase(type:int):void
		{
			var uiBase:IUIBase;
			uiBase = _uiBases[type] as IUIBase;
			if(uiBase)
			{
				destoryUIBase(type);
			}
		}
		
		public function destoryUIBase(type:int):void
		{
			delete _uiBases[type];
		}
		
		public function getUIBase(type:String):IUIBase
		{
			return _uiBases[type];
		}
	}
}