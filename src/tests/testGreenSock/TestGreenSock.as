package tests.testGreenSock
{
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.greensock.easing.Circ;
	import com.greensock.easing.Cubic;
	import com.greensock.easing.Sine;
	
	import flash.display.Sprite;
	
	import tests.testglass.Ball;
	
	/**
	 * 缓动测试类
	 * @author Administrator
	 */	
	public class TestGreenSock extends Sprite
	{
		private var mc:Ball;
		
		public function TestGreenSock()
		{
			super();
			mc = new Ball(10,0x888888);
			mc.x = 40;
			mc.y = 40;
			addChild(mc);
		}
		
		public function doTween():void
		{
			/*TweenMax.to(mc,3,{x:300,ease:Linear.easeNone});*///横向运动不带加速度
			/*TweenMax.to(mc,.5,{x:100,y:100,repeat:1,yoyo:true});*///纵向运行是有加速度的
			
			/*TweenLite.fromTo(mc,1,{x:0,y:0},{x:100,y:100,onComplete:onComplete});*/
			
			TweenMax.to(mc,.5,{y:"100",repeat:1,yoyo:true,ease:Sine.easeIn});
			TweenLite.to(mc,1,{x:100,onComplete:onComplete,ease:Sine.easeIn});
			
			
		}
		
		private function onComplete():void
		{
			trace("TestGreenSock.onComplete() 缓动完成");
		}
	}
}