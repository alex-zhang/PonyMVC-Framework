package com.ponyMVC
{
	import com.ponyMVC.core.BusinessLogicTierBase;
	import com.ponyMVC.core.ControllerTier;
	import com.ponyMVC.core.IControllerTier;
	import com.ponyMVC.core.IModelTier;
	import com.ponyMVC.core.IServiceTier;
	import com.ponyMVC.core.IViewTier;
	import com.ponyMVC.core.ModelTier;
	import com.ponyMVC.core.ServiceTier;
	import com.ponyMVC.core.ViewTier;
	import com.ponyMVC.core.ponyMVCS_internal;
	
	use namespace ponyMVCS_internal;

	public class Facade extends BusinessLogicTierBase implements IFacade
	{
		protected var myControllerTier:IControllerTier;
		protected var myModelTier:IModelTier;
		protected var myServiceTier:IServiceTier;
		protected var myViweTier:IViewTier;

		public function Facade(context:Object)
		{
			super();
			
			this.setContext(context);
			this.setFacade(this);
			
			initialize();
		}

		//IFacade Interface
		public function registerModel(name:String, model:IModel):void
		{
			myModelTier.registerModel(name, model);
		}
		
		public function findModel(name:String):IModel
		{
			return myModelTier.findModel(name);
		}

		public function removeModel(name:String):IModel
		{
			return myModelTier.removeModel(name);
		}
		
		public function hasModel(name:String):Boolean
		{
			return myModelTier.hasModel(name);
		}
		
		public function removeAllModels():void
		{
			myModelTier.removeAllModels();
		}
		
		public function registerMediator(name:String, mediator:IMediator):void
		{
			myViweTier.registerMediator(name, mediator);
		}
		
		public function findMediator(name:String):IMediator
		{
			return myViweTier.findMediator(name);
		}
		
		public function removeMediator(name:String):IMediator
		{
			return myViweTier.removeMediator(name);
		}
		
		public function hasMediator(name:String):Boolean
		{
			return myViweTier.hasMediator(name);
		}
		
		public function removeAllMediator():void
		{
			myViweTier.removeAllMediator();
		}
		
		public function registerCommand(name:String, command:ICommand):void
		{
			myControllerTier.registerCommand(name, command);
		}
		
		public function findCommand(name:String):ICommand
		{
			return myControllerTier.findCommand(name);
		}
		
		public function removeCommand(name:String):ICommand
		{
			return myControllerTier.removeCommand(name);
		}
		
		public function hasCommand(name:String):Boolean
		{
			return myControllerTier.hasCommand(name);
		}

		public function removeAllCommand():void
		{
			myControllerTier.removeAllCommand();
		}
		
		public function registerService(name:String, service:IService):void
		{
			myServiceTier.registerService(name, service);
		}
		
		public function findService(name:String):IService
		{
			return myServiceTier.findService(name);
		}
		
		public function removeService(name:String):IService
		{
			return myServiceTier.removeService(name);
		}
		
		public function hasService(name:String):Boolean
		{
			return myServiceTier.hasService(name);
		}
		
		public function removeAllServices():void
		{
			myServiceTier.removeAllServices();
		}
		
		public function sendControllerCommand(name:String, 
											  commandId:String = null, 
											  commandData:Object = null, 
											  commandType:String = null):void
		{
			if(hasCommand(name))
			{
				findCommand(name).onCommand(commandId, commandData, commandType);
			}
		}

		public function sendMediatorCommand(name:String, 
											commandId:String = null, 
											commandData:Object = null, 
											commandType:String = null):void
		{
			if(hasMediator(name))
			{
				findMediator(name).onCommand(commandId, commandData, commandType);
			}
		}
		
		//Template Method
		protected function initialize():void
		{
			initializeFacade();
			initializeController();
			initializeModel();
			initializeService();
			initializeView();
		}
		
		protected function initializeFacade():void
		{
			myControllerTier = IControllerTier(registerBusinessLogicItem("ControllerTier", new ControllerTier()));
			myModelTier = IModelTier(registerBusinessLogicItem("ModelTier", new ModelTier()));
			myServiceTier = IServiceTier(registerBusinessLogicItem("ServiceTier", new ServiceTier()));
			myViweTier = IViewTier(registerBusinessLogicItem("IViewTier", new ViewTier()));
		}
		
		protected function initializeController():void {}
		protected function initializeModel():void {}
		protected function initializeService():void {}
		protected function initializeView():void {}
	}
}