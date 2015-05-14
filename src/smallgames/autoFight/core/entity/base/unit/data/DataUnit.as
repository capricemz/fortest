package smallgames.autoFight.core.entity.base.unit.data
{
	import smallgames.autoFight.core.entity.base.entity.data.DataEntity;

	/**
	 * 单位数据类
	 * @author Administrator
	 */	
	public class DataUnit extends DataEntity implements IDataUnit
	{
		private var _hp:int;
		public function get hp():int
		{
			return _hp;
		}
		public function set hp(value:int):void
		{
			_hp = value;
		}
		
		private var _atk:int;
		public function get atk():int
		{
			return _atk;
		}
		public function set atk(value:int):void
		{
			_atk = value;
		}
		
		public function DataUnit()
		{
			super();
		}
		
	}
}