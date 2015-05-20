package smallgames.autoFight.core.entity.sub.scene
{
	import smallgames.autoFight.core.entity.StringEntity;
	import smallgames.autoFight.core.entity.base.scene.Scene;
	
	/**
	 * 森林场景类
	 * @author Administrator
	 */	
	public class SceneForest extends Scene implements ISceneForest
	{
		override public function get name():String
		{
			return StringEntity.SCENE_FOREST;
		}
		
		public function SceneForest()
		{
			super();
		}
	}
}