package smallgames.autoFight.core.entity.base.entity.data
{

	/**
	 * 实体数据类
	 * @author Administrator
	 */	
	public class DataEntity implements IDataEntity
	{
		private var _id:int;
		public function get id():int
		{
			return _id;
		}
		public function set id(value:int):void
		{
			_id = value;
		}
		
		private var _type:int;
		public function get type():int
		{
			return _type;
		}
		public function set type(value:int):void
		{
			_type = value;
		}
		
		private var _x:int;
		public function get x():int
		{
			return _x;
		}
		public function set x(value:int):void
		{
			_x = value;
		}
		
		private var _y:int;
		public function get y():int
		{
			return _y;
		}
		public function set y(value:int):void
		{
			_y = value;
		}
		
		public function DataEntity()
		{
			
		}
	}
}