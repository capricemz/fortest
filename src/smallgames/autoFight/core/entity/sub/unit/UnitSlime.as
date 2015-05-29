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
	
	public class UnitSlime extends Unit implements IUnitSlime
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
		
		public function UnitSlime(value:IDataEntity)
		{
			super(value);
			_aiBase = new AIBase(this);
			_actoinBase = new ActionBase(this);
		}
		
		override protected function createBitmapData():void
		{
			var w:int = 20;
			var h:int = 15;
			var sqrt:Number = Math.sqrt(w*w+h*h);
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0xffffaa);
			shape.graphics.drawEllipse(0,0,w,h);
			shape.graphics.endFill();
			shape.graphics.beginFill(0xffff00);
			shape.graphics.drawCircle(w-h/2,h/2,h/2);
			shape.graphics.endFill();
			_bitmapData = new BitmapData(sqrt,sqrt,true,0);
			_bitmapData.draw(shape,new Matrix(1,0,0,1,(sqrt - w)*.5,(sqrt - h)*.5));
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
			_bitmapData.draw(txt,new Matrix(1,0,0,1,(sqrt - txt.width)*.5,(sqrt - txt.height)*.5));
		}
	}
}