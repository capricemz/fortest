package smallgames.autoFight.ui.uisub
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import smallgames.autoFight.core.entity.ManagerEntity;
	import smallgames.autoFight.core.time.ManagerTime;
	import smallgames.autoFight.ui.uibase.UIMainBase;
	
	/**
	 * 信息输出框
	 * @author Administrator
	 */	
	public class UIMainTrace extends UIMainBase implements IUIMainTrace
	{
		override public function set id(value:int):void
		{
			super.id = value;
			ManagerTime.instance.attach(this);
		}
		private var _skin:ResUIMainTrace;
		
		override public function get skin():DisplayObject
		{
			return _skin;
		}
		
		public function UIMainTrace()
		{
			super();
			_skin = new ResUIMainTrace();
		}
		
		override public function update(...args):*
		{
			var timeDiff:int = args[0] as int;
			clearTxtAll();
			//
			var textTime:String = ManagerTime.instance.textTime();
			_skin.txtTime.htmlText = textTime;
			var managerEntity:ManagerEntity = ManagerEntity.instance;
			var textPlace:String = managerEntity.textPlace();
			_skin.txtPlace.htmlText = textPlace;
			var textUnit:String = managerEntity.textUnit();
			_skin.txtUnit.htmlText = textUnit;
			var textPlot:String = managerEntity.textPlot();
			_skin.txtPlot.htmlText = textPlot;
		}
		
		private function clearTxtAll():void
		{
			_skin.txtTime.text = "";
			_skin.txtPlace.text = "";
			_skin.txtUnit.text = "";
			_skin.txtPlot.text = "";
		}
		
		override public function setPosition(layer:DisplayObjectContainer):void
		{
			skin.x = 0;
			skin.y = 0;
		}
	}
}
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;

import smallgames.autoFight.common.filter.UtilFilters;

class ResUIMainTrace extends Sprite
{
	public var txtTime:TextField;
	public var txtPlace:TextField;
	public var txtUnit:TextField;
	public var txtPlot:TextField;
	
	public function ResUIMainTrace()
	{
		var bg:Sprite = new Sprite();
		bg.graphics.beginFill(0,.2);
		bg.graphics.drawRect(0,0,350,240);
		bg.graphics.endFill();
		addChild(bg);
		//
		var rim:Sprite = new Sprite();
		rim.graphics.lineStyle(2);
		rim.graphics.lineTo(350,0);
		rim.graphics.lineTo(350,240);
		rim.graphics.lineTo(0,240);
		rim.graphics.lineTo(0,0);
		rim.graphics.endFill();
		rim.filters = [UtilFilters.FILTER_DROP_SHADOW];
		addChild(rim);
		//
		txtTime = new TextField();
		txtTime.x = 10;
		txtTime.y = 10;
		txtTime.width = 330;
		txtTime.height = 18;
		txtTime.textColor = 0xffe1aa;
		txtTime.multiline = false;
		txtTime.wordWrap = false;
		txtTime.selectable = false;
		var defaultTextFormat:TextFormat = txtTime.defaultTextFormat;
		defaultTextFormat.font = "SimSun";
		txtTime.defaultTextFormat = defaultTextFormat;
		txtTime.setTextFormat(defaultTextFormat);
		txtTime.filters = [UtilFilters.FILTER_GLOW_BLACK];
		addChild(txtTime);
		//
		txtPlace = new TextField();
		txtPlace.x = 10;
		txtPlace.y = 35;
		txtPlace.width = 330;
		txtPlace.height = 18;
		txtPlace.textColor = 0xffe1aa;
		txtPlace.multiline = false;
		txtPlace.wordWrap = false;
		txtPlace.selectable = false;
		defaultTextFormat = txtPlace.defaultTextFormat;
		defaultTextFormat.font = "SimSun";
		txtPlace.defaultTextFormat = defaultTextFormat;
		txtPlace.setTextFormat(defaultTextFormat);
		txtPlace.filters = [UtilFilters.FILTER_GLOW_BLACK];
		addChild(txtPlace);
		//
		txtUnit = new TextField();
		txtUnit.x = 10;
		txtUnit.y = 60;
		txtUnit.width = 330;
		txtUnit.height = 18;
		txtUnit.textColor = 0xffe1aa;
		txtUnit.multiline = false;
		txtUnit.wordWrap = false;
		txtUnit.selectable = false;
		defaultTextFormat = txtUnit.defaultTextFormat;
		defaultTextFormat.font = "SimSun";
		txtUnit.defaultTextFormat = defaultTextFormat;
		txtUnit.setTextFormat(defaultTextFormat);
		txtUnit.filters = [UtilFilters.FILTER_GLOW_BLACK];
		addChild(txtUnit);
		//
		txtPlot = new TextField();
		txtPlot.x = 10;
		txtPlot.y = 85;
		txtPlot.width = 330;
		txtPlot.height = 144;
		txtPlot.textColor = 0xffe1aa;
		txtPlot.multiline = true;
		txtPlot.wordWrap = true;
		txtPlot.selectable = false;
		defaultTextFormat = txtPlot.defaultTextFormat;
		defaultTextFormat.leading = 4;
		defaultTextFormat.font = "SimSum";
		txtPlot.defaultTextFormat = defaultTextFormat;
		txtPlot.setTextFormat(defaultTextFormat);
		txtPlot.filters = [UtilFilters.FILTER_GLOW_BLACK];
		addChild(txtPlot);
		
	}
}