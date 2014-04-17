package com.ponyMVC
{
	import com.ponyMVC.core.IBusinessLogicItem;

	public interface ICommand extends IBusinessLogicItem
	{
		function onExcute(commandId:String = null, 
						  commandData:Object = null, 
						  commandType:String = null):void;
	}
}