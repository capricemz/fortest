package com.gamesystem.biology
{
	import com.framework.IModule;
	
	import flash.utils.ByteArray;
	
	/**
	 * 生物模块接口类
	 * @author mz
	 */	
	public class BiologyModule implements IModule
	{
		public function BiologyModule()
		{
		}
		
		public function handle(msgId:int, msg:ByteArray):void
		{
			switch (msgId)
			{
				case 1:
					break;
			}
		}
	}
}