package smallgames.autoFight.core.entity.base.scene
{
	import smallgames.autoFight.core.entity.base.entity.Entity;
	import smallgames.autoFight.core.entity.base.scene.data.IDataScene;

	public class Scene extends Entity implements IScene
	{
		public function get dataScene():IDataScene
		{
			return data as IDataScene;
		}
		
		public function Scene()
		{
			
		}
		
		override protected function updateData(timeDiff:int):void
		{
			/*trace("Scene.updateByTime(timeDiff)场景："+this);*/
		}
	}
}