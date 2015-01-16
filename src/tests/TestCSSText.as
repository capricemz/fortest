package tests
{
	import flash.display.Sprite;
	import flash.text.StyleSheet;
	import flash.text.TextField;

	/**
	 * css格式应用测试类<br>一个滑过字体变色的百度超链接
	 * @author Administrator
	 */	
	public class TestCSSText extends Sprite
	{
		public function TestCSSText()
		{
			var text:TextField = new TextField();
			text.autoSize = flash.text.TextFieldAutoSize.LEFT;
			addChild(text);
			var sheet:StyleSheet = new StyleSheet();
			sheet.parseCSS('a:link {text-decoration:none;color:blue;}a:hover {text-decoration:underline;color:red;}a:active {text-decoration:none;color:yellow;}');
			text.styleSheet = sheet;
			text.htmlText = "<a href='http://www.baidu.com'>http://www.baidu.com</a>";
		}
		
		/**文字溢出省略号表示*/
		public function get ellipsesStyleSheet():StyleSheet
		{
			var sheet:StyleSheet = new StyleSheet();
			var str:String = ".css1
			{
			color:#6699ff;border:1px #ff8000 dashed;
			margin-bottom:20px;
			width: 20em;/*不允许出现半汉字截断*/
			}
			.css2 {
			overflow: hidden; /*自动隐藏文字*/
			text-overflow: ellipsis;/*文字隐藏后添加省略号*/
			white-space: nowrap;/*强制不换行*/
			width: 20em;/*不允许出现半汉字截断*/
			color:#6699ff;border:1px #ff8000 dashed;
			}"
			sheet.parseCSS(str);
			return 
		}
	}
}