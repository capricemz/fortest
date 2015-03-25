package smallgames.autoFight.core.time
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.getTimer;
	
	import smallgames.autoFight.common.IHandle;
	import smallgames.autoFight.common.ManagerBase;
	import smallgames.autoFight.core.entity.ManagerEntitys;

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
		private var _handles:Vector.<IHandle>;
		
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
			_handles = new Vector.<IHandle>();
		}
		
		public function addFrame(dispatcher:IEventDispatcher):void
		{
			dispatcher.addEventListener(Event.ENTER_FRAME,onEnterFrame);
			_timeLast = getTimer();
		}
		
		public function addHandle(handle:IHandle):void
		{
			_handles.push(handle);
		}
		
		protected function onEnterFrame(event:Event):void
		{
			var timeNow:int = getTimer();
			var timeDiff:int = timeNow - _timeLast;
			_timeLast = timeNow;
			//
			_handles.forEach(function(item:IHandle, index:int, vector:Vector.<IHandle>):void
			{
				var execute:Boolean = item.execute(timeDiff);
				if(execute)
				{
					_handles.splice(index,1);
				}
			});
			//
			ManagerEntitys.instance.updateByFrame(timeDiff);
		}
	}
}