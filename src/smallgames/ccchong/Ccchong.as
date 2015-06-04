package smallgames.ccchong
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.getTimer;
	
	/**
	 * 冲冲冲
	 * @author Administrator
	 */	
	public class Ccchong extends Sprite
	{
		private var _timeLast:int;
		
		private var _scene:Scene;
		private var _unitMe:Unit;
		
		public function Ccchong()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
		}
		
		protected function onAddToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.quality = StageQuality.BEST;
			stage.frameRate = 60;//帧频
			stage.stageFocusRect = false;//tab键不会出现黄色的框框
			initialize();
			width = 1024;
			height = 768;
			x = (stage.stageWidth - width)*.5;
			y = (stage.stageHeight - height)*.5;
		}
		
		private function initialize():void
		{
			addEventListener(MouseEvent.CLICK,onClick);
			//
			addEventListener(Event.ENTER_FRAME,onEnterFrame);
			//
			createScene();
			//
			createMe();
		}
		
		protected function onClick(event:MouseEvent):void
		{
			_unitMe.targetCharge = new Point(mouseX,mouseY);
		}
		
		protected function onEnterFrame(event:Event):void
		{
			var timeNow:int = getTimer();
			var timeDiff:int = timeNow - _timeLast;
			_timeLast = timeNow;
			//
			_unitMe.target = new Point(mouseX,mouseY);
			_unitMe.move();
		}
		
		private function createScene():void
		{
			_scene = new Scene();
			addChild(_scene);
		}
		
		private function createMe():void
		{
			_unitMe = new Unit();
			_unitMe.x = _scene.width*.5;
			_unitMe.y = _scene.height*.5;
			addChild(_unitMe);
		}
	}
}
import flash.display.Sprite;
import flash.geom.Point;

class Entity extends Sprite
{
	public function Entity()
	{
		
	}
}
class Scene extends Entity
{
	public function Scene()
	{
		graphics.beginFill(0x000000);
		graphics.drawRect(0,0,1024,768);
		graphics.endFill();
	}
}
class Unit extends Entity
{
	public var target:Point;
	public var targetCharge:Point;
	
	private var radius:Number = 30;
	
	public function Unit()
	{
		graphics.beginFill(0xff0000);
		graphics.drawCircle(0,0,radius);
		graphics.endFill();
	}
	
	public function move():void
	{
		var distance:Number;
		var dirction:Number;
		if(targetCharge)
		{
			var ydTargetCharge:Number = targetCharge.y - y;
			var xdTargetCharge:Number = targetCharge.x - x;
			distance = Math.sqrt(xdTargetCharge * xdTargetCharge + ydTargetCharge * ydTargetCharge);
			dirction = Math.atan2(ydTargetCharge,xdTargetCharge);
			if(distance < radius)
			{
				targetCharge = null;
			}
		}
		else
		{
			var ydTarget:Number = target.y - y;
			var xdTarget:Number = target.x - x;
			distance = Math.sqrt(xdTarget * xdTarget + ydTarget * ydTarget);
			dirction = Math.atan2(ydTarget,xdTarget);
		}
		//
		var speedPerFrame:Number = /*(-(targetCharge ? 4 : 1)/(distance-2))**/200/stage.frameRate;
		var sin:Number = Math.sin(dirction);
		var cos:Number = Math.cos(dirction);
		x += cos*speedPerFrame;
		y += sin*speedPerFrame;
	}
}