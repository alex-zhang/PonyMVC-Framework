package com.ponyMVC
{
	import com.ponyMVC.core.IBusinessLogicItem;

	public interface IMediator extends IBusinessLogicItem
	{
		function getUITarget():Object;
		function setUITarget(value:Object):void;
	}
}