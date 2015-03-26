package smallgames.autoFight.core.entity.entityBase
{

	public class Scene extends Entity implements IScene
	{
		public function Scene()
		{
			
		}
		
		override public function updateByTime(timeDiff:int):void
		{
			super.updateByTime(timeDiff);
			trace("Scene.updateByTime(timeDiff)场景："+this);
		}
	}
}