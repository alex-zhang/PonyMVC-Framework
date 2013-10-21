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
		public function setName(value:String):void { mName = value; }
		
		public function setFacade(value:IFacade):void { facade = value; }
		public function setContext(value:Object):void { context = value; }
		
		public function onRegister():void {};
		public function onRemove():void {};
	}
}