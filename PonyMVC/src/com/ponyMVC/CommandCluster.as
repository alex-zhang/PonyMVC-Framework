package com.ponyMVC
{
	import com.ponyMVC.core.BusinessLogicItemBase;
	import com.ponyMVC.core.ponyMVCS_internal;
	use namespace ponyMVCS_internal;
	
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
				mSubCommandClsMap[commandId] = commandCls;
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
		
		public function clearAllSubCommands():void
		{
			mSubCommandClsMap = [];
		}
		
		public function hasSubCommand(commandId:String):Boolean
		{
			return mSubCommandClsMap[commandId] != undefined;
		}
		
		public function getSubCommand(commandId:String):Class
		{
			return mSubCommandClsMap[commandId] as Class;
		}
		
		override public function onExcute(commandId:String = null, 
								  commandData:Object = null, 
								  commandType:String = null):void
		{
			var subCommandCls:Class = mSubCommandClsMap[commandId] as Class;
			if(subCommandCls != null)
			{
				//icommand must is type of BusinessLogicItemBase.
				var command:BusinessLogicItemBase = new subCommandCls();
				
				command.setName(commandId);
				command.setFacade(facade);
				command.setContext(context);//sub command's context is this.
				
				//short life cycle.
				ICommand(command).onExcute(commandId, commandData, commandType);
				
				command.setName(null);
				command.setFacade(null);
				command.setContext(null);
			}
		}
	}
}