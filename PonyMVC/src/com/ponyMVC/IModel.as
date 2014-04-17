package com.ponyMVC
{
	import com.ponyMVC.core.IBusinessLogicItem;
	import com.ponyMVC.core.IEventEmitterItem;

	public interface IModel extends IBusinessLogicItem, IEventEmitterItem
	{
		function setData(data:Object):void;
		function getData():Object;
	}
}