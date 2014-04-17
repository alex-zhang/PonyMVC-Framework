package com.ponyMVC
{
	import com.ponyMVC.core.IBusinessLogicItem;

	public interface IModel extends IBusinessLogicItem
	{
		function setData(data:Object):void;
		function getData():Object;
	}
}