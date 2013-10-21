package com.ponyMVC.core
{
	import com.ponyMVC.IFacade;

	public interface IBusinessLogicItem
	{
		function getName():String;
		
		function setName(value:String):void;
		function setFacade(value:IFacade):void;
		function setContext(value:Object):void;
		
		function onRegister():void;
		function onRemove():void;
	}
}