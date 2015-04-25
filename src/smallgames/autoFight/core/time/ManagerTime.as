package smallgames.autoFight.core.time
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.getTimer;
	
	import smallgames.autoFight.common.ManagerBase;
	import smallgames.autoFight.core.entity.ManagerEntity;
	import smallgames.autoFight.ui.ConstUI;

	/**
	 * 时间管理类
	 * @author Administrator
	 */	
	public class ManagerTime extends ManagerBase
	{
		private static var _instance:ManagerTime;
		public static function get instance():ManagerTime
		{
			return _instance || new ManagerTime(privateFunc);
		}
		private static function privateFunc():void{}
		
		private var _timeLast:int;

		private var _date:Date;
		
		public function ManagerTime(func:Function)
		{
			if(func != privateFunc)
			{
				throw new Error("该类使用单例模式");
			}
			_instance = this;
			initialize();
		}
		
		private function initialize():void
		{
			_date = new Date();
		}
		
		public function addFrame(dispatcher:IEventDispatcher):void
		{
			dispatcher.addEventListener(Event.ENTER_FRAME,onEnterFrame);
			_timeLast = getTimer();
		}
		
		protected function onEnterFrame(event:Event):void
		{
			var timeNow:int = getTimer();
			var timeDiff:int = timeNow - _timeLast;
			_timeLast = timeNow;
			//
			_date.time += timeDiff;
			//
			notify(ConstTime.HANDLE_CREATE);
			//
			ManagerEntity.instance.updateByFrame(timeDiff);
			//
			notify(ConstUI.UI_MAIN_TRACE);
		}
		
		public function textTime():String
		{
			return _date.toString();
		}
	}
}