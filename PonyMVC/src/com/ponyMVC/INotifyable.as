package com.ponyMVC
{
	public interface INotifyable
	{
		function onCommand(commandId:String = null, 
						   commandData:Object = null, 
						   commandType:String = null):void;
	}
}