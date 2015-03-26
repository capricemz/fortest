package smallgames.autoFight.common
{
	public interface IHandle
	{
		/**
		 * 执行
		 * @param args 需要的参数
		 * @return 执行结果，true：完成，false：未完成
		 */		
		function execute(...args):Boolean;
		/**
		 * 
		 * @return 执行完成时是否移除Handle
		 */		
		function get isOverRemove():Boolean;
	}
}