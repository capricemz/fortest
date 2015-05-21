package smallgames.autoFight.core.entity.base.scene.data
{
	import smallgames.autoFight.core.entity.base.entity.data.IDataEntity;
	import smallgames.autoFight.data.configs.subs.ConfigScene;
	
	public interface IDataScene extends IDataEntity
	{
		function get configScene():ConfigScene;
	}
}