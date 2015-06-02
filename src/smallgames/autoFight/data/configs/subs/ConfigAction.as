package smallgames.autoFight.data.configs.subs
{
	import smallgames.autoFight.data.configs.base.ConfigBase;

	public class ConfigAction extends ConfigBase
	{
		/**动作id*/
		public var id:int;
		/**名称*/
		public var name:String;
		/**持续时间(秒)*/
		public var duration:int;
		
		public function ConfigAction()
		{
		}
	}
}