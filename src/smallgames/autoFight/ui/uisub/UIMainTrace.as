package smallgames.autoFight.ui.uisub
{
	import smallgames.autoFight.ui.uibase.UIMainBase;
	
	/**
	 * 信息输出框
	 * @author Administrator
	 */	
	public class UIMainTrace extends UIMainBase
	{
		public function UIMainTrace()
		{
			super();
			var skin:ResUIMainTrace = new ResUIMainTrace();
			addChild(skin);
		}
	}
}
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;

import smallgames.autoFight.common.filter.UtilFilters;

class ResUIMainTrace extends DisplayObjectContainer
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
		var defaultTextFormat:TextFormat = txtPlot.defaultTextFormat;
		defaultTextFormat.leading = 4;
		txtPlot.defaultTextFormat = defaultTextFormat;
		txtPlot.setTextFormat(defaultTextFormat);
		txtPlot.filters = [UtilFilters.FILTER_GLOW_BLACK];
		addChild(txtPlot);
		
	}
}