package smallgames.autoFight.data.configs.subs
{
	import smallgames.autoFight.data.configs.base.ConfigBase;

	public class ConfigUnit extends ConfigBase
	{
		/**单位id*/
		public var id:int;
		/**名称*/
		public var name:String;
		/**移动速度(每秒像素)*/
		public var speed:int;
		
		public function ConfigUnit()
		{
		}
	}
}