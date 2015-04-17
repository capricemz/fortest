package smallgames.autoFight.common.filter
{
	import flash.filters.BitmapFilterQuality;
	import flash.filters.ColorMatrixFilter;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	
	/**
	 * 
	 * @author Administrator
	 */	
	public class UtilFilters
	{
		private static const mat:Array = [0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0,0,0,1,0];
		public static const FILTER_COLOR_MATRIX_GREY:ColorMatrixFilter = new ColorMatrixFilter(mat);
		
		public static const FILTER_GLOW_RED:GlowFilter = new GlowFilter(0xff0000,1,2,2,10);
		public static const FILTER_GLOW_YELLOW:GlowFilter = new GlowFilter(0xffff00,.5,5,5,10);
		public static const FILTER_GLOW_BLACK:GlowFilter = new GlowFilter(0,1,2,2,10);
		
		public static const FILTER_DROP_SHADOW:DropShadowFilter = new DropShadowFilter(2.5,45,0,1.0,2.0,2.0,1.0,BitmapFilterQuality.HIGH)
		
		public function UtilFilters()
		{
		}
		
	}
}