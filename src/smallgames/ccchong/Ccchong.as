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
			addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
			addEventListener(Event.ENTER_FRAME,onEnterFrame);
			addEventListener(MouseEvent.CLICK,onClick);
			//
			createScene();
			//
			createMe();
		}
		
		protected function onMouseMove(event:MouseEvent):void
		{
			_unitMe.target.setTo(mouseX,mouseY);
		}
		
		protected function onEnterFrame(event:Event):void
		{
			var timeNow:int = getTimer();
			var timeDiff:int = timeNow - _timeLast;
			_timeLast = timeNow;
			//
			_unitMe.move();
		}
		protected function onClick(event:MouseEvent):void
		{
			_unitMe.charge();
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
			_unitMe.target = new Point(mouseX,mouseY);
			addChild(_unitMe);
		}
	}
}
import flash.display.Sprite;
import flash.geom.Point;
import flash.utils.getTimer;

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
	}
}
class Region extends Scene
{
	public var subs:Vector.<Scene>
	
	public function Region()
	{
		subs = new Vector.<Scene>();
	}
}
class Groud extends Region
{
	public function Groud()
	{
		/*graphics.beginFill();*/
	}
}
class Stone extends Region
{
	public function Stone()
	{
		
	}
}
class Tree extends Region
{
	public function Tree()
	{
		
	}
}
class Unit extends Entity
{
	public var target:Point;
	private var _dirction:Number = 0;
	
	private var _dirctionCharge:Number = 0;
	private var _timeChargeOver:int;
	
	private var _radius:Number = 30;

	public function Unit()
	{
		graphics.beginFill(0xff0000);
		graphics.drawCircle(0,0,_radius);
		graphics.endFill();
	}
	
	public function move():void
	{
		var timeNow:int = getTimer();
		var speedPerFrame:Number;
		if(timeNow < _timeChargeOver)
		{
			_dirction = _dirctionCharge;
			speedPerFrame = 2000/stage.frameRate;
		}
		else
		{
			var ydTarget:Number = target.y - y;
			var xdTarget:Number = target.x - x;
			var distance:Number = Math.sqrt(ydTarget * ydTarget + xdTarget * xdTarget);
			_dirction = Math.atan2(ydTarget,xdTarget);
			speedPerFrame = distance > _radius ? 400/stage.frameRate : 0;
		}
		//
		var sin:Number = Math.sin(_dirction);
		var cos:Number = Math.cos(_dirction);
		x += cos*speedPerFrame;
		y += sin*speedPerFrame;
	}
	
	public function charge():void
	{
		var timeNow:int = getTimer();
		if(timeNow > _timeChargeOver)
		{
			_dirctionCharge = _dirction;
			_timeChargeOver = timeNow + 150;
		}
	}
}