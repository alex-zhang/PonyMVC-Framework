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
		public static const CONTROLLER_TIER_NAME:String = "ControllerTier";
		public static const MODEL_TIER_NAME:String = "ModelTier";
		public static const SERVICE_TIER_NAME:String = "ServiceTier";
		public static const VIEW_TIER_NAME:String = "ViewTier";
		
		protected var controllerTier:IControllerTier;
		protected var modelTier:IModelTier;
		protected var serviceTier:IServiceTier;
		protected var viweTier:IViewTier;

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
			modelTier.registerModel(name, model);
		}
		
		public function findModel(name:String):IModel
		{
			return modelTier.findModel(name);
		}

		public function removeModel(name:String):IModel
		{
			return modelTier.removeModel(name);
		}
		
		public function hasModel(name:String):Boolean
		{
			return modelTier.hasModel(name);
		}
		
		public function removeAllModels():void
		{
			modelTier.removeAllModels();
		}
		
		public function registerMediator(name:String, mediator:IMediator):void
		{
			viweTier.registerMediator(name, mediator);
		}
		
		public function findMediator(name:String):IMediator
		{
			return viweTier.findMediator(name);
		}
		
		public function removeMediator(name:String):IMediator
		{
			return viweTier.removeMediator(name);
		}
		
		public function hasMediator(name:String):Boolean
		{
			return viweTier.hasMediator(name);
		}
		
		public function removeAllMediator():void
		{
			viweTier.removeAllMediator();
		}
		
		public function registerCommand(name:String, command:ICommand):void
		{
			controllerTier.registerCommand(name, command);
		}
		
		public function findCommand(name:String):ICommand
		{
			return controllerTier.findCommand(name);
		}
		
		public function removeCommand(name:String):ICommand
		{
			return controllerTier.removeCommand(name);
		}
		
		public function hasCommand(name:String):Boolean
		{
			return controllerTier.hasCommand(name);
		}

		public function removeAllCommand():void
		{
			controllerTier.removeAllCommand();
		}
		
		public function registerService(name:String, service:IService):void
		{
			serviceTier.registerService(name, service);
		}
		
		public function findService(name:String):IService
		{
			return serviceTier.findService(name);
		}
		
		public function removeService(name:String):IService
		{
			return serviceTier.removeService(name);
		}
		
		public function hasService(name:String):Boolean
		{
			return serviceTier.hasService(name);
		}
		
		public function removeAllServices():void
		{
			serviceTier.removeAllServices();
		}

		//tier's communication mechanism.
		public function sendCommand(name:String, 
											  commandId:String = null, 
											  commandData:Object = null, 
											  commandType:String = null):void
		{
			controllerTier.sendCommand(name, commandId, commandData, commandType);
		}
		
		public function sendNotification(name:String, 
									commandId:String = null, 
									commandData:Object = null, 
									commandType:String = null):void
		{
			viweTier.sendNotification(name, commandId, commandData, commandType);
		}
		
		public function getMeditorProperty(name:String, propertyName:String):*
		{
			return BusinessLogicTierBase(viweTier).getLogicItemProperty(name, propertyName);
		}
		
		public function setMeditorProperty(name:String, propertyName:String, protertyValue:*):void
		{
			return BusinessLogicTierBase(viweTier).setLogicItemProperty(name, propertyName, protertyValue);
		}
		
		public function callMeditorMethod(name:String, methodName:String, methodArgs:Array = null):*
		{
			return BusinessLogicTierBase(viweTier).callLogicItemMethod(name, methodName, methodArgs);
		}
		
		public function getModelProperty(name:String, propertyName:String):*
		{
			return BusinessLogicTierBase(modelTier).getLogicItemProperty(name, propertyName);
		}
		
		public function setModelProperty(name:String, propertyName:String, protertyValue:*):void
		{
			return BusinessLogicTierBase(modelTier).setLogicItemProperty(name, propertyName, protertyValue);
		}
		
		public function callModelMethod(name:String, methodName:String, methodArgs:Array = null):*
		{
			return BusinessLogicTierBase(modelTier).callLogicItemMethod(name, methodName, methodArgs);
		}
		
		public function getServiceProperty(name:String, propertyName:String):*
		{
			return BusinessLogicTierBase(serviceTier).getLogicItemProperty(name, propertyName);
		}
		
		public function setServiceProperty(name:String, propertyName:String, protertyValue:*):void
		{
			return BusinessLogicTierBase(serviceTier).setLogicItemProperty(name, propertyName, protertyValue);
		}
		
		public function callServiceMethod(name:String, methodName:String, methodArgs:Array = null):*
		{
			return BusinessLogicTierBase(serviceTier).callLogicItemMethod(name, methodName, methodArgs);
		}

		//Template Method
		protected function initialize():void
		{
			controllerTier = IControllerTier(registerBusinessLogicItem(CONTROLLER_TIER_NAME, new ControllerTier()));
			modelTier = IModelTier(registerBusinessLogicItem(MODEL_TIER_NAME, new ModelTier()));
			serviceTier = IServiceTier(registerBusinessLogicItem(SERVICE_TIER_NAME, new ServiceTier()));
			viweTier = IViewTier(registerBusinessLogicItem(VIEW_TIER_NAME, new ViewTier()));

			initializeController();//cmd is first rigist.
			initializeModel();
			initializeService();
			initializeView();
		}
		
		protected function initializeController():void {}
		protected function initializeModel():void {}
		protected function initializeService():void {}
		protected function initializeView():void {}
	}
}