package smallgames.autoFight.core.entity.base.scene
{
	import smallgames.autoFight.core.entity.base.entity.Entity;

	public class Scene extends Entity implements IScene
	{
		public function Scene()
		{
			
		}
		
		override public function updateByTime(timeDiff:int):void
		{
			super.updateByTime(timeDiff);
			/*trace("Scene.updateByTime(timeDiff)场景："+this);*/
		}
	}
}