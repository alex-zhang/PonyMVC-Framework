package com.ponyMVC
{
	import com.ponyMVC.core.BusinessLogicEventEmitterItem;
	
	import flash.utils.Dictionary;

	public class Model extends BusinessLogicEventEmitterItem implements IModel
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
	}
}