package tests.rsr
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class ButtonCustom extends MovieClip
	{
		//属性变量默认值
		const DEFAULT_TOGGLE:Boolean = false;//可选中，true为可选中，false为不可选中.
		const DEFAULT_BTN_ENABLED:Boolean = true;//可操作，true为可操作，false为不可操作
		const DEFAULT_SELECTED:Boolean = false;//选中状态，true为选中状态，false为不可选中状态
		
		var _toggleInited:Boolean;
		var _btnEnabledInited:Boolean;
		var _selectedInited:Boolean;
		
		//属性变量
		var _toggle:Boolean;//可选中.
		var _btnEnabled:Boolean;//可操作
		var _selected:Boolean;//选中状态
		
		//这个变量不要改
		var _inited:Boolean = false;
		
		public function ButtonCustom()
		{
			super();
			//初始化过程
			addEventListener(MouseEvent.ROLL_OVER, rollOverHandle, false, int.MAX_VALUE, true);
			addEventListener(MouseEvent.ROLL_OUT, rollOutHandle, false, int.MAX_VALUE, true);
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandle, false, int.MAX_VALUE, true);
			addEventListener(MouseEvent.MOUSE_UP, mouseUpHandle, false, int.MAX_VALUE, true);
			addEventListener(MouseEvent.CLICK, clickHandle, false, int.MAX_VALUE, true);
			
			mouseChildren = false;
			
			if (!_toggleInited)
			{
				_toggle = DEFAULT_TOGGLE;
			}
			if (!_btnEnabledInited)
			{
				_btnEnabled = DEFAULT_BTN_ENABLED;
			}
			if (!_selectedInited)
			{
				_selected = DEFAULT_SELECTED;
			}
			
			refresh();
			_inited = true;
		}
		
		//响应函数
		private function rollOverHandle(event:MouseEvent):void
		{
			if (_btnEnabled)
			{
				if (_selected)
				{
					gotoAndStop("selectedOver");
				}
				else
				{
					gotoAndStop("over");
				}
			}
		}
		
		private function rollOutHandle(event:MouseEvent):void
		{
			if (_btnEnabled)
			{
				if (_selected)
				{
					gotoAndStop("selectedUp");
				}
				else
				{
					gotoAndStop("up");
				}
			}
		}
		
		private function mouseDownHandle(event:MouseEvent):void
		{
			if (_btnEnabled)
			{
				if (_selected)
				{
					gotoAndStop("selectedDown");
				}
				else
				{
					gotoAndStop("down");
				}
			}
			else
			{
				event.stopImmediatePropagation();
			}
		}
		
		private function mouseUpHandle(event:MouseEvent):void
		{
			if (_btnEnabled)
			{
			}
			else
			{
				event.stopImmediatePropagation();
			}
		}
		
		
		private function clickHandle(event:MouseEvent):void
		{
			if (_btnEnabled)
			{
				if (_toggle)
				{
					_selected = !_selected;
					if (_selected)
					{
						gotoAndStop("selectedOver");
					}
					else
					{
						gotoAndStop("over");
					}
				}
				else
				{
					gotoAndStop("over");
				}
			}
			else
			{
				event.stopImmediatePropagation();
			}
		}
		
		//对外接口，弱类型下面的对外接口，不是很好
		public function set btnEnabled(value:Boolean):void
		{
			if (!_btnEnabledInited || _btnEnabled != value)
			{
				_btnEnabled = value;
				
				_btnEnabledInited = true;
				
				if (_inited)
				{
					refresh();
				}
			}
		}
		
		public function get btnEnabled():Boolean
		{
			return _btnEnabled;
		}
		
		//toggle会限制_selected的值
		public function set toggle(value:Boolean):void
		{
			if (!_toggleInited || _toggle != value)
			{
				_toggle = value;
				_toggleInited = true;
				if (!_toggle)
				{
					_selected = false;
				}
				if (_inited)
				{
					refresh();
				}
			}
		}
		
		public function get toggle():Boolean
		{
			return _toggle;
		}
		
		public function set selected(value:Boolean):void
		{
			if (!_selectedInited || _toggle && _selected != value)
			{
				_selected = value;
				
				_selectedInited = true;
				
				if (_inited)
				{
					refresh();
				}
			}
		}
		
		public function get selected():Boolean
		{
			return _selected;
		}
		
		private function refresh():void
		{
			if (_btnEnabled)
			{
				if (_selected)
				{
					gotoAndStop("selectedUp");
				}
				else
				{
					gotoAndStop("up");
				}
			}
			else
			{
				if (_selected)
				{
					gotoAndStop("selectedDisabled");
				}
				else
				{
					gotoAndStop("disabled");
				}
			}
		}
	}
}