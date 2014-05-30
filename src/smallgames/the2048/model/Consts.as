package smallgames.the2048.model
{
	import flash.display.BitmapData;
	import flash.geom.Point;

	public class Consts
	{
		public static const BACKDROP_LINES:int = 4,BACKDROP_WIDTH:int = 225,BACKDROP_HEIGHT:int = 225;
		public static const GRID_WIDTH:int = 50,GRID_HEIGHT:int = 50;
		public static const nums:Vector.<int> = new <int>[2,4,8,16,32,64,128,256,512,1024,2048];
		
		private static const colors:Vector.<Number>
			= new <Number>[0x59bbbb11,0x71eded11,0x97bb5911,0xbfed7111,0xd3bf6511,0xffe67a11,0xd3836511,0xff9d7a11,0xd3656511,0xff7a7a11,0xd3658d11];
		private static var _bmpdts:Vector.<BitmapData> = null;
		private static var _gridLctDts:Vector.<Vector.<GridLctDt>> = null;
		
		public static function get bmpdts():Vector.<BitmapData>
		{
			if(_bmpdts == null)
			{
				_bmpdts = new Vector.<BitmapData>();
				for each (var color:int in colors) 
				{
					var bitmapData:BitmapData = new BitmapData(GRID_WIDTH,GRID_HEIGHT,true,color);
					_bmpdts.push(bitmapData);
				}
			}
			return _bmpdts;
		}
		
		public static function get gridLctDts():Vector.<Vector.<GridLctDt>>
		{
			if(_gridLctDts == null)
			{
				_gridLctDts = new Vector.<Vector.<GridLctDt>>();
				var i:int,j:int,l:int = Consts.BACKDROP_LINES,tempVct:Vector.<GridLctDt>,theX:int,theY:int;
				for(i=0;i<l;i++)
				{
					tempVct = new Vector.<GridLctDt>();
					for(j=0;j<l;j++)
					{
						theX = 55*i+5;
						theY = 55*j+5;
						var gridLctDt:GridLctDt = new GridLctDt();
						gridLctDt._thisLct = new Point(theX,theY);
						gridLctDt._aboveLct = theY - Consts.GRID_HEIGHT < 0 ? null : _gridLctDts[theX][theY - Consts.GRID_HEIGHT] ? _gridLctDts[theX][theY - Consts.GRID_HEIGHT] : null;
						if(gridLctDt._aboveLct)
							gridLctDt._aboveLct._belowLct = gridLctDt;
						gridLctDt._belowLct = theY + Consts.GRID_HEIGHT > BACKDROP_HEIGHT ? null : _gridLctDts[theX][theY + Consts.GRID_HEIGHT] ? _gridLctDts[theX][theY + Consts.GRID_HEIGHT] : null;
						if(gridLctDt._belowLct)
							gridLctDt._belowLct._aboveLct = gridLctDt;
						gridLctDt._leftLct = theX - Consts.GRID_WIDTH < 0 ? null : _gridLctDts[theX - Consts.GRID_WIDTH][theY] ? _gridLctDts[theX - Consts.GRID_WIDTH][theY] : null;
						if(gridLctDt._leftLct)
							gridLctDt._leftLct._rightLct = gridLctDt;
						gridLctDt._rightLct = theX + Consts.GRID_WIDTH > BACKDROP_WIDTH ? null : _gridLctDts[theX + Consts.GRID_WIDTH][theY] ? _gridLctDts[theX + Consts.GRID_WIDTH][theY] : null;
						if(gridLctDt._rightLct)
							gridLctDt._rightLct._leftLct = gridLctDt;
						tempVct.push(gridLctDt);
					}
					_gridLctDts.push(tempVct);
				}
			}
			return _gridLctDts;
		}

		public function Consts()
		{
		}
	}
}