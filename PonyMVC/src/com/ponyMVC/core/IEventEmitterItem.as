package com.ponyMVC.core
{
	public interface IEventEmitterItem
	{
		function addEventListener(eventType:String, listener:Function):void;
		function removeEventListener(eventType:String, listener:Function):void;
		function removeEventListeners(eventType:String = null):void;
		function dispatchEvent(eventType:String, eventData:Object = null):void;
		function hasEventListener(eventType:String):Boolean;
	}
}