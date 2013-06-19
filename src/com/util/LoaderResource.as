package com.util
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.utils.Dictionary;

	/**
	 * 资源加载控制类
	 * @author mz
	 */	
	public class LoaderResource
	{
		private var loader:Loader,urlLoader:URLLoader;
		private var request:URLRequest,context:LoaderContext,urls:Vector.<String>;
		/**资源存贮对象*/
		private var dic:Dictionary;
		
		public function LoaderResource()
		{
			request = new URLRequest();
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,onHttpStatus);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,onProgress);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onComplete);
		}
		/**
		 * 同步加载
		 * @param urls 资源url组
		 * @param func 加载完所有资源是调用的回调函数
		 */		
		public function syncLoad(urls:Vector.<String>,func:Function):void
		{
			this.urls = urls;
			loadOne(urls.shift());
		}
		/**
		 * 异步加载
		 * @param urls 资源url组
		 * @param func 没加载完成一个资源时调用的回调函数
		 * 
		 */		
		public function asycLoad(ids:Vector.<String>,func:Function):void
		{
			
		}
		/**请求远程资源时调度，用于检测远程资源状态*/
		protected function onHttpStatus(event:HTTPStatusEvent):void
		{
			
		}
		/**加载进度*/
		protected function onProgress(event:ProgressEvent):void
		{
			
		}
		/**加载完成*/
		protected function onComplete(event:Event):void
		{
			if(urls.length != 0)
			{
				loadOne(urls.shift());
			}
		}
		/**加载一个资源*/
		private function loadOne(url:String):void
		{
			request.url = url;
			loader.load(request,context);
		}
	}
}