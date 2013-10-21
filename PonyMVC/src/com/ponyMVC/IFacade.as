package com.ponyMVC
{
	import com.ponyMVC.core.IModelTier;
	import com.ponyMVC.core.IServiceTier;
	import com.ponyMVC.core.IViewTier;

	public interface IFacade extends IModelTier, IViewTier, IServiceTier
	{
		function sendControllerCommand(name:String, commandId:String = null, 
									   commandData:Object = null, 
									   commandType:String = null):void;
		function sendMediatorCommand(name:String, commandId:String = null, 
									 commandData:Object = null, 
									 commandType:String = null):void;
	}
}