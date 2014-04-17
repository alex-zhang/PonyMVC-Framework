package com.ponyMVC.core
{
	import com.ponyMVC.IModel;

	public interface IModelTier extends IBusinessLogicItem
	{
		function registerModel(modelName:String, model:IModel):void;
		function findModel(modelName:String):IModel;
		function removeModel(modelName:String):IModel;
		function hasModel(modelName:String):Boolean;
		function removeAllModels():void;
	}
}