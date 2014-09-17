package com.tests
{
	import flash.utils.Proxy;

	public class TestProxy extends Proxy
	{
		public function TestProxy()
		{
		}
	}
}
import flash.utils.Proxy;
import flash.utils.flash_proxy;

dynamic class MyProxy extends Proxy 
{
	flash_proxy override function callProperty(name:*, ...rest):* 
	{ 
		try
		{
			// custom code here 
		}
		catch (e:Error)
		{
			// respond to error here 
		} 
	}
}