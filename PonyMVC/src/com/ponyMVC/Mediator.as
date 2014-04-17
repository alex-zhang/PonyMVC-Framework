package com.ponyMVC
{
	import com.ponyMVC.core.BusinessLogicItemBase;

	public class Mediator extends BusinessLogicItemBase implements IMediator
	{
		protected var uiTarget:Object
		
		public function Mediator(uiTarget:Object = null)
		{
			super();
			
			this.uiTarget = uiTarget;
		}
		
		//IMediator Interface
		public function getUITarget():Object
		{
			return uiTarget;
		}
		
		public function setUITarget(value:Object):void
		{
			uiTarget = value;
		}
	}
}