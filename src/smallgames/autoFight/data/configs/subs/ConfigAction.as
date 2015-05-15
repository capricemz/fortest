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
				case ConstEntity.UNIT_ACTION_00:
					return StringEntity.UNIT_ACTION_00;
				case ConstEntity.UNIT_ACTION_01:
					return StringEntity.UNIT_ACTION_01;
				case ConstEntity.UNIT_ACTION_02:
					return StringEntity.UNIT_ACTION_02;
				default:
					return StringEntity.UNIT_ACTION_00;
			}
		}
		
		public function ConfigAction()
		{
		}
	}
}