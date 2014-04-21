package com.ponyMVC
{
	import com.ponyMVC.core.BusinessLogicEventEmitterItem;

	public class Model extends BusinessLogicEventEmitterItem implements IModel
	{
		protected var data:Object;
		
		public function Model(data:Object = null)
		{
			super();
			
			this.data = data;
		}
		
		public function setData(value:Object):void
		{
			data = value;
		}
		
		public function getData():Object
		{
			return data;
		}
	}
}