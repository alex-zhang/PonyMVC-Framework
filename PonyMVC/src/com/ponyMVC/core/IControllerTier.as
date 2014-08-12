package com.ponyMVC.core
{
	import com.ponyMVC.ICommand;

	public interface IControllerTier extends IBusinessLogicItem
	{
		function registerCommand(name:String, controller:ICommand):void;
		function findCommand(name:String):ICommand;
		function removeCommand(name:String):ICommand;
		function hasCommand(name:String):Boolean;
		function removeAllCommand():void;
		
		function sendCommand(name:String,
							 commandId:String = null, 
							 commandData:Object = null, 
							 commandType:String = null):void;
	}
}