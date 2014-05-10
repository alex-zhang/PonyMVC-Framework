package com.ponyMVC
{
	import com.fireflyLib.utils.IEventEmitter;
	import com.ponyMVC.core.IBusinessLogicItem;

	public interface IModel extends IBusinessLogicItem, IEventEmitter
	{
		function setData(data:Object):void;
		function getData():Object;
	}
}