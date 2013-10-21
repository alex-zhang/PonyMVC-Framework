package com.ponyMVC.core
{
	import com.ponyMVC.IService;

	public interface IServiceTier extends IBusinessLogicItem
	{
		function registerService(name:String, service:IService):void;
		
		function findService(name:String):IService;
		
		function removeService(name:String):IService;
		
		function hasService(name:String):Boolean;
		
		function removeAllServices():void;
	}
}