package smallgames.autoFight.common.random
{
	public class UtilRandom
	{
		/**黄金比例长值*/
		public static const GOLDE_RATIO_X:Number = (Math.sqrt(5) - 1) * .5;
		/**黄金比例短值*/
		public static const GOLDE_RATIO_Y:Number = (3 - Math.sqrt(5)) * .5;
		/**
		 * 以value值为中心点数获得波动随机数
		 * @param value 中心点数
		 * @param wave 波动值,值为0时使用GOLDE_RATIO_Y作为wave值计算
		 * @return 波动随机数
		 */	
		public static function randomWave(value:Number,wave:Number = 0):Number
		{
			if(wave < 0)
			{
				throw new Error("wave值不能小于等于0");
			}
			wave = wave == 0 ? GOLDE_RATIO_Y : wave;
			return value * (1-wave+2*wave*Math.random());
		}
		
		public function UtilRandom()
		{
		}
	}
}