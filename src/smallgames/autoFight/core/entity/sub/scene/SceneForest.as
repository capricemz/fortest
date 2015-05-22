package smallgames.autoFight.core.entity.sub.scene
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	
	import smallgames.autoFight.core.entity.base.scene.Scene;
	
	/**
	 * 森林场景类
	 * @author Administrator
	 */	
	public class SceneForest extends Scene implements ISceneForest
	{
		override protected function get bitmapData():BitmapData
		{
			if(!_bitmapData)
			{
				var shape:Shape = new Shape();
				shape.graphics.beginFill(0x00ff00);
				/*shape.graphics.drawCircle(10,10,10);*/
				shape.graphics.drawRect(0,0,20,20);
				shape.graphics.endFill();
				_bitmapData = new BitmapData(20,20,true,0);
				_bitmapData.draw(shape);
			}
			return _bitmapData;
		}
		
		public function SceneForest()
		{
			super();
		}
	}
}