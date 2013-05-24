package com.framework
{
	import com.gamesystem.biology.BiologyModule;
	import com.gamesystem.fight.FightModule;

	/**
	 * 模块注册移除处理类
	 * @author mz
	 */	
	public class ModulesHandle
	{
		private var moduleCtrl:ModuleControl;
		private var fightModule:FightModule,biologyModule:BiologyModule;
		
		public function ModulesHandle()
		{
			moduleCtrl = ModuleControl.getInstance();
			fightModule = new FightModule();
			biologyModule = new BiologyModule();
		}
		/**
		 * 注册所有的模块
		 */		
		public function registerAll():void
		{
			moduleCtrl.registrtModule(ModuleIds.BIOLOGY,biologyModule);
			moduleCtrl.registrtModule(ModuleIds.FIGHT,fightModule);
		}
	}
}