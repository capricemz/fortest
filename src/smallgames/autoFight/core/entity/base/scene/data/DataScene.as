package smallgames.autoFight.core.entity.base.scene.data
{
	import smallgames.autoFight.core.entity.base.entity.data.DataEntity;
	import smallgames.autoFight.data.configs.ConstConfig;
	import smallgames.autoFight.data.configs.ManagerConfig;
	import smallgames.autoFight.data.configs.subs.ConfigScene;
	
	public class DataScene extends DataEntity implements IDataScene
	{
		public function get configScene():ConfigScene
		{
			var config:ConfigScene = ManagerConfig.instance.notify(ConstConfig.HANDLE_GET,ConstConfig.TYPE_SCENE,type) as ConfigScene;
			return config;
		}
		
		public function DataScene()
		{
			super();
		}
	}
}