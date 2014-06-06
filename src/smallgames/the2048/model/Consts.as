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
				var i:int,j:int,l:int = Consts.BACKDROP_LINES,tempVct:Vector.<GridLctDt>,theX:int,theY:int,gridLctDt:GridLctDt,gridLctDt2:GridLctDt;
				_gridLctDts = new Vector.<Vector.<GridLctDt>>(l,true);
				for(i=0;i<l;i++)
				{
					tempVct = new Vector.<GridLctDt>(l,true);
					for(j=0;j<l;j++)
					{
						theX = 55*i+5;
						theY = 55*j+5;
						gridLctDt = new GridLctDt();
						gridLctDt._thisLct = new Point(theX,theY);
						tempVct[j] = gridLctDt;
					}
					_gridLctDts[i] = tempVct;
				}
				for(i=0;i<l;i++)
				{
					for(j=0;j<l;j++)
					{
						gridLctDt = _gridLctDts[i][j];
						if(i>0)
						{
							gridLctDt2 = _gridLctDts[i-1][j];
							gridLctDt._leftLct = gridLctDt2;
							gridLctDt2._rightLct = gridLctDt;
						}
						if(i<l-1)
						{
							gridLctDt2 = _gridLctDts[i+1][j];
							gridLctDt._rightLct = gridLctDt2;
							gridLctDt2._leftLct = gridLctDt;
						}
						if(j>0)
						{
							gridLctDt2 = _gridLctDts[i][j-1];
							gridLctDt._aboveLct = gridLctDt2;
							gridLctDt2._belowLct = gridLctDt;
						}
						if(j<l-1)
						{
							gridLctDt2 = _gridLctDts[i][j+1];
							gridLctDt._belowLct = gridLctDt2;
							gridLctDt2._aboveLct = gridLctDt;
						}
					}
				}
			}
			return _gridLctDts;
		}

		public function Consts()
		{
		}
	}
}