package smallgames.autoFight.core.entity.base.scene
{
	import smallgames.autoFight.core.entity.base.entity.Entity;

	public class Scene extends Entity implements IScene
	{
		public function Scene()
		{
			
		}
		
		override protected function updateData(timeDiff:int):void
		{
			/*trace("Scene.updateByTime(timeDiff)场景："+this);*/
		}
	}
}