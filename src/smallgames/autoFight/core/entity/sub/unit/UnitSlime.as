package smallgames.autoFight.core.entity.sub.unit
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Matrix;
	
	import smallgames.autoFight.core.entity.base.unit.Unit;
	
	public class UnitSlime extends Unit implements IUnitSlime
	{
		override protected function get bitmapData():BitmapData
		{
			if(!_bitmapData)
			{
				var w:int = 15;
				var h:int = 20;
				var sqrt:Number = Math.sqrt(w*w+h*h);
				var shape:Shape = new Shape();
				shape.graphics.beginFill(0xffffaa);
				shape.graphics.drawEllipse(0,0,w,h);
				shape.graphics.endFill();
				shape.graphics.beginFill(0xffff00);
				shape.graphics.drawCircle(w/2,w/2,w/2);
				shape.graphics.endFill();
				_bitmapData = new BitmapData(sqrt,sqrt,true,0);
				_bitmapData.draw(shape,new Matrix(1,0,0,1,(sqrt - w)*.5,(sqrt - h)*.5));
			}
			return _bitmapData;
		}
		
		public function UnitSlime()
		{
			super();
		}
	}
}