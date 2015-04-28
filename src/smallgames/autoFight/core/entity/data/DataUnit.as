package smallgames.autoFight.core.entity.data
{
	/**
	 * 单位数据类
	 * @author Administrator
	 */	
	public class DataUnit extends DataEntity implements IDataUnit
	{
		public function get hp():int
		{
			return 0;
		}
		
		public function set hp(value:int):void
		{
			
		}
		
		public function get atk():int
		{
			return 0;
		}
		
		public function set atk(value:int):void
		{
			
		}
		
		public function DataUnit()
		{
			super();
		}
		
	}
}