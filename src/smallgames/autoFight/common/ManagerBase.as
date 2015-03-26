package smallgames.autoFight.common
{
	import smallgames.autoFight.common.observer.Subject;

	public class ManagerBase extends Subject
	{
		protected var _handles:Vector.<IHandle>;
		
		public function ManagerBase()
		{
			_handles = new Vector.<IHandle>();
		}
		
		public function addHandle(handle:IHandle):void
		{
			_handles.push(handle);
		}
		
		protected function doHandlesExecute(...args):void
		{
			_handles.forEach(function(item:IHandle, index:int, vector:Vector.<IHandle>):void
			{
				var execute:Boolean = item.execute.apply(null,args);
				if(item.isOverRemove && execute)
				{
					_handles.splice(index,1);
				}
			});
		}
	}
}