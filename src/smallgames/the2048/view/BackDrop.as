package smallgames.the2048.view
{
	import flash.display.Sprite;
	
	import smallgames.the2048.model.Consts;
	
	/**
	 * 2048背景类
	 * @author
	 */	
	public class BackDrop extends Sprite
	{
		public function BackDrop()
		{
			super();
			graphics.beginFill(0xcccccc);
			graphics.drawRect(0,0,Consts.BACKDROP_WIDTH,Consts.BACKDROP_HEIGHT);
			graphics.endFill();
			var i:int,j:int,l:int = Consts.BACKDROP_LINES,theX:int,theY:int;
			for(;i<l:i++)
			{
				for(;j<l;j++)
				{
					theX = 55*i+5;
					theY = 55*j+5;
					graphics.beginFill(0x999999);
					graphics.drawRect(theX,theY,Consts.GRID_WIDTH,Consts.GRID_HEIGHT);
					graphics.endFill();
				}
			}
		}
	}
}