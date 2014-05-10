package com.ponyMVC
{
	import com.fireflyLib.utils.EventEmitter;
	import com.ponyMVC.core.BusinessLogicItemBase;

	public class Model extends BusinessLogicItemBase implements IModel
	{
		private var mEventEmitter:EventEmitter;
		
		protected var data:Object;
		
		public function Model(data:Object = null)
		{
			super();
			
			this.data = data;
			mEventEmitter = new EventEmitter(this);
		}
		
		public function setData(value:Object):void
		{
			data = value;
		}
		
		public function getData():Object
		{
			return data;
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