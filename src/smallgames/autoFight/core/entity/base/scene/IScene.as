package smallgames.autoFight.core.entity.base.scene
{
	import smallgames.autoFight.core.entity.base.entity.IEntity;
	import smallgames.autoFight.core.entity.base.scene.data.IDataScene;

	public interface IScene extends IEntity
	{
		function get dataScene():IDataScene;
	}
}