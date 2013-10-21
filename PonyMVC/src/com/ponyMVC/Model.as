package com.ponyMVC
{
	import com.ponyMVC.core.BusinessLogicItemBase;
	
	import flash.utils.Dictionary;

	public class Model extends BusinessLogicItemBase implements IModel
	{
		private var mEventListeners:Dictionary;
		
		protected var mData:Object;
		
		public function Model(mData:Object = null)
		{
			super();
			
			this.mData = mData;
		}
		
		public function setData(value:Object):void
		{
			mData = value;
		}
		
		public function getData():Object
		{
			return mData;
		}
		
		public function addEventListener(eventType:String, listener:Function):void
		{
			if(mEventListeners == null) mEventListeners = new Dictionary();
			
			var listeners:Vector.<Function> = mEventListeners[eventType] as Vector.<Function>;
			if(listeners == null)
			{
				mEventListeners[eventType] = new <Function>[listener];
			}
			else if (listeners.indexOf(listener) == -1) // check for duplicates
			{
				listeners.push(listener);
			}
		}
		
		public function removeEventListener(eventType:String, listener:Function):void
		{
			if(mEventListeners)
			{
				var listeners:Vector.<Function> = mEventListeners[eventType] as Vector.<Function>;
				if(listeners)
				{
					var delIndex:int = listeners.indexOf(listener);
					if(delIndex != -1)
					{
						listeners.splice(delIndex, 1);
						if(listeners.length == 0) delete mEventListeners[eventType];
					}
				}
			}
		}
		
		public function removeEventListeners(eventType:String = null):void
		{
			if(eventType && mEventListeners)
			{
				delete mEventListeners[eventType];
			}
			else
			{
				mEventListeners = null;
			}
		}
		
		public function dispatchEvent(eventType:String):void
		{
			if(mEventListeners == null) return;
			
			var listeners:Vector.<Function> = mEventListeners[eventType] as Vector.<Function>;
			if(listeners == null) return;
			
			var listenerLength:uint = listeners.length;
			for(var i:int = 0; i < listenerLength; i++)
			{
				listeners[i](this);
			}
		}
		
		public function hasEventListener(eventType:String):Boolean
		{
			var listeners:Vector.<Function> = mEventListeners ?
				mEventListeners[eventType] as Vector.<Function> : null;
			return listeners ? listeners.length != 0 : false;
		}
	}
}