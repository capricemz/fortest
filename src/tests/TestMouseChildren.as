package tests
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * mouseChildren属性测试类<br>用于测试更改父类的mouseChildren属性时子类的mouseEnable属性是否会被修改<br>以及若会被修改则是否会在恢复时同时被恢复
	 * <br>结论：更改父类的mouseChildren属性时子类的mouseEnable属性不会改变
	 * <br>衍生：使用该特性可以实现模态窗口
	 * @author Administrator
	 */	
	public class TestMouseChildren extends Sprite
	{
		public function TestMouseChildren()
		{
			super();
			var par:Sprite = new Sprite();
			addChild(par);
			par.name = "《父对象》";
			par.graphics.beginFill(0x012345);
			par.graphics.drawRect(0,0,100,100);
			par.graphics.endFill();
			
			var sub1:Sprite = new Sprite();
			par.addChild(sub1);
			sub1.name = "《子对象1》";
			sub1.graphics.beginFill(0x234567);
			sub1.graphics.drawRect(0,0,50,50);
			sub1.graphics.endFill();
			sub1.mouseEnabled = false;
			
			var sub2:Sprite = new Sprite();
			par.addChild(sub2);
			sub2.name = "《子对象2》";
			sub2.graphics.beginFill(0x345678);
			sub2.graphics.drawRect(50,50,50,50);
			sub2.graphics.endFill();
			
			var tipBox:Sprite = new Sprite();
			tipBox.name = "《弹出窗》";
			tipBox.graphics.beginFill(0x456789);
			tipBox.graphics.drawRect(25,25,50,50);
			tipBox.graphics.endFill();
			
			addEventListener(MouseEvent.CLICK,function (event:MouseEvent):void
			{
				trace("================================\n点击了的对象："+event.target.name);
				var boolean:Boolean = event.target == sub2;
				var boolean2:Boolean = event.target == tipBox;
				if(boolean || boolean2)
				{
					if(tipBox.parent)
						removeChild(tipBox);
					else
						addChild(tipBox);
					par.mouseEnabled = !par.mouseEnabled;
					par.mouseChildren = !par.mouseChildren;
					trace(par.name+",mouseChildren:"+par.mouseChildren+"|mouseEnabled:"+par.mouseEnabled);
					trace(sub1.name+",mouseEnabled:"+sub1.mouseEnabled);
					trace(sub2.name+",mouseEnabled:"+sub2.mouseEnabled);
				}
			},true);
		}
	}
}