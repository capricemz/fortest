package smallgames.autoFight.core.entity.sub.unit
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import smallgames.autoFight.common.filter.UtilFilters;
	import smallgames.autoFight.core.entity.base.entity.data.IDataEntity;
	import smallgames.autoFight.core.entity.base.unit.Unit;
	import smallgames.autoFight.core.entity.base.unit.action.ActionBase;
	import smallgames.autoFight.core.entity.base.unit.ai.AIBase;
	
	public class UnitRat extends Unit implements IUnitRat
	{
		private var _aiBase:AIBase;
		private var _actoinBase:ActionBase;
		
		override protected function get aiBase():AIBase
		{
			return _aiBase;
		}
		
		override protected function get actionBase():ActionBase
		{
			return _actoinBase;
		}
		
		public function UnitRat(value:IDataEntity)
		{
			super(value);
			_aiBase = new AIBase(this);
			_actoinBase = new ActionBase(this);
		}
		
		override protected function createBitmapData():void
		{
			var width:int = dataUnit.configUnit.width;
			var height:int = dataUnit.configUnit.height;
			var length:Number = dataUnit.configUnit.length;
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0x660000);
			shape.graphics.drawEllipse(0,0,width,height);
			shape.graphics.endFill();
			shape.graphics.beginFill(0x666600);
			shape.graphics.drawCircle(width-height/2,height/2,height/2);
			shape.graphics.endFill();
			_bitmapData = new BitmapData(length,length,true,0);
			_bitmapData.draw(shape,new Matrix(1,0,0,1,(length - width)*.5,(length - height)*.5));
			//
			var txt:TextField = new TextField();
			txt.height = 16;
			txt.textColor = 0xffe1aa;
			txt.multiline = false;
			txt.wordWrap = false;
			txt.selectable = false;
			var defaultTextFormat:TextFormat = txt.defaultTextFormat;
			defaultTextFormat.font = "SimSun";
			defaultTextFormat.size = 12;
			txt.defaultTextFormat = defaultTextFormat;
			txt.setTextFormat(defaultTextFormat);
			txt.filters = [UtilFilters.FILTER_GLOW_BLACK];
			txt.text = dataUnit.id+"";
			txt.width = txt.textWidth + 3;
			_bitmapData.draw(txt,new Matrix(1,0,0,1,(length - txt.width)*.5,(length - txt.height)*.5));
		}
	}
}