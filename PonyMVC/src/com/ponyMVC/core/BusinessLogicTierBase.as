package com.ponyMVC.core
{
	import com.ponyMVC.core.BusinessLogicItemBase;
	import com.ponyMVC.core.IBusinessLogicItem;
	
	use namespace ponyMVCS_internal;

	public class BusinessLogicTierBase extends BusinessLogicItemBase
	{
		protected var mBusinessLogicItemsMap:Array = [];

		public function BusinessLogicTierBase()
		{
			super();
		}
		
		ponyMVCS_internal function registerBusinessLogicItem(name:String, item:IBusinessLogicItem):IBusinessLogicItem
		{
			if(!hasBusinessLogicItem(name))
			{
				mBusinessLogicItemsMap[name] = item;
				
				item.setName(name);
				item.setFacade(facade);
				item.setContext(context);
				
				item.onRegister();
				
				return item;
			}
			
			return null;
		}
		
		ponyMVCS_internal function findBusinessLogicItem(name:String):IBusinessLogicItem
		{
			return mBusinessLogicItemsMap[name];
		}
		
		ponyMVCS_internal function removeBusinessLogicItem(name:String):IBusinessLogicItem
		{
			if(hasBusinessLogicItem(name))
			{
				var item:IBusinessLogicItem = findBusinessLogicItem(name);

				delete mBusinessLogicItemsMap[name];

				item.onRemove();

				item.setName(null);
				item.setFacade(null);
				item.setContext(null);
				
				return item;
			}
			
			return null;
		}
		
		ponyMVCS_internal function hasBusinessLogicItem(name:String):Boolean
		{
			return mBusinessLogicItemsMap[name] != null;
		}

		ponyMVCS_internal function removeAllBusinessLogicItems():void
		{
			for(var itemKey:String in mBusinessLogicItemsMap)
			{
				removeBusinessLogicItem(itemKey);
			}
		}
	}
}