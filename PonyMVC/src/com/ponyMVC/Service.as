package com.ponyMVC
{
	import com.fireflyLib.utils.EventEmitter;
	import com.ponyMVC.core.BusinessLogicItemBase;

	public class Service extends BusinessLogicItemBase implements IService
	{
		private var mEventEmitter:EventEmitter;
		
		public function Service()
		{
			super();
			
			mEventEmitter = new EventEmitter(this);
		}
		
		public function addEventListener(eventType:String, listener:Function):void
		{
			mEventEmitter.addEventListener(eventType, listener);
		}
		
		public function removeEventListener(eventType:String, listener:Function):void
		{
			mEventEmitter.removeEventListener(eventType, listener);
		}
		
		public function removeEventListeners(eventType:String = null):void
		{
			mEventEmitter.removeEventListeners(eventType);	
		}
		
		public function hasEventListener(eventType:String):Boolean
		{
			return mEventEmitter.hasEventListener(eventType);
		}
		
		public function dispatchEvent(eventType:String, eventObject:Object = null):void
		{
			mEventEmitter.dispatchEvent(eventType, eventObject);
		}
	}
}