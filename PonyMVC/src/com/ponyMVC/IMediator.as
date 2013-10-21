package com.ponyMVC
{
	import com.ponyMVC.core.IBusinessLogicItem;

	public interface IMediator extends IBusinessLogicItem, INotifyable
	{
		function getUITarget():Object;
		function setUITarget(value:Object):void;
	}
}