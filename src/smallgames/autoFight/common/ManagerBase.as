package smallgames.autoFight.common
{
	import flash.utils.Dictionary;
	
	import smallgames.autoFight.common.observer.Subject;

	public class ManagerBase extends Subject
	{
		protected var _handles:Dictionary;
		
		public function ManagerBase()
		{
			_handles = new Dictionary();
		}
		
		public function addHandle(id:int,handle:IHandle):void
		{
			if(_handles[id] != handle)
			{
				_handles[id] = handle;
			}
			else
			{
				throw new Error("该Handle添加不能重复添加")
			}
		}
		
		protected function doExecute(id:int,...args):void
		{
			var handle:IHandle = _handles[id] as IHandle;
			if(handle)
			{
				handle.execute.apply(null,args);
			}
			else
			{
				trace("ManagerBase.doExecute(id) 对应的Handle不存在");
			}
		}
		
		protected function doAllExecute(...args):void
		{
			var handle:IHandle;
			for each(handle in _handles)
			{
				var execute:Boolean = handle.execute.apply(null,args);
				if(handle.isOverRemove && execute)
				{
					delete _handles[handle.id];
				}
			}
		}
	}
}