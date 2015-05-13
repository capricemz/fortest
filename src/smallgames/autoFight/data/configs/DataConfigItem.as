package smallgames.autoFight.data.configs
{
	public class DataConfigItem
	{
		public var type:int;
		public var keys:String;
		public var ClassEmbed:Class;
		public var ClassConfig:Class;
		
		public function DataConfigItem(type:int,keys:String,ClassEmbed:Class,ClassConfig:Class)
		{
			this.type = type;
			this.keys = keys;
			this.ClassEmbed = ClassEmbed;
			this.ClassConfig = ClassConfig;
		}
	}
}