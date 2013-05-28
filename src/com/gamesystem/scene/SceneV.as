package com.gamesystem.scene
{
	/**
	 * 场景界面类
	 * @author mz
	 */	
	public class SceneV
	{
		private var model:SceneM;
		
		public function SceneV(model:SceneM)
		{
			this.model = model;
		}
		/**显示场景*/
		public function show():void
		{
			var a:int = 1;
		}
		
		/**清理资源释放内存*/		
		public function unSceneV():void
		{
			
		}
	}
}