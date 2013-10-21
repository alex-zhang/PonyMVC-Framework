package com.ponyMVC.core
{
	import com.ponyMVC.IService;
	use namespace ponyMVCS_internal;
	
	public class ServiceTier extends BusinessLogicTierBase implements IServiceTier
	{
		public function ServiceTier()
		{
			super();
		}

		public function registerService(name:String, service:IService):void
		{
			registerBusinessLogicItem(name, service);
		}
		
		public function findService(name:String):IService
		{
			return findBusinessLogicItem(name) as IService;
		}
		
		public function removeService(name:String):IService
		{
			return removeBusinessLogicItem(name) as IService;
		}
		
		public function hasService(name:String):Boolean
		{
			return hasBusinessLogicItem(name);
		}
		
		public function removeAllServices():void
		{
			removeAllBusinessLogicItems();
		}
	}
}