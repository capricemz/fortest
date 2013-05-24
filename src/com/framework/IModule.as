package com.framework
{
	import flash.utils.ByteArray;

	/**
	 * 模块接口
	 * @author mz
	 */	
	public interface IModule
	{
		public function IModule()
		{
		}
		/**
		 * 消息处理
		 * @param msgId 消息id
		 * @param msg 消息内容
		 */		
		public function handle(msgId:int,msg:ByteArray):void
	}
}