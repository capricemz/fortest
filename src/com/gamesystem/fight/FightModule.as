package com.gamesystem.fight
{
	import flash.utils.ByteArray;
	
	import com.framework.IModule;
	
	/**
	 * 战斗模块接口类
	 * @author mz
	 */	
	public class FightModule implements IModule
	{
		public function FightModule()
		{
		}
		
		public function handle(msgId:int, msg:ByteArray):void
		{
			switch (msgId)
			{
				case FightMsgIds.START:
					break;
			}
		}
	}
}