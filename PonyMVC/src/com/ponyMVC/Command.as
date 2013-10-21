package com.ponyMVC
{
	import com.ponyMVC.core.BusinessLogicItemBase;

	public class Command extends BusinessLogicItemBase implements ICommand
	{
		public function Command()
		{
			super();
		}

		public function onCommand(commandId:String = null, 
								  commandData:Object = null, 
								  commandType:String = null):void
		{
		}
	}
}