package com.ponyMVC.core
{
	import com.ponyMVC.IMediator;
	use namespace ponyMVCS_internal;
	
	public class ViewTier extends BusinessLogicTierBase implements IViewTier
	{
		public function ViewTier()
		{
			super();
		}
		
		public function registerMediator(name:String, mediator:IMediator):void
		{
			registerBusinessLogicItem(name, mediator as BusinessLogicItemBase);
		}

		public function findMediator(name:String):IMediator
		{
			return findBusinessLogicItem(name) as IMediator;
		}
		
		public function removeMediator(name:String):IMediator
		{
			return removeBusinessLogicItem(name) as IMediator;
		}
		
		public function hasMediator(name:String):Boolean
		{
			return hasBusinessLogicItem(name);
		}
		
		public function removeAllMediator():void
		{
			removeAllBusinessLogicItems();
		}
		
		public function sendNotification(name:String,
						commandId:String = null, 
						commandData:Object = null, 
						commandType:String = null):void
		{
			excuteLogicItemCommand(name, commandId, commandData, commandType);
		}
	}
}