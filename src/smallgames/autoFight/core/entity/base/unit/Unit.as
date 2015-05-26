package smallgames.autoFight.core.entity.base.unit
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import smallgames.autoFight.core.entity.base.entity.Entity;
	import smallgames.autoFight.core.entity.base.unit.action.ActionBase;
	import smallgames.autoFight.core.entity.base.unit.ai.AIBase;
	import smallgames.autoFight.core.entity.base.unit.data.IDataUnit;

	public class Unit extends Entity implements IUnit
	{
		private var _aiBase:AIBase;
		private var _actoinBase:ActionBase;
		
		public function get dataUnit():IDataUnit
		{
			return data as IDataUnit;
		}
		
		public function Unit()
		{
			super();
			_aiBase = new AIBase(this);
			_actoinBase = new ActionBase(this);
		}
		
		override protected function updateData(timeDiff:int):void
		{
			/*trace("Unit.updateByTime(timeDiff) 单位："+this);*/
			_aiBase.think(timeDiff);
			_actoinBase.execute(timeDiff);
		}
		
		override protected function updateBitmapData(layer:BitmapData):void
		{
			if(!data.isNeedDrow)
			{
				return;
			}
			layer.copyPixels(bitmapDataTemp,bitmapDataTemp.rect,data.locationLast);
			//
			var bitmapData2:BitmapData = new BitmapData();
			var matrix:Matrix = new Matrix(1,0,0,1);
			matrix.rotate(dataUnit.dirction);
			matrix.translate(Math.sin(dataUnit.dirction),Math.cos(dataUnit.dirction));
			bitmapData2.draw(bitmapData,matrix,null,null,null,true);
			//
			var rectangle:Rectangle = new Rectangle();
			rectangle.copyFrom(bitmapData.rect);
			rectangle.offsetPoint(data.location);
			bitmapDataTemp.copyPixels(layer,rectangle,new Point());
			//
			layer.copyPixels(bitmapData,bitmapData.rect,data.location);
		}
	}
}