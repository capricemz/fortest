package smallgames.autoFight.core.entity.sub.unit
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	
	import smallgames.autoFight.core.entity.base.unit.Unit;
	
	public class UnitSlime extends Unit implements IUnitSlime
	{
		override protected function get bitmapData():BitmapData
		{
			if(!_bitmapData)
			{
				var shape:Shape = new Shape();
				shape.graphics.beginFill(0xffffaa);
				shape.graphics.drawEllipse(0,0,10,15);
				shape.graphics.endFill();
				shape.graphics.beginFill(0xffff00);
				shape.graphics.drawCircle(5,2.5,2.5);
				shape.graphics.endFill();
				_bitmapData = new BitmapData(10,15,true,0);
				_bitmapData.draw(shape);
			}
			return _bitmapData;
		}
		
		public function UnitSlime()
		{
			super();
		}
	}
}