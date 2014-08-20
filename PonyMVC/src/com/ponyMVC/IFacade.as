package com.ponyMVC
{
	import com.ponyMVC.core.IBusinessLogicItem;

	public interface IFacade extends IBusinessLogicItem
	{
		function registerModel(name:String, model:IModel):void;
		function findModel(name:String):IModel;
		function removeModel(name:String):IModel;
		function hasModel(name:String):Boolean;
		function removeAllModels():void;
		function registerMediator(name:String, mediator:IMediator):void;
		function findMediator(name:String):IMediator;
		function removeMediator(name:String):IMediator;
		function hasMediator(name:String):Boolean;
		function removeAllMediator():void;
		function registerCommand(name:String, command:ICommand):void;
		function findCommand(name:String):ICommand;
		function removeCommand(name:String):ICommand;
		function hasCommand(name:String):Boolean;
		function removeAllCommand():void;
		function registerService(name:String, service:IService):void;
		function findService(name:String):IService;
		function removeService(name:String):IService;
		function hasService(name:String):Boolean;
		function removeAllServices():void;
		
		function sendCommand(name:String, 
									commandId:String = null, 
									commandData:Object = null, 
									commandType:String = null):void;

        function sendNotification(name:String,
                                  commandId:String = null,
                                  commandData:Object = null,
                                  commandType:String = null):void;
		
		function getMeditorProperty(name:String, propertyName:String):*;
		function setMeditorProperty(name:String, propertyName:String, protertyValue:*):void;
		function callMeditorMethod(name:String, methodName:String, methodArgs:Array = null):*
			
		function getModelProperty(name:String, propertyName:String):*;
		function setModelProperty(name:String, propertyName:String, protertyValue:*):void;
		function callModelMethod(name:String, methodName:String, methodArgs:Array = null):*;
		
		function getServiceProperty(name:String, propertyName:String):*;
		function setServiceProperty(name:String, propertyName:String, protertyValue:*):void;
		function callServiceMethod(name:String, methodName:String, methodArgs:Array = null):*;
	}
}