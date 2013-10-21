package com.ponyMVC.core
{
	import com.ponyMVC.ICommand;
	
	use namespace ponyMVCS_internal;

	public class ControllerTier extends BusinessLogicTierBase implements IControllerTier
	{
		public function ControllerTier()
		{
			super();
		}
		
		public function registerCommand(name:String, command:ICommand):void
		{
			registerBusinessLogicItem(name, command);
		}
		
		public function findCommand(name:String):ICommand
		{
			return findBusinessLogicItem(name) as ICommand;
		}
		
		public function removeCommand(name:String):ICommand
		{
			return removeBusinessLogicItem(name) as ICommand;	
		}
		
		public function hasCommand(name:String):Boolean
		{
			return hasBusinessLogicItem(name);
		}
		
		public function removeAllCommand():void
		{
			removeAllBusinessLogicItems();
		}
	}
}