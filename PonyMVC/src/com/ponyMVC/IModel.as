package com.ponyMVC
{
	import com.ponyMVC.core.IBusinessLogicItem;

	public interface IModel extends IBusinessLogicItem
	{
		function setData(data:Object):void;
		function getData():Object;
		
		function addEventListener(eventType:String, listener:Function):void;
		function removeEventListener(eventType:String, listener:Function):void;
		function removeEventListeners(eventType:String = null):void;
		function dispatchEvent(eventType:String):void;
		function hasEventListener(eventType:String):Boolean;
	}
}