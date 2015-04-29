package smallgames.autoFight.core.entity.data
{
	/**
	 * 实体数据类
	 * @author Administrator
	 */	
	public class DataEntity implements IDataEntity
	{
		private var _type:int;
		public function get type():int
		{
			return _type;
		}
		public function set type(value:int):void
		{
			_type = value;
		}
		
		public function DataEntity()
		{
			
		}
	}
}