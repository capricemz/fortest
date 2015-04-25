package smallgames.autoFight.core.entity.entitysub
{
	import smallgames.autoFight.core.entity.entityBase.Scene;
	
	/**
	 * 森林场景类
	 * @author Administrator
	 */	
	public class SceneForest extends Scene implements ISceneForest
	{
		override public function get name():String
		{
			return "森林";
		}
		
		public function SceneForest()
		{
			super();
		}
		
		override public function updateByTime(timeDiff:int):void
		{
			super.updateByTime(timeDiff);
			/*trace("SceneForest.updateByTime(timeDiff) 这是一片森林，"+data.id);*/
		}
	}
}