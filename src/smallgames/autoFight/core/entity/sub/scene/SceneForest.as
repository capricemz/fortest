package smallgames.autoFight.core.entity.sub.scene
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	
	import smallgames.autoFight.core.entity.base.entity.data.IDataEntity;
	import smallgames.autoFight.core.entity.base.scene.Scene;
	
	/**
	 * 森林场景类
	 * @author Administrator
	 */	
	public class SceneForest extends Scene implements ISceneForest
	{
		public function SceneForest(value:IDataEntity)
		{
			super(value);
		}
		
		override protected function createBitmapData():void
		{
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0x00ff00);
			/*shape.graphics.drawCircle(10,10,10);*/
			shape.graphics.drawRect(0,0,20,20);
			shape.graphics.endFill();
			_bitmapData = new BitmapData(20,20,true,0);
			_bitmapData.draw(shape);
		}
	}
}