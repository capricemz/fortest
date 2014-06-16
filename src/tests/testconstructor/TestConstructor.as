package tests.testconstructor
{
	import flash.display.Sprite;
	import flash.utils.getTimer;
	
	/**
	 * 构造函数速度测试类<br>使用播放器flash player 13.0<br>结论：使用构造函数初始化和使用普通函数初始化，两者速度基本相同，大部分时间使用构造函数初始化略快，偶尔慢于使用普通
	 * @author Administrator
	 */	
	public class TestConstructor extends Sprite
	{
		public function TestConstructor()
		{
			super();
		}
		
		public function doTest():void
		{
			while(numChildren)
			{
				removeChildAt(0);
			}
			var i:int,l:int = 5000,time1:int,time2:int;
			var sprite:Sprite = new Sprite();
			sprite.graphics.beginFill(0x000000);
			sprite.graphics.drawRect(0,0,50,50);
			sprite.graphics.endFill();
			time1 = getTimer();
			for(i=0;i<l;i++)
			{
				var classUseConstructor:ClassUseConstructor = new ClassUseConstructor(sprite,sprite,sprite,sprite,sprite);
				classUseConstructor.x = Math.random()*750;
				classUseConstructor.y = Math.random()*550;
				addChild(classUseConstructor);
			}
			time2 = getTimer();
			trace("使用构造函数初始化，花费时间："+(time2 - time1));
			time1 = getTimer();
			for(i=0;i<l;i++)
			{
				var classUseFunction:ClassUseFunction = new ClassUseFunction();
				classUseFunction.init(sprite,sprite,sprite,sprite,sprite);
				classUseFunction.x = Math.random()*750;
				classUseFunction.y = Math.random()*550;
				addChild(classUseFunction);
			}
			time2 = getTimer();
			trace("使用普通函数初始化，花费时间："+(time2 - time1));
		}
	}
}