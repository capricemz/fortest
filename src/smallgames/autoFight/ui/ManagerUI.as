package smallgames.autoFight.ui
{
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	
	import smallgames.autoFight.common.ManagerBase;
	import smallgames.autoFight.ui.uibase.IUIBase;
	import smallgames.autoFight.ui.uibase.IUIMainBase;
	import smallgames.autoFight.ui.uibase.IUIPanelBase;

	public class ManagerUI extends ManagerBase
	{
		private static var _instance:ManagerUI;
		public static function get instance():ManagerUI
		{
			return _instance || new ManagerUI(privateFunc);
		}
		private static function privateFunc():void{}
		
		private var _layer:Sprite;
		private var _layerUIMain:Sprite;
		private var _layerUIPanel:Sprite;
		//
		private var _uiBases:Dictionary;
		
		public function ManagerUI(func:Function)
		{
			if(func != privateFunc)
			{
				throw new Error("该类使用单例模式");
			}
			_instance = this;
		}
		
		public function initialize(value:Sprite):void
		{
			_layer = value;
			_layerUIMain = new Sprite();
			_layerUIMain.mouseEnabled = false;
			_layer.addChild(_layerUIMain);
			_layerUIPanel = new Sprite();
			_layerUIPanel.mouseEnabled = false;
			_layer.addChild(_layerUIPanel);
			//
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
			var layer:Sprite = uiBase is IUIMainBase ? _layerUIMain : (uiBase is IUIPanelBase ? _layerUIPanel : _layer);
			uiBase.show(layer);
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
		
		public function getUIBase(type:int):IUIBase
		{
			return _uiBases[type];
		}
	}
}