package com.ponyMVC.core
{
	import com.ponyMVC.IFacade;

	public class BusinessLogicItemBase implements IBusinessLogicItem
	{
		private var mName:String;

		protected var facade:IFacade;
		protected var context:Object;
		
		public function BusinessLogicItemBase()
		{
			super();
		}
		
		//IBusinessLogicItem Intgerface
		public function getName():String { return mName; }
		ponyMVCS_internal function setName(value:String):void { mName = value; }
		
		public function getFacade():IFacade { return facade; }
		ponyMVCS_internal function setFacade(value:IFacade):void { facade = value; }
		
		public function getContext():Object { return context; }
		ponyMVCS_internal function setContext(value:Object):void { context = value; }
		
		public function onRegister():void {}
		public function onRemove():void {}
	}
}