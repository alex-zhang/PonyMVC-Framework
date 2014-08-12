package com.ponyMVC
{
	import com.ponyMVC.core.IBusinessLogicItem;

	public interface IMediator extends IBusinessLogicItem
	{
		function getUITarget():Object;
		function setUITarget(value:Object):void;
		
		function onExcute(commandId:String = null, 
								 commandData:Object = null, 
								 commandType:String = null):void;
	}
}