package smallgames.autoFight.data.configs.subs
{
	import smallgames.autoFight.core.entity.ConstEntity;
	import smallgames.autoFight.core.entity.StringEntity;

	public class ConfigAction
	{
		public var index:int;
		public var id:int;
		public var duration:int;
		/**
		 * 获得动作名称
		 * @return 
		 */		
		public function get action():String
		{
			switch(id)
			{
				case ConstEntity.UNIT_ACTION_01:
					return StringEntity.ACTION_01;
				case ConstEntity.UNIT_ACTION_02:
					return StringEntity.ACTION_02;
				case ConstEntity.UNIT_ACTION_03:
					return StringEntity.ACTION_03;
				default:
					return StringEntity.ACTION_01;
			}
		}
		
		public function ConfigAction()
		{
		}
	}
}