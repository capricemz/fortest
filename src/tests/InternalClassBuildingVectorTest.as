package tests
{
	import flash.display.Sprite;
	
	/**
	 * 内部类构建Vector测试类<br>可以执行<br>注意单例模式的实现方式，使用静态常量实现单例模式会引起问题
	 * @author Administrator
	 */	
	public final class InternalClassBuildingVectorTest extends Sprite
	{
		private var vector:Vector.<InfoDatas>;
		
		public function InternalClassBuildingVectorTest()
		{
			super();
			var infoDatas:InfoDatas = new InfoDatas();
			infoDatas.id = 1;
			vector = new Vector.<InfoDatas>();
			vector.push(infoDatas);
			trace(vector);
		}
	}
}
/**
 * 测试信息类
 * @author Administrator
 */
class InfoDatas
{
	public var id:int;
	
	public function InfoDatas()
	{
		
	}
}