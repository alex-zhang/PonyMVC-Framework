package com.ponyMVC.core
{
	import com.ponyMVC.IFacade;

	public interface IBusinessLogicItem
	{
		function getName():String;
		function getFacade():IFacade;
		function getContext():Object;
		
		function onRegister():void;
		function onRemove():void;
	}
}