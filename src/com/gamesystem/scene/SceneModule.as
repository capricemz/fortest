package com.gamesystem.scene
{
	import com.framework.BasicModule;
	import com.framework.IModule;
	import com.framework.ModuleIds;
	
	import flash.utils.ByteArray;
	
	/**
	 * 场景模块类
	 * @author mz
	 */	
	public class SceneModule extends BasicModule
	{
		private var model:SceneM,view:SceneV,ctrl:SceneC;
		
		public function SceneModule()
		{
			super();
		}
		public function handle(msgId:int, msg:ByteArray):void
		{
			switch (msgId)
			{
				case SceneMsgIds.INIT:
					model = new SceneM();
					view = new SceneV(model);
					ctrl = new SceneC(model);
					moduleCtrl.callModule(ModuleIds.SCENE,SceneMsgIds.INIT_OVER);
					break;
				case SceneMsgIds.INIT_OVER:
					view.show();
					break;
			}
		}
	}
}