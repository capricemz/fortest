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
	}
}