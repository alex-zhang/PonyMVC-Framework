package com.ponyMVC.core
{
	use namespace ponyMVCS_internal;

	public class BusinessLogicTierBase extends BusinessLogicItemBase
	{
		protected var mBusinessLogicItemsMap:Array = [];

		public function BusinessLogicTierBase()
		{
			super();
		}
		
		ponyMVCS_internal function registerBusinessLogicItem(name:String, item:BusinessLogicItemBase):BusinessLogicItemBase
		{
			if(item != null && !hasBusinessLogicItem(name))
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
		
		ponyMVCS_internal function findBusinessLogicItem(name:String):BusinessLogicItemBase
		{
			return mBusinessLogicItemsMap[name] as BusinessLogicItemBase;
		}
		
		ponyMVCS_internal function removeBusinessLogicItem(name:String):BusinessLogicItemBase
		{
			if(hasBusinessLogicItem(name))
			{
				var item:BusinessLogicItemBase = findBusinessLogicItem(name);

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
		
		ponyMVCS_internal function callLogicItemMethod(name:String, methodName:String, methodArgs:Array = null):*
		{
			var findedItem:BusinessLogicItemBase = findBusinessLogicItem(name);
			if(findedItem && findedItem.hasOwnProperty(methodName))
			{
				var f:Function = findedItem[methodName] as Function;
				if(f != null)
				{
					return f.apply(null, methodArgs);
				}
				
				return undefined;
			}
			
			return undefined;
		}
		
		ponyMVCS_internal function getLogicItemProperty(name:String, propertyName:String):*
		{
			var findedItem:BusinessLogicItemBase = findBusinessLogicItem(name);
			if(findedItem && findedItem.hasOwnProperty(propertyName))
			{
				return findedItem[propertyName];
			}
			
			return undefined;
		}
		
		ponyMVCS_internal function setLogicItemProperty(name:String, propertyName:String, value:*):void
		{
			var findedItem:BusinessLogicItemBase = findBusinessLogicItem(name);
			if(findedItem && findedItem.hasOwnProperty(propertyName))
			{
				findedItem[propertyName] = value;
			}
		}
	}
}