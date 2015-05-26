package smallgames.autoFight.data.configs.subs
{
	public class ConfigUnit extends ConfigEntity
	{
		/**思考间隔*/
		public var interval:int;
		/**体力值*/
		public var hp:int;
		/**攻击力*/
		public var atk:int;
		/**攻击距离(像素)*/
		public var atkRange:int;
		/**转动速度(每秒角度)*/
		public var palstance:int;
		/**移动速度(每秒像素)*/
		public var speed:int;
		
		public function ConfigUnit()
		{
		}
	}
}