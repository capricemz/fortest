package smallgames.autoFight.common.random
{
	public class UtilRandom
	{
		/**
		 * 以value值为中心点数获得波动随机数
		 * @param value 中心点数
		 * @return 波动随机数
		 */		
		public static function randomWave(value:int):int
		{
			return value * (.7+.6*Math.random());
		}
		
		public function UtilRandom()
		{
		}
	}
}