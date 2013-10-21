package com.ponyMVC
{
	import com.ponyMVC.core.BusinessLogicItemBase;

	public class CommandCluster extends BusinessLogicItemBase implements ICommand
	{
		protected var mSubCommandClsMap:Array = [];
		
		public function CommandCluster()
		{
			super();
		}
		
		public function registerSubCommand(commandId:String, commandCls:Class):void
		{
			if(!hasSubCommand(commandId))
			{
				mSubCommandClsMap[commandId];
			}
		}
		
		public function removeSubCommand(commandId:String):Class
		{
			var commandCls:Class = mSubCommandClsMap[commandId] as Class;
			if(commandCls)
			{
				delete mSubCommandClsMap[commandId];
			}
			
			return commandCls;
		}
		
		public function hasSubCommand(commandId:String):Boolean
		{
			return mSubCommandClsMap[commandId] != undefined;
		}
		
		public function getSubCommand(commandId:String):Class
		{
			return mSubCommandClsMap[commandId] as Class;
		}
		
		public function onCommand(commandId:String = null, 
								  commandData:Object = null, 
								  commandType:String = null):void
		{
			var subCommandCls:Class = mSubCommandClsMap[commandId] as Class;
			if(subCommandCls != null)
			{
				var command:ICommand = new subCommandCls();
				
				command.setName(commandId);
				command.setFacade(facade);
				command.setContext(context);
				
				//short life cycle.
				command.onCommand(commandId, commandData, commandType);
				
				command.setName(null);
				command.setFacade(null);
				command.setContext(null);
			}
		}
	}
}