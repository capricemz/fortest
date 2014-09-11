package tests.rsr
{
	import flash.display.MovieClip;
	import flash.utils.Dictionary;

	/**
	 * 运行时共享资源加载类
	 * @author Administrator
	 */	
	public class RsrLoader
	{
		private var _preUrl:String;
		private var _callBacks:Dictionary;
		
		public function RsrLoader()
		{
		}
		
		public function load(view:MovieClip,preUrl:String):void
		{
			_preUrl = preUrl;
			loopThrough(view);
		}
		/**遍历所有子MC对象*/
		private function loopThrough(view:MovieClip):void
		{
			var i:int,numChildren:int,j:int,totalFrames:int;
			totalFrames = view.totalFrames;
			numChildren = view.numChildren;
//			for(j=0;j<totalFrames;j++)
			//flash frame从1开始的 
			for(j=1;j<=totalFrames;j++)
			{
				view.gotoAndStop(j);
				for(i=0;i<numChildren;i++)
				{
					var mc:MovieClip = view.getChildAt(i) as MovieClip;
					if(mc)
					{
						if(mc.hasOwnProperty("resUrl"))
						{
							var resUrl:String = mc.resUrl as String;
							loadRes(resUrl,mc);
						}
						else
						{
							loopThrough(mc);
						}
					}
				}
			}
		}
		/**加载资源*/
		private function loadRes(resUrl:String, mc:MovieClip):void
		{
			var url:String,split:Array,type:int,rsrLoaderItem:RsrLoaderItem;
			url = _preUrl + resUrl;
			split = resUrl.split(".");
			var suffix:String = "."+split[1];
			if(suffix == ResourcePathConstants.POSTFIX_PNG || suffix == ResourcePathConstants.POSTFIX_JPG)
			{
				type = RsrLoaderItem.TYPE_PIC;
			}
			else if(suffix == ResourcePathConstants.POSTFIX_SWF)
			{
				type = RsrLoaderItem.TYPE_SWF;
			}
			rsrLoaderItem = new RsrLoaderItem();
			rsrLoaderItem.init(type,url,mc);
			if(_callBacks && _callBacks[mc])
			{
				rsrLoaderItem.callBack = _callBacks[mc];
				delete _callBacks[mc];
			}
		}
		/**
		 * 添加回调函数
		 * @param mc触发回调函数的加载元件
		 * @param callBack回调函数,格式function (mc:MovieClip):void
		 */		
		public function addCallBack(mc:MovieClip,callBack:Function):void
		{
			if(!_callBacks)
			{
				_callBacks = new Dictionary();
			}
			_callBacks[mc] = callBack;
		}
	}
}